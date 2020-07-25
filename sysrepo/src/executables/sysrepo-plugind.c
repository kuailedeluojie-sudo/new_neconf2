/**
 * @file sysrepo-plugind.c
 * @author Michal Vasko <mvasko@cesnet.cz>
 * @brief sysrepo plugin daemon
 *
 * @copyright
 * Copyright 2018 Deutsche Telekom AG.
 * Copyright 2018 - 2019 CESNET, z.s.p.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define _POSIX_C_SOURCE 199309L /* sigaction */
#define _DEFAULT_SOURCE /* struct dirent.d_type */
#define _GNU_SOURCE /* asprintf */
#define _XOPEN_SOURCE 500 /* strdup */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdarg.h>
#include <signal.h>
#include <getopt.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dirent.h>
#include <fcntl.h>
#include <dlfcn.h>

#include "compat.h"
#include "sysrepo.h"
#include "bin_common.h"

/** protected flag for terminating sysrepo-plugind */
int loop_finish;
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

struct srpd_plugin_s {
    void *handle;
    srp_init_cb_t init_cb;
    srp_cleanup_cb_t cleanup_cb;
    void *private_data;
};

static void
version_print(void)
{
    printf(
        "sysrepo-plugind - sysrepo plugin daemon, compiled with libsysrepo v%s (SO v%s)\n"
        "\n",
        SR_VERSION, SR_SOVERSION
    );
}

static void
help_print(void)
{
    printf(
        "Usage:\n"
        "  sysrepo-plugind [-h] [-v <level>] [-d]\n"
        "\n"
        "Options:\n"
        "  -h, --help           Prints usage help.\n"
        "  -V, --version        Prints only information about sysrepo version.\n"
        "  -v, --verbosity <level>\n"
        "                       Change verbosity to a level (none, error, warning, info, debug) or number (0, 1, 2, 3, 4).\n"
        "  -d, --debug          Debug mode - is not daemonized and logs to stderr instead of syslog.\n"
        "\n"
        "Environment variable $SRPD_PLUGINS_PATH overwrites the default plugins path.\n"
        "\n"
    );
}

static void
error_print(int sr_error, const char *format, ...)
{
    va_list ap;
    char msg[2048];

    if (!sr_error) {
        sprintf(msg, "sysrepo-plugind error: %s\n", format);
    } else {
        sprintf(msg, "sysrepo-plugind error: %s (%s)\n", format, sr_strerror(sr_error));
    }

    va_start(ap, format);
    vfprintf(stderr, msg, ap);
    va_end(ap);
}

static void
signal_handler(int sig)
{
    switch (sig) {
    case SIGINT:
    case SIGQUIT:
    case SIGABRT:
    case SIGTERM:
    case SIGHUP:
        pthread_mutex_lock(&lock);

        /* stop the process */
        if (!loop_finish) {
            /* first attempt */
            loop_finish = 1;
            pthread_cond_signal(&cond);
        } else {
            /* second attempt */
            error_print(0, "Exiting without a proper cleanup");
            exit(EXIT_FAILURE);
        }
        pthread_mutex_unlock(&lock);
        break;
    default:
        /* unhandled signal */
        error_print(0, "Exiting on receiving an unhandled signal");
        exit(EXIT_FAILURE);
    }
}

static void
handle_signals(void)
{
    struct sigaction action;
    sigset_t block_mask;

    /* set the signal handler */
    sigfillset(&block_mask);
    action.sa_handler = signal_handler;
    action.sa_mask = block_mask;
    action.sa_flags = 0;
    sigaction(SIGINT, &action, NULL);
    sigaction(SIGQUIT, &action, NULL);
    sigaction(SIGABRT, &action, NULL);
    sigaction(SIGTERM, &action, NULL);
    sigaction(SIGHUP, &action, NULL);

    /* ignore */
    action.sa_handler = SIG_IGN;
    sigaction(SIGPIPE, &action, NULL);
    sigaction(SIGTSTP, &action, NULL);
    sigaction(SIGTTIN, &action, NULL);
    sigaction(SIGTTOU, &action, NULL);
}

static void
daemon_init(int debug, sr_log_level_t log_level)
{
    pid_t pid = 0, sid = 0;
    int fd = -1;

    if (debug) {
        handle_signals();
        sr_log_stderr(log_level);
        return;
    }

    /* fork off the parent process. */
    pid = fork();
    if (pid < 0) {
        error_print(0, "fork() failed (%s).", strerror(errno));
        exit(EXIT_FAILURE);
    }
    if (pid > 0) {
        /* this is the parent process, exit */
        exit(EXIT_SUCCESS);
    }

    /* handle signals properly */
    handle_signals();

    /* create a new session containing a single (new) process group */
    sid = setsid();
    if (sid < 0) {
        error_print(0, "setsid() failed (%s).", strerror(errno));
        exit(EXIT_FAILURE);
    }

    /* change the current working directory. */
    if ((chdir(SRPD_WORK_DIR)) < 0) {
        error_print(0, "chdir() failed (%s).", strerror(errno));
        exit(EXIT_FAILURE);
    }

    /* redirect standard files to /dev/null */
    fd = open("/dev/null", O_RDWR, 0);
    if (-1 != fd) {
        dup2(fd, STDIN_FILENO);
        dup2(fd, STDOUT_FILENO);
        dup2(fd, STDERR_FILENO);
        close(fd);
    }

    /* set verbosity */
    sr_log_syslog("sysrepo-plugind", log_level);
}

/* from src/common.c */
int
sr_mkpath(const char *path, mode_t mode)
{
    char *p, *dup;

    dup = strdup(path);
    for (p = strchr(dup + 1, '/'); p; p = strchr(p + 1, '/')) {
        *p = '\0';
        if (mkdir(dup, mode) == -1) {
            if (errno != EEXIST) {
                *p = '/';
                return -1;
            }
        }
        *p = '/';
    }
    free(dup);

    if (mkdir(path, mode) == -1) {
        if (errno != EEXIST) {
            return -1;
        }
    }

    return 0;
}

static int
load_plugins(struct srpd_plugin_s **plugins, int *plugin_count)
{
    void *mem, *handle;
    DIR *dir;
    struct dirent *ent;
    const char *plugins_dir;
    char *path;
    int rc = 0;

    *plugins = NULL;
    *plugin_count = 0;

    /* get plugins dir from environment variable, or use default one */
      /* bin_common.h.in #define SRPD_PLUGINS_PATH "@PLUGINS_PATH@"
     * @PLUGINS_PATH@在CMakeList.txt中定义，在编译时也可以自定义
     * CMakeList.txt对其定义如下
     * if(NOT PLUGINS_PATH)
     * set(PLUGINS_PATH             
     *    "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/sysrepo/plugins/" CACHE PATH
     *   "Sysrepo plugin daemon plugins path.")
     *   endif()
     *  用户不指定plugin的路径时，debian系统默认将plugin的动态库文件*.so安装 
     *    于/usr/lib/x86_64-linux-gnu/sysrepo/plugins/目录下，
     *  而Centos系统的默认安装路径为/usr/lib/sysrepo/plugins，在开发plugind时，安装路径也需要 
     *  指定到该路径下，否则，*.so找不到，则load不成功。
     */

    plugins_dir = getenv("SRPD_PLUGINS_PATH");
    if (!plugins_dir) {
        plugins_dir = SRPD_PLUGINS_PATH;
    }

    /* create the directory if it does not exist */
    /* access函数，:检查调用进程是否可以对指定的文件执行某种操作， F_OK文件是否存在
     * 本段代码是检测SRPD_PLUGINS_PATH目录是否存在，如果不存在，调用sr_mkpath创建目录，并设置*            
     * 目录的访问权限000777。本段代码是安全性代码，确保指定的路径存在。对于实际开发中，是通过编 
     * 译是指定，不存在路径的动态库无法安装。
     */

    if (access(plugins_dir, F_OK) == -1) {
        if (errno != ENOENT) {
            error_print(0, "Checking plugins dir existence failed (%s).", strerror(errno));
            return -1;
        }
        if (sr_mkpath(plugins_dir, 00777) == -1) {
            error_print(0, "Creating plugins dir \"%s\" failed (%s).", plugins_dir, strerror(errno));
            return -1;
        }
    }

    /* opendir函数，找开指定的目录文件，并返回DIR*形态的目录流，
     * 目录的读取与搜查也都需要此目录流 
     */

    dir = opendir(plugins_dir);
    if (!dir) {
        error_print(0, "Opening \"%s\" directory failed (%s).", plugins_dir, strerror(errno));
        return -1;
    }
        /*readdir函数，读取目录，返回参数dir目录流的下个目录进入点
     * 返回的结果是struct dirent的内容*/

    while ((ent = readdir(dir))) {
        if (!strcmp(ent->d_name, ".") || !strcmp(ent->d_name, "..")) {
            continue;
        }

        /* open the plugin */
         /*将SRPD_PLUGINS_PATH与也读取的目录文件名，组成一个完成的动态库路径，供后面操作。*/

        if (asprintf(&path, "%s/%s", plugins_dir, ent->d_name) == -1) {
            error_print(0, "asprintf() failed (%s).", strerror(errno));
            rc = -1;
            break;
        }
         /*RTLD_LAZY:暂缓决定，等有需要时再解出符号 
         *以RTLD_LAZY模式打开动态库，返回一个句柄给调用进程，如果失败，则返回。
         */
        handle = dlopen(path, RTLD_LAZY);
        if (!handle) {
            error_print(0, "Opening plugin \"%s\" failed (%s).", path, dlerror());
            free(path);
            rc = -1;
            break;
        }
        free(path);

        /* allocate new plugin */

        /* 分配一个新的plugin空间，并将新分配的men挂载plugins结构下*/
        mem = realloc(*plugins, (*plugin_count + 1) * sizeof **plugins);
        if (!mem) {
            error_print(0, "realloc() failed (%s).", strerror(errno));
            dlclose(handle);
            rc = -1;
            break;
        }
        *plugins = mem;

        /* find required functions */
                /* plugins结构中有两个必须的回调函数，一个是init_cb,另一个是cleanup_cb
         * 通过 void *dlsym(void *handle, const char* symbol);，
         * handle是使用dlopen函数之后返回的句柄，
         * symbol是要求获取的函数的名称。
         * SRP_INIT_CB定义如下：#define SRP_INIT_CB     "sr_plugin_init_cb"
         * SRP_CLEANUP_CB定义下：#define SRP_CLEANUP_CB  "sr_plugin_cleanup_cb"
         * 此两个CB函数，也就是在开发插件中必须实现的两个入口函数，如果不存在，则加载失败。
         */
        *(void **)&(*plugins)[*plugin_count].init_cb = dlsym(handle, SRP_INIT_CB);
        if (!(*plugins)[*plugin_count].init_cb) {
            error_print(0, "Failed to find function \"%s\" in plugin \"%s\".", SRP_INIT_CB, ent->d_name);
            dlclose(handle);
            rc = -1;
            break;
        }

        *(void **)&(*plugins)[*plugin_count].cleanup_cb = dlsym(handle, SRP_CLEANUP_CB);
        if (!(*plugins)[*plugin_count].cleanup_cb) {
            error_print(0, "Failed to find function \"%s\" in plugin \"%s\".", SRP_CLEANUP_CB, ent->d_name);
            dlclose(handle);
            rc = -1;
            break;
        }

        /* finally store the plugin */
        
        /*最后，本次so解析成功，保存本次so的解析结果，执行一下次目录文件的读取*/
        (*plugins)[*plugin_count].handle = handle;
        (*plugins)[*plugin_count].private_data = NULL;
        ++(*plugin_count);
    }
      /*目录文件读取结束，关闭目录读取流，返回的参考中有插件结构plugins。*/
    closedir(dir);
    return rc;
}

int
main(int argc, char** argv)
{
    struct srpd_plugin_s *plugins = NULL; //插件结构
    sr_conn_ctx_t *conn = NULL;          //sysrepo连接的上下文，该结构定义于common.h.in中
    sr_session_ctx_t *sess = NULL;       //sysrepo回话的上下文，该结构定义于conmon.h.in中
    sr_log_level_t log_level = SR_LL_ERR;  //默认的log等级，默认是ERR
    int plugin_count = 0, i, r, rc = EXIT_FAILURE, opt, debug = 0;
    //命令行支持的参数
    struct option options[] = {
        {"help",      no_argument,       NULL, 'h'},
        {"version",   no_argument,       NULL, 'V'},
        {"verbosity", required_argument, NULL, 'v'},
        {"debug",     no_argument,       NULL, 'd'},
        {NULL,        0,                 NULL, 0},
    };

    //整个while循环是解析命令的参数，例如，在调试时，输入"sysrepo-plugind -d -v 4"
    //为debug模式下的log级别DBG级，将打印全部的调试信息
    /* process options */
    opterr = 0;
    while ((opt = getopt_long(argc, argv, "hVv:d", options, NULL)) != -1) {
        switch (opt) {
        case 'h':
            version_print();
            help_print();
            rc = EXIT_SUCCESS;
            goto cleanup;
        case 'V':
            version_print();
            rc = EXIT_SUCCESS;
            goto cleanup;
        case 'v':
            if (!strcmp(optarg, "none")) {
                log_level = SR_LL_NONE;
            } else if (!strcmp(optarg, "error")) {
                log_level = SR_LL_ERR;
            } else if (!strcmp(optarg, "warning")) {
                log_level = SR_LL_WRN;
            } else if (!strcmp(optarg, "info")) {
                log_level = SR_LL_INF;
            } else if (!strcmp(optarg, "debug")) {
                log_level = SR_LL_DBG;
            } else if ((strlen(optarg) == 1) && (optarg[0] >= '0') && (optarg[0] <= '4')) {
                log_level = atoi(optarg);
            } else {
                error_print(0, "Invalid verbosity \"%s\"", optarg);
                goto cleanup;
            }
            break;
        case 'd':
            debug = 1;
            break;
        default:
            error_print(0, "Invalid option or missing argument: -%c", optopt);
            goto cleanup;
        }
    }

    /* check for additional argument */
    if (optind < argc) {
        error_print(0, "Redundant parameters");
        goto cleanup;
    }

    /* load plugins */
    //加载所有的pluginl，这是整个main函数的第一个核心点，关系用户开发的plugin是否正确加载
    if (load_plugins(&plugins, &plugin_count)) {
        goto cleanup;
    }

    /* daemonize, sysrepo-plugind no longer directly logs to stderr */
    daemon_init(debug, log_level);

    /* create connection (after we have forked so that our PID is correct) */
    if ((r = sr_connect(0, &conn)) != SR_ERR_OK) {
        error_print(r, "Failed to connect");
        goto cleanup;
    }

    /* create session */
    if ((r = sr_session_start(conn, SR_DS_RUNNING, &sess)) != SR_ERR_OK) {
        error_print(r, "Failed to start new session");
        goto cleanup;
    }

    /* init plugins */
     /*对所有已加载的plugin通过调用init_cb注册的回调初始化，这是整个main第二处核心点，与用户是强 
     *相关用户开发的插件，注册，订阅，初始化都通过init_cb，否则不能将sysrepol通信连接*/

    for (i = 0; i < plugin_count; ++i) {
        r = plugins[i].init_cb(sess, &plugins[i].private_data);
        if (r != SR_ERR_OK) {
            SRP_LOG_ERR("Plugin initialization failed (%s).", sr_strerror(r));
            goto cleanup;
        }
    }

    /* wait for a terminating signal */
    pthread_mutex_lock(&lock);
    while (!loop_finish) {
        pthread_cond_wait(&cond, &lock);
    }
    pthread_mutex_unlock(&lock);

    /* cleanup plugins */
    
    /* sysrepo-plugindf正常结束后，回收plugin初始化时分配的资源*/

    for (i = 0; i < plugin_count; ++i) {
        plugins[i].cleanup_cb(sess, plugins[i].private_data);
    }

    /* success */
    rc = EXIT_SUCCESS;
    
    /*结束后，回收已分配的全部资源*/
cleanup:
    for (i = 0; i < plugin_count; ++i) {
        dlclose(plugins[i].handle);
    }
    free(plugins);

    sr_disconnect(conn);
    return rc;
}
