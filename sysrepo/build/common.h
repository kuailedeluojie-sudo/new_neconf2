/**
 * @file common.h
 * @author Michal Vasko <mvasko@cesnet.cz>
 * @brief common routines header
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
#ifndef _COMMON_H
#define _COMMON_H

#define _GNU_SOURCE
#define _POSIX_C_SOURCE 200809L

#include <stdint.h>
#include <string.h>
#include <pthread.h>
#include <stdarg.h>
#include <errno.h>
#include <time.h>

#include <libyang/libyang.h>

#include "compat.h"
#include "sysrepo.h"

/*
 * If the compiler supports attribute to mark objects as hidden, mark all
 * objects as hidden and export only objects explicitly marked to be part of
 * the public API.
 */
#define API __attribute__((visibility("default")))

/** support for pthread_mutex_timedlock */
#define SR_HAVE_PTHREAD_MUTEX_TIMEDLOCK
#ifndef SR_HAVE_PTHREAD_MUTEX_TIMEDLOCK
int pthread_mutex_timedlock(pthread_mutex_t *mutex, const struct timespec *abstime);
#endif

/** use access() if eaccess() is not available (it may adversely affect access control, however) */
#define SR_HAVE_EACCESS
#ifndef SR_HAVE_EACCESS
# define eaccess access
#endif

/** atomic variables */
/* #undef SR_HAVE_STDATOMIC */
#ifdef SR_HAVE_STDATOMIC
# include <stdatomic.h>

# define ATOMIC_T atomic_uint_fast32_t
# define ATOMIC_T_MAX UINT_FAST32_MAX

# define ATOMIC_STORE_RELAXED(var, x) atomic_store_explicit(&(var), x, memory_order_relaxed)
# define ATOMIC_LOAD_RELAXED(var) atomic_load_explicit(&(var), memory_order_relaxed)
# define ATOMIC_INC_RELAXED(var) atomic_fetch_add_explicit(&(var), 1, memory_order_relaxed)
# define ATOMIC_DEC_RELAXED(var) atomic_fetch_sub_explicit(&(var), 1, memory_order_relaxed)
#else
# define ATOMIC_T uint32_t
# define ATOMIC_T_MAX UINT32_MAX

# define ATOMIC_STORE_RELAXED(var, x) ((var) = (x))
# define ATOMIC_LOAD_RELAXED(var) (var)
# define ATOMIC_INC_RELAXED(var) __sync_fetch_and_add(&(var), 1)
# define ATOMIC_DEC_RELAXED(var) __sync_fetch_and_sub(&(var), 1)
#endif

/** macro for mutex align check */
#define SR_MUTEX_ALIGN_CHECK(mutex) ((uintptr_t)mutex % sizeof(void *))

/** macro for cond align check */
#define SR_COND_ALIGN_CHECK(cond) ((uintptr_t)cond % sizeof(void *))

/** macro for checking datastore type */
#define SR_IS_CONVENTIONAL_DS(ds) ((ds == SR_DS_STARTUP) || (ds == SR_DS_RUNNING) || (ds == SR_DS_CANDIDATE))

/** macro for all datastore types count */
#define SR_DS_COUNT 4

/** macro for checking session type */
#define SR_IS_EVENT_SESS(session) (session->ev != SR_SUB_EV_NONE)

/** macro for getting the first SHM module */
#define SR_FIRST_SHM_MOD(main_shm_addr) ((sr_mod_t *)(((char *)main_shm_addr) + sizeof(sr_main_shm_t)))

/** macro for traversing main SHM modules */
#define SR_SHM_MOD_FOR(main_shm_addr, main_shm_size, shm_mod) \
    for (shm_mod = SR_FIRST_SHM_MOD(main_shm_addr); (char *)shm_mod != main_shm_addr + main_shm_size; ++shm_mod)

/** macro for learning main SHM index of a SHM module */
#define SR_SHM_MOD_IDX(shm_mod, main_shm) (((((char *)(shm_mod)) - (main_shm).addr) - sizeof(sr_main_shm_t)) / sizeof(sr_mod_t))

/* macro for getting aligned SHM size */
#define SR_SHM_SIZE(size) ((size) + ((~(size) + 1) & (SR_SHM_MEM_ALIGN - 1)))

/* macro for getting lydmods lock from a connection */
#define SR_SHM_LYDMODS_LOCK(conn) ((sr_main_shm_t *)(conn)->main_shm.addr)->lydmods_lock

/** name of sysrepo YANG module */
#define SR_YANG_MOD "sysrepo"

/** implemented ietf-yang-library revision */
#define SR_YANGLIB_REVISION 2019-01-04

/** main sysrepo repository path; prefix of all other paths by default */
#define SR_REPO_PATH "/home/mo/share/netconf2_new/sysrepo/build/repository"

/** environment variable overriding the compiled-in value */
#define SR_REPO_PATH_ENV "SYSREPO_REPOSITORY_PATH"

/** if not set, defaults to "SR_REPO_PATH/data" */
#define SR_STARTUP_PATH ""

/** if not set, defaults to "SR_REPO_PATH/data/notif" */
#define SR_NOTIFICATION_PATH ""

/** if not set, defaults to "SR_REPO_PATH/yang" */
#define SR_YANG_PATH ""

/** where SHM files are stored */
#define SR_SHM_DIR "/dev/shm"

/** default prefix for SHM files in /dev/shm */
#define SR_SHM_PREFIX_DEFAULT "sr"

/** environment variable for setting a custom prefix for SHM files */
#define SR_SHM_PREFIX_ENV "SYSREPO_SHM_PREFIX"

/** all ext SHM item sizes will be aligned to this number (B) */
#define SR_SHM_MEM_ALIGN (sizeof(void *))

/** notification file will never exceed this size (kB) */
#define SR_EV_NOTIF_FILE_MAX_SIZE 1024

/** maximum ext SHM wasted memory (B) */
#define SR_SHM_WASTED_MAX_MEM 4096

/** maximum time read lock can be held on rwlocks; used when unlocking (ms) */
#define SR_RWLOCK_READ_TIMEOUT 100

/** timeout for processing all events on all subscriptions of one subscriber thread; used when modifying subscriptions (s) */
#define SR_SUB_EVENT_LOOP_TIMEOUT 30

/** timeout for locking subscriptions lock, used when modifying subscriptions (ms) */
#define SR_SUB_SUBS_LOCK_TIMEOUT 100

/** timeout for locking notification buffer lock, used when adding/removing notifications (ms) */
#define SR_NOTIF_BUF_LOCK_TIMEOUT 100

/** timeout for locking main SHM connection state (ms) */
#define SR_CONN_STATE_LOCK_TIMEOUT 100

/** timeout for locking main SHM and subscription SHM; maximum time an API call (sr_apply_changes()) is expected to take (s) */
#define SR_MAIN_LOCK_TIMEOUT 15

/** timeout for locking (data of) a module; maximum time a module write lock is expected to be held (s) */
#define SR_MOD_LOCK_TIMEOUT 2

/** timeout for locking module cache (s) */
#define SR_MOD_CACHE_LOCK_TIMEOUT 5

/** default timeout for change subscription callback (ms) */
#define SR_CHANGE_CB_TIMEOUT 5000

/** default timeout for operational subscription callback (ms) */
#define SR_OPER_CB_TIMEOUT 5000

/** default timeout for RPC/action subscription callback (ms) */
#define SR_RPC_CB_TIMEOUT 2000

/** permissions of main SHM lock file and main SHM itself */
#define SR_MAIN_SHM_PERM 00666

/** permissions of all subscription SHMs */
#define SR_SUB_SHM_PERM 00666

/** permissions of all event pipes (only owner read, anyone else write */
#define SR_EVPIPE_PERM 00622

/** permissions of directories for sysrepo files */
#define SR_DIR_PERM 00777

/** permissions of used YANG modules */
#define SR_YANG_PERM 00664

/** permissions of stored notifications and data files */
#define SR_FILE_PERM 00600

/** permissions of data files of internal modules */
#define SR_INT_FILE_PERM 00666

/** permission of data files of sysrepo-monitoring internal module */
#define SR_MON_INT_FILE_PERM 00600

/** initial length of message buffer (B) */
#define SR_MSG_LEN_START 128

/** default operational origin for operational data (push/pull) */
#define SR_OPER_ORIGIN "unknown"

/** default operational origin for enabled running data */
#define SR_CONFIG_ORIGIN "intended"

/*
 * Internal declarations + definitions
 */

extern char sysrepo_yang[];

typedef struct sr_mod_s sr_mod_t;

typedef struct sr_mod_data_dep_s sr_mod_data_dep_t;

/** static initializer of the shared memory structure */
#define SR_SHM_INITIALIZER {.fd = -1, .size = 0, .addr = NULL}

/** initializer of mod_info structure */
#define SR_MODINFO_INIT(mi, c, d, d2) mi.ds = (d); mi.ds2 = (d2); mi.diff = NULL; mi.data = NULL; \
        mi.data_cached = 0; mi.conn = (c); mi.mods = NULL; mi.mod_count = 0

/**
 * @brief Generic shared memory information structure.
 */
typedef struct sr_shm_s {
    int fd;                         /**< Shared memory file desriptor. */
    size_t size;                    /**< Shared memory mapping current size. */
    char *addr;                     /**< Shared memory mapping address. */
} sr_shm_t;

/**
 * @brief Session information structure.
 */
typedef struct sr_sid_s {
    uint32_t sr;                    /**< Sysrepo session ID. */
    uint32_t nc;                    /**< NETCONF session ID. */
    char *user;                     /**< Sysrepo user. */
} sr_sid_t;

/**
 * @brief Sysrepo read-write lock.
 */
typedef struct sr_rwlock_s {
    pthread_mutex_t mutex;          /**< Lock mutex. */
    pthread_cond_t cond;            /**< Lock condition variable. */
    uint16_t readers;               /**< Current read-locked users. */
} sr_rwlock_t;

struct modsub_change_s;
struct modsub_oper_s;
struct opsub_rpc_s;
struct modsub_notif_s;

#include "replay.h"
#include "modinfo.h"
#include "edit_diff.h"
#include "lyd_mods.h"
#include "shm.h"
#include "log.h"

/*
 * Private definitions of public declarations
 */

/**
 * @brief Sysrepo connection.
 */
struct sr_conn_ctx_s {
    struct ly_ctx *ly_ctx;          /**< Libyang context, also available to user. */
    sr_conn_options_t opts;         /**< Connection options. */
    sr_diff_check_cb diff_check_cb; /**< Connection user diff check callback. */

    pthread_mutex_t ptr_lock;       /**< Session-shared lock for accessing pointers to sessions. */
    sr_session_ctx_t **sessions;    /**< Array of sessions for this connection. */
    uint32_t session_count;         /**< Session count. */

    int main_create_lock;           /**< Process-shared file lock for creating main/ext SHM. */
    sr_rwlock_t ext_remap_lock;     /**< Session-shared lock only for remapping ext SHM
                                         (to sync concurrent SHM READ locks). */
    sr_shm_t main_shm;              /**< Main SHM structure. */
    sr_shm_t ext_shm;               /**< External SHM structure (all stored offsets point here). */

    struct sr_mod_cache_s {
        sr_rwlock_t lock;           /**< Session-shared lock for accessing the module cache. */
        struct lyd_node *data;      /**< Data of all cached modules, */

        struct {
            const struct lys_module *ly_mod;    /**< Libyang module in the cache. */
            uint32_t ver;           /**< Version of the module data in the cache, 0 is not valid */
        } *mods;                    /**< Array of cached modules. */
        uint32_t mod_count;         /**< Cached modules count. */
    } mod_cache;                    /**< Module running data cache. */
};

/**
 * @brief Sysrepo session.
 */
struct sr_session_ctx_s {
    sr_conn_ctx_t *conn;            /**< Connection used for creating this session. */
    sr_datastore_t ds;              /**< Datastore of the session. */
    sr_sub_event_t ev;              /**< Event of a callback session. ::SR_EV_NONE for standard user sessions. */
    sr_sid_t sid;                   /**< Session information. */
    sr_error_info_t *err_info;      /**< Session error information. */

    pthread_mutex_t ptr_lock;       /**< Lock for accessing pointers to subscriptions. */
    sr_subscription_ctx_t **subscriptions;  /**< Array of subscriptions of this session. */
    uint32_t subscription_count;    /**< Subscription count. */

    struct {
        struct lyd_node *edit;      /**< Prepared edit data tree. */
        struct lyd_node *diff;      /**< Diff data tree, used for module change iterator. */
    } dt[SR_DS_COUNT];              /**< Session-exclusive prepared changes. */

    struct sr_sess_notif_buf {
        ATOMIC_T thread_running;    /**< Flag whether the notification buffering thread of this session is running. */
        pthread_t tid;              /**< Thread ID of the thread. */
        sr_rwlock_t lock;           /**< Lock for accessing thread_running and the notification buffer
                                         (READ-lock is not used). */
        struct sr_sess_notif_buf_node {
            char *notif_lyb;        /**< Buffered notification to be stored in LYB format. */
            time_t notif_ts;        /**< Buffered notification timestamp. */
            const struct lys_module *notif_mod; /**< Buffered notification modules. */
            struct sr_sess_notif_buf_node *next;    /**< Next stored notification buffer node. */
        } *first;                   /**< First stored notification buffer node. */
        struct sr_sess_notif_buf_node *last;    /**< Last stored notification buffer node. */
    } notif_buf;                    /**< Notification buffering attributes. */
};

/**
 * @brief Sysrepo subscription.
 */
struct sr_subscription_ctx_s {
    sr_conn_ctx_t *conn;            /**< Connection of the subscription. */
    uint32_t evpipe_num;            /**< Event pipe number of this subscription structure. */
    int evpipe;                     /**< Event pipe opened for reading. */
    ATOMIC_T thread_running;        /**< Flag whether the thread handling this subscription is running. */
    pthread_t tid;                  /**< Thread ID of the handler thread. */
    pthread_mutex_t subs_lock;      /**< Session-shared lock for accessing specific subscriptions. */

    struct modsub_change_s {
        char *module_name;          /**< Module of the subscriptions. */
        sr_datastore_t ds;          /**< Datastore of the subscriptions. */
        struct modsub_changesub_s {
            char *xpath;            /**< Subscription XPath. */
            uint32_t priority;      /**< Subscription priority. */
            sr_subscr_options_t opts;   /**< Subscription options. */
            sr_module_change_cb cb; /**< Subscription callback. */
            void *private_data;     /**< Subscription callback private data. */
            sr_session_ctx_t *sess; /**< Subscription session. */

            uint32_t request_id;    /**< Request ID of the last processed request. */
            sr_sub_event_t event;   /**< Type of the last processed event. */
        } *subs;                    /**< Configuration change subscriptions for each XPath. */
        uint32_t sub_count;         /**< Configuration change module XPath subscription count. */

        sr_shm_t sub_shm;           /**< Subscription SHM. */
    } *change_subs;                 /**< Change subscriptions for each module. */
    uint32_t change_sub_count;      /**< Change module subscription count. */

    struct modsub_oper_s {
        char *module_name;          /**< Module of the subscriptions. */
        struct modsub_opersub_s {
            char *xpath;            /**< Subscription XPath. */
            sr_oper_get_items_cb cb;    /**< Subscription callback. */
            void *private_data;     /**< Subscription callback private data. */
            sr_session_ctx_t *sess; /**< Subscription session. */

            uint32_t request_id;    /**< Request ID of the last processed request. */
            sr_shm_t sub_shm;       /**< Subscription SHM. */
        } *subs;                    /**< Operational subscriptions for each XPath. */
        uint32_t sub_count;         /**< Operational module XPath subscription count. */
    } *oper_subs;                   /**< Operational subscriptions for each module. */
    uint32_t oper_sub_count;        /**< Operational module subscription count. */

    struct modsub_notif_s {
        char *module_name;          /**< Module of the subscriptions. */
        struct modsub_notifsub_s {
            char *xpath;            /**< Subscription XPath. */
            time_t start_time;      /**< Subscription start time. */
            int replayed;           /**< Flag whether the subscription replay is finished. */
            time_t stop_time;       /**< Subscription stop time. */
            sr_event_notif_cb cb;   /**< Subscription value callback. */
            sr_event_notif_tree_cb tree_cb; /**< Subscription tree callback. */
            void *private_data;     /**< Subscription callback private data. */
            sr_session_ctx_t *sess; /**< Subscription session. */
        } *subs;                    /**< Notification subscriptions for each XPath. */
        uint32_t sub_count;         /**< Notification module XPath subscription count. */

        uint32_t request_id;    /**< Request ID of the last processed request. */
        sr_shm_t sub_shm;           /**< Subscription SHM. */
    } *notif_subs;                  /**< Notification subscriptions for each module. */
    uint32_t notif_sub_count;       /**< Notification module subscription count. */

    struct opsub_rpc_s {
        char *op_path;              /**< Subscription RPC/action path. */
        struct opsub_rpcsub_s {
            char *xpath;            /**< Subscription XPath. */
            uint32_t priority;      /**< Subscription priority. */
            sr_rpc_cb cb;           /**< Subscription value callback. */
            sr_rpc_tree_cb tree_cb; /**< Subscription tree callback. */
            void *private_data;     /**< Subscription callback private data. */
            sr_session_ctx_t *sess; /**< Subscription session. */

            uint32_t request_id;    /**< Request ID of the last processed request. */
            sr_sub_event_t event;   /**< Type of the last processed event. */
        } *subs;                    /**< RPC/action subscription for each XPath. */
        uint32_t sub_count;         /**< RPC/action XPath subscription count. */

        sr_shm_t sub_shm;           /**< Subscription SHM. */
    } *rpc_subs;                    /**< RPC/action subscriptions for each operation. */
    uint32_t rpc_sub_count;         /**< RPC/action operation subscription count. */
};

/**
 * @brief Change iterator.
 */
struct sr_change_iter_s {
    struct lyd_node *diff;          /**< Optional copied diff that set items point into. */
    struct ly_set *set;             /**< Set of all the selected diff nodes. */
    uint32_t idx;                   /**< Index of the next change. */
};

/*
 * Subscription functions
 */

/**
 * @brief Add a change subscription into a subscription structure.
 *
 * @param[in] sess Subscription session.
 * @param[in] mod_name Subscription module name.
 * @param[in] xpath Subscription XPath.
 * @param[in] change_cb Subscription callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in] priority Subscription priority.
 * @param[in] sub_opts Subscription options.
 * @param[in,out] subs Subscription structure.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_sub_change_add(sr_session_ctx_t *sess, const char *mod_name, const char *xpath, sr_module_change_cb change_cb,
        void *private_data, uint32_t priority, sr_subscr_options_t sub_opts, sr_subscription_ctx_t *subs);

/**
 * @brief Delete a change subscription from a subscription structure.
 *
 * @param[in] mod_name Subscription module name.
 * @param[in] xpath Subscription XPath.
 * @param[in] ds Subscription datastore.
 * @param[in] change_cb Subscription callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in] priority Subscription priority.
 * @param[in] sub_opts Subscription options.
 * @param[in,out] subs Subscription structure.
 */
void sr_sub_change_del(const char *mod_name, const char *xpath, sr_datastore_t ds, sr_module_change_cb change_cb,
        void *private_data, uint32_t priority, sr_subscr_options_t sub_opts, sr_subscription_ctx_t *subs);

/**
 * @brief Add an operational subscription into a subscription structure.
 *
 * @param[in] sess Subscription session.
 * @param[in] mod_name Subscription module name.
 * @param[in] xpath Subscription XPath.
 * @param[in] oper_cb Subscription callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in,out] subs Subscription structure.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_sub_oper_add(sr_session_ctx_t *sess, const char *mod_name, const char *xpath,
        sr_oper_get_items_cb oper_cb, void *private_data, sr_subscription_ctx_t *subs);

/**
 * @brief Delete an operational subscription from a subscription structure.
 *
 * @param[in] mod_name Subscription module name.
 * @param[in] xpath Subscription XPath.
 * @param[in,out] subs Subscription structure.
 */
void sr_sub_oper_del(const char *mod_name, const char *xpath, sr_subscription_ctx_t *subs);

/**
 * @brief Add a notification subscription into a subscription structure.
 *
 * @param[in] sess Subscription session.
 * @param[in] mod_name Subscription module name.
 * @param[in] xpath Subscription XPath.
 * @param[in] start_time Subscription start time.
 * @param[in] stop_time Subscription stop time.
 * @param[in] notif_cb Subscription value callback.
 * @param[in] notif_tree_cb Subscription tree callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in,out] subs Subscription structure.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_sub_notif_add(sr_session_ctx_t *sess, const char *mod_name, const char *xpath, time_t start_time,
        time_t stop_time, sr_event_notif_cb notif_cb, sr_event_notif_tree_cb notif_tree_cb, void *private_data,
        sr_subscription_ctx_t *subs);

/**
 * @brief Delete a notification subscription from a subscription structure.
 *
 * @param[in] mod_name Subscription module name.
 * @param[in] xpath Subscription XPath.
 * @param[in] start_time Subscription start time.
 * @param[in] stop_time Subscription stop time.
 * @param[in] notif_cb Subscription value callback.
 * @param[in] notif_tree_cb Subscription tree callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in,out] subs Subscription structure.
 * @param[in] has_subs_lock Whether the caller already holds subs lock.
 */
void sr_sub_notif_del(const char *mod_name, const char *xpath, time_t start_time, time_t stop_time, sr_event_notif_cb notif_cb,
        sr_event_notif_tree_cb notif_tree_cb, void *private_data, sr_subscription_ctx_t *subs, int has_subs_lock);

/**
 * @brief Add an RPC subscription into a subscription structure.
 *
 * @param[in] sess Subscription session.
 * @param[in] op_path Subscription operation path.
 * @param[in] xpath Subscription XPath.
 * @param[in] rpc_cb Subscription value callback.
 * @param[in] rpc_tree_cb Subscription tree callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in] priority Subscription priority.
 * @param[in,out] subs Subscription structure.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_sub_rpc_add(sr_session_ctx_t *sess, const char *op_path, const char *xpath, sr_rpc_cb rpc_cb,
        sr_rpc_tree_cb rpc_tree_cb, void *private_data, uint32_t priority, sr_subscription_ctx_t *subs);

/**
 * @brief Delete an RPC subscription from a subscription structure.
 *
 * @param[in] op_path Subscription operation path.
 * @param[in] xpath Subscription XPath.
 * @param[in] rpc_cb Subscription value callback.
 * @param[in] rpc_tree_cb Subscription tree callback.
 * @param[in] private_data Subscription callback private data.
 * @param[in] priority Subscription priority.
 * @param[in,out] subs Subscription structure.
 */
void sr_sub_rpc_del(const char *op_path, const char *xpath, sr_rpc_cb rpc_cb, sr_rpc_tree_cb rpc_tree_cb,
        void *private_data, uint32_t priority, sr_subscription_ctx_t *subs);

/**
 * @brief Count subscriptions of session \p sess in subscriptions structure \p subs.
 *
 * @param[in] sess Subscription session.
 * @param[in] subs Session subscription.
 * @return Number of session subscriptions.
 */
int sr_subs_session_count(sr_session_ctx_t *sess, sr_subscription_ctx_t *subs);

/**
 * @brief Delete all subscriptions in \p subs of session \p sess.
 *
 * @param[in] sess Subscription session.
 * @param[in] subs Session subscription.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_subs_session_del(sr_session_ctx_t *sess, sr_subscription_ctx_t *subs);

/**
 * @brief Delete all subscriptions in \p subs of all the sessions.
 *
 * @param[in,out] subs Subscription structure.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_subs_del_all(sr_subscription_ctx_t *subs);

/**
 * @brief Find notifications subscribers for a module.
 *
 * @param[in] conn Connection to use.
 * @param[in] mod_name Module name.
 * @param[out] notif_subs Notification subscriptions.
 * @param[out] notif_sub_count Number of subscribers.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_notif_find_subscriber(sr_conn_ctx_t *conn, const char *mod_name, sr_mod_notif_sub_t **notif_subs,
        uint32_t *notif_sub_count);

/**
 * @brief Call notification callback for a notification.
 *
 * @param[in] conn Connection to use.
 * @param[in] cb Value callback.
 * @param[in] tree_cb Tree callback.
 * @param[in] private_data Callback private data.
 * @param[in] notif_type Notification type.
 * @param[in] notif_op Notification node of the notification (relevant for nested notifications).
 * @param[in] notif_ts Timestamp of when the notification was generated.
 * @param[in] sid Sysrepo session ID.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_notif_call_callback(sr_conn_ctx_t *conn, sr_event_notif_cb cb, sr_event_notif_tree_cb tree_cb,
        void *private_data, const sr_ev_notif_type_t notif_type, const struct lyd_node *notif_op, time_t notif_ts,
        sr_sid_t sid);

/*
 * Utility functions
 */

/**
 * @brief Add a generic pointer to a ptr array.
 *
 * @param[in] ptr_lock Pointers lock.
 * @param[in,out] ptrs Pointer array to enlarge.
 * @param[in,out] ptr_count Pointer array count.
 * @param[in] add_ptr Pointer to add.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_ptr_add(pthread_mutex_t *ptr_lock, void ***ptrs, uint32_t *ptr_count, void *add_ptr);

/**
 * @brief Delete a generic pointer from a ptr array.
 *
 * @param[in,out] ptrs Pointer array to delete from.
 * @param[in,out] ptr_count Pointer array count.
 * @param[in] del_ptr Pointer to delete.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_ptr_del(pthread_mutex_t *ptr_lock, void ***ptrs, uint32_t *ptr_count, void *del_ptr);

/**
 * @brief Clear a temporary (callback) session.
 *
 * @param[in] tmp_sess Session to clear.
 */
void sr_clear_sess(sr_session_ctx_t *tmp_sess);

/**
 * @brief Wrapper for libyang ly_ctx_new().
 *
 * @param[out] ly_ctx libyang context.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_ly_ctx_new(struct ly_ctx **ly_ctx);

/**
 * @brief Remove module YANG file.
 *
 * @param[in] name Module name.
 * @param[in] revision Module revision, NULL if none.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_remove_module_file(const char *name, const char *revision);

/**
 * @brief Create (print) YANG module file and all of its submodules.
 *
 * @param[in] ly_mod Module to print.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_store_module_files(const struct lys_module *ly_mod);

/**
 * @brief Unlink startup, running, and candidate files of a module.
 *
 * @param[in] mod_name Module name.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_remove_data_files(const char *mod_name);

/**
 * @brief Check whether a module is internal libyang or sysrepo module.
 *
 * @param[in] ly_mod Module to check.
 * @return 0 if not, non-zero if it is.
 */
int sr_module_is_internal(const struct lys_module *ly_mod);

/**
 * @brief Create startup file for a module.
 *
 * @param[in] ly_mod Module to create startup file for.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_create_startup_file(const struct lys_module *ly_mod);

/**
 * @brief Create all module import and include files, recursively.
 *
 * @param[in] ly_mod libyang module whose imports and includes to create.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_create_module_imps_incs_r(const struct lys_module *ly_mod);

/**
 * @brief Get the path the main SHM.
 *
 * @param[out] path Created path. Should be freed by the caller.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_main_shm(char **path);

/**
 * @brief Get the path the external SHM.
 *
 * @param[out] path Created path. Should be freed by the caller.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_ext_shm(char **path);

/**
 * @brief Get the path to a subscription SHM.
 *
 * @param[in] mod_name Module name.
 * @param[in] suffix1 First suffix.
 * @param[in] suffix2 Second suffix, none if equals -1.
 * @param[in] abs_path Whether to return absolute path or SHM path (name).
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_sub_shm(const char *mod_name, const char *suffix1, int64_t suffix2, int abs_path, char **path);

/**
 * @brief Get the path to a volatile datastore SHM.
 *
 * @param[in] mod_name Module name.
 * @param[in] ds Target datastore.
 * @param[in] abs_path Whether to return absolute path or SHM path (name).
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_ds_shm(const char *mod_name, sr_datastore_t ds, int abs_path, char **path);

/**
 * @brief Get the path to an event pipe.
 *
 * @param[in] evpipe_num Event pipe number.
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_evpipe(uint32_t evpipe_num, char **path);

/**
 * @brief Get the path to startup files directory.
 *
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_startup_dir(char **path);

/**
 * @brief Get the path to notification files directory.
 *
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_notif_dir(char **path);

/**
 * @brief Get the path to YANG module files directory.
 *
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_yang_dir(char **path);

/**
 * @brief Get the path to a module startup file.
 *
 * @param[in] mod_name Module name.
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_startup_file(const char *mod_name, char **path);

/**
 * @brief Get the path to a module notification file.
 *
 * @param[in] mod_name Module name.
 * @param[in] from_ts Timestamp of the first stored notification.
 * @param[in] to_ts Timestamp of the last stored notification.
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_notif_file(const char *mod_name, time_t from_ts, time_t to_ts, char **path);

/**
 * @brief Get the path to a YANG module file.
 *
 * @param[in] mod_name Module name.
 * @param[in] mod_rev Module revision.
 * @param[out] path Created path.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_path_yang_file(const char *mod_name, const char *mod_rev, char **path);

/**
 * @brief Remove any leftover event pipes after crashed subscriptions.
 */
void sr_remove_evpipes(void);

/**
 * @brief Get the UID of a user or vice versa.
 *
 * @param[in,out] uid UID.
 * @param[in,out] user User name.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_get_pwd(uid_t *uid, char **user);

/**
 * @brief Change mode (permissions) and/or owner and group of a file.
 *
 * @param[in] path File path.
 * @param[in] owner New owner if not NULL.
 * @param[in] group New group if not NULL.
 * @param[in] perm New permissions if not 0.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_chmodown(const char *path, const char *owner, const char *group, mode_t perm);

/**
 * @brief Check whether the effective user has permissions for a module.
 *
 * @param[in] mod_name Module to check.
 * @param[in] wr Check write access if set, otherwise read.
 * @param[in,out] has_access If set, it will contain the result of the access check.
 * If not set, denied access returns an error.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_perm_check(const char *mod_name, int wr, int *has_access);

/**
 * @brief Get mode (permissions) and/or owner and group of a module.
 *
 * @param[in] mod_name Module name.
 * @param[in] ds Datastore file to check, for general module access permissions, startup should always be used.
 * @param[in,out] owner Module owner if not NULL.
 * @param[in,out] group Module group if not NULL.
 * @param[in,out] perm Module permissions if not NULL;
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_perm_get(const char *mod_name, sr_datastore_t ds, char **owner, char **group, mode_t *perm);

/**
 * @brief Check whether a file exists.
 *
 * @param[in] path Path to the file.
 * @return 0 if file does not exist, non-zero if it exists.
 */
int sr_file_exists(const char *path);

/**
 * @brief Check whether a process exists.
 *
 * @param[in] pid Process PID.
 * @return 0 if not, non-zero if it exists.
 */
int sr_process_exists(pid_t pid);

/**
 * @brief Get current time with an offset.
 *
 * @param[out] ts Current time offset by \p add_ms.
 * @param[in] add_ms Number os milliseconds added.
 */
void sr_time_get(struct timespec *ts, uint32_t add_ms);

/**
 * @brief Remap and possibly resize a SHM. Needs WRITE lock for resizing,
 * otherwise READ lock is fine.
 *
 * @param[in] shm SHM structure to remap.
 * @param[in] new_shm_size Resize SHM to this size, if 0 read the size of the SHM file.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_shm_remap(sr_shm_t *shm, size_t new_shm_size);

/**
 * @brief Clear a SHM structure.
 *
 * @param[in] shm SHM structure to clear.
 */
void sr_shm_clear(sr_shm_t *shm);

/**
 * @brief Copy memory into SHM.
 *
 * @param[in] shm_addr Mapped SHM address.
 * @param[in] src Source memory.
 * @param[in] size Size of source memory.
 * @param[in,out] shm_end Current SHM end pointer, it is updated.
 * @return Offset of the copied memory in SHM.
 */
off_t sr_shmcpy(char *shm_addr, const void *src, size_t size, char **shm_end);

/**
 * @brief Copy string into SHM.
 *
 * @param[in] shm_addr Mapped SHM address.
 * @param[in] str Source string.
 * @param[in,out] shm_end Current SHM end pointer, it is updated.
 * @return Offset of the copied memory in SHM.
 */
off_t sr_shmstrcpy(char *shm_addr, const char *str, char **shm_end);

/**
 * @brief Get required memory in ext SHM for a string.
 *
 * @param[in] str String to be examined.
 * @return Number of required bytes.
 */
size_t sr_strshmlen(const char *str);

/**
 * @brief Realloc for an array in SHM adding one new item. The array offset and item count is properly
 * updated in the ext SHM.
 *
 * May remap ext SHM!
 *
 * @param[in] shm_ext Ext SHM structure.
 * @param[in] shm_array Pointer to array in a SHM.
 * @param[in] shm_count Pointer to array item count in a SHM.
 * @param[in] in_ext_shm Whether @p shm_array and @p shm_count are stored in ext SHM or not (in main SHM).
 * In case they are in ext SHM, they should no longer be used after this function as they may have been remapped!
 * @param[in] item_size Array item size.
 * @param[in] add_idx Index of the new item, -1 for adding at the end.
 * @param[out] new_item Pointer to the new item.
 * @param[in] dyn_attr_size Optional dynamic attribute size to allocate as well.
 * @param[out] dyn_attr_off Optional allocated dynamic attribute offset.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_shmrealloc_add(sr_shm_t *shm_ext, off_t *shm_array, uint16_t *shm_count, int in_ext_shm,
        size_t item_size, int32_t add_idx, void **new_item, size_t dyn_attr_size, off_t *dyn_attr_off);

/**
 * @brief Realloc for an array in SHM deleting one item.
 *
 * @param[in] ext_shm_addr Ext SHM address.
 * @param[in,out] shm_array Array in SHM, set to 0 if last item was removed.
 * @param[in,out] shm_count Array count in SHM, will be updated.
 * @param[in] item_size Array item size.
 * @param[in] del_idx Item index to delete.
 * @param[in] dyn_attr_size Aligned size of dynamic attributes of the deleted item.
 */
void sr_shmrealloc_del(char *ext_shm_addr, off_t *shm_array, uint16_t *shm_count, size_t item_size, uint16_t del_idx,
        size_t dyn_shm_size);

/**
 * @brief Wrapper for pthread_mutex_init().
 *
 * @param[in,out] lock pthread mutex to initialize.
 * @param[in] shared Whether the mutex will be shared between processes or not.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_mutex_init(pthread_mutex_t *lock, int shared);

/**
 * @brief Lock a mutex.
 *
 * @param[in] lock Mutex to lock.
 * @param[in] timeout_ms Timeout in ms for locking.
 * @param[in] finc Name of the calling function for logging.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_mlock(pthread_mutex_t *lock, int timeout_ms, const char *func);

/**
 * @brief Unlock a mutex.
 *
 * @param[in] lock Mutex to unlock.
 */
void sr_munlock(pthread_mutex_t *lock);

/**
 * @brief Initialize a sysrepo RW lock.
 *
 * @param[in,out] rwlock RW lock to initialize.
 * @param[in] shared Whether the RW lock will be shared between processes or not.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_rwlock_init(sr_rwlock_t *rwlock, int shared);

/**
 * @brief Destroy a sysrepo RW lock.
 *
 * @param[in] rwlock RW lock to destroy.
 */
void sr_rwlock_destroy(sr_rwlock_t *rwlock);

/**
 * @brief Lock a sysrepo RW lock.
 *
 * @param[in] rwlock RW lock to lock.
 * @param[in] timeout_ms Timeout in ms for locking.
 * @param[in] mode Whether to write-lock or read-lock.
 * @param[in] func Name of the calling function for logging.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_rwlock(sr_rwlock_t *rwlock, int timeout_ms, sr_lock_mode_t mode, const char *func);

/**
 * @brief Unlock a sysrepo RW lock.
 *
 * @param[in] rwlock RW lock to unlock.
 * @param[in] mode Whether to write-unlock or read-unlock.
 * @param[in] func Name of the calling function for logging.
 */
void sr_rwunlock(sr_rwlock_t *rwlock, sr_lock_mode_t mode, const char *func);

/**
 * @brief Update lock state stored in SHM.
 *
 * @param[in] shmlock Lock in SHM to write to.
 * @param[in] mode Whether the lock is read or write lock.
 * @param[in] lock Whether it was locked or unlocked.
 */
void sr_shmlock_update(sr_conn_shm_lock_t *shmlock, sr_lock_mode_t mode, int lock);

/**
 * @brief Wrapper to realloc() that frees memory on failure.
 *
 * @param[in] ptr Pointer to the current memory.
 * @param[in] size New size of the memory.
 * @return Resized memory, NULL on error.
 */
void *sr_realloc(void *ptr, size_t size);

/**
 * @brief Copy a file to a SHM.
 *
 * @param[in] to Destination SHM path (name).
 * @param[in] from Source file path.
 * @param[in] perm Permissions of \p to SHM file, if being created.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_cp_file2shm(const char *to, const char *from, mode_t perm);

/**
 * @brief Create all directories in the path.
 *
 * @param[in] path Full path, is temporarily modified.
 * @param[in] mode Mode (permissions) of the directories.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_mkpath(char *path, mode_t mode);

/**
 * @brief Get first namespace (module name) from an XPath expression.
 *
 * @param[in] expr Expression to inspect.
 * @return First module name, NULL on error.
 */
char *sr_get_first_ns(const char *expr);

/**
 * @brief Get XPath expression without any predicates.
 *
 * @param[in] expr Expression to transform.
 * @param[out] expr2 Expression without predicates.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_get_trim_predicates(const char *expr, char **expr2);

/**
 * @brief Get datastore string name.
 *
 * @param[in] ds Datastore to transform.
 * @return Datastore string name.
 */
const char *sr_ds2str(sr_datastore_t ds);

/**
 * @brief Get datastore identity name from ietf-datastores.
 *
 * @param[in] ds Datastore to transform.
 * @return Datastore identity name.
 */
const char *sr_ds2ident(sr_datastore_t ds);

/**
 * @brief Sleep for specified milliseconds.
 *
 * @param[in] msec Number of ms to sleep for.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_msleep(uint32_t msec);

/**
 * @brief Print a message into a newly allocated buffer.
 *
 * @param[in,out] str Buffer for the message.
 * @param[in,out] str_len Current buffer length.
 * @param[in] offset Print into buffer with an offset.
 * @param[in] format Format of the message.
 * @param[in] ap Format argument list.
 * @return Number of printed characters, -1 on error.
 */
int sr_vsprintf(char **str, int *str_len, int offset, const char *format, va_list ap);

/**
 * @brief Print a message into a newly allocated buffer.
 *
 * @param[in,out] str Buffer for the message.
 * @param[in,out] str_len Current buffer length.
 * @param[in] offset Print into buffer with an offset.
 * @param[in] format Format of the message.
 * @param[in] ... Format arguments.
 * @return Number of printed characters, -1 on error.
 */
int sr_sprintf(char **str, int *str_len, int offset, const char *format, ...);

/**
 * @brief Get a file descriptor size.
 *
 * @param[in] fd File descriptor to inspect.
 * @param[out] size Size of \p fd.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_file_get_size(int fd, size_t *size);

/**
 * @brief Get string value of a libyang leaf(-list).
 *
 * @param[in] leaf Node to inspect.
 * @return String value of the node.
 */
const char *sr_ly_leaf_value_str(const struct lyd_node *leaf);

/**
 * @brief Get event string name.
 *
 * @param[in] ev Event to transform.
 * @return Event string name.
 */
const char *sr_ev2str(sr_sub_event_t ev);

/**
 * @brief Transform internal event type into a public API event type.
 *
 * @param[in] ev Internal event.
 * @return Public API event.
 */
sr_event_t sr_ev2api(sr_sub_event_t ev);

/**
 * @brief Transform a libyang node into sysrepo value.
 *
 * @param[in] node libyang node to transform.
 * @param[out] sr_val sysrepo value.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_val_ly2sr(const struct lyd_node *node, sr_val_t *sr_val);

/**
 * @brief Transform a sysrepo value into libyang string value.
 *
 * @param[in] ctx libyang context.
 * @param[in] sr_val sysrepo value to transform.
 * @param[in] xpath XPath of the sysrepo value.
 * @param[in] buf Function buffer, must be of size at least 22 bytes.
 * @param[in] output Whether to look for output nodes instead of input.
 * @return String value.
 */
char *sr_val_sr2ly_str(struct ly_ctx *ctx, const sr_val_t *sr_val, const char *xpath, char *buf, int output);

/**
 * @brief Transform a sysrepo value into libyang node.
 *
 * @param[in] ctx libyang context.
 * @param[in] xpath XPath of the sysrepo value.
 * @param[in] val_str String value of the sysrepo value.
 * @param[in] dflt Dflt flag if the sysrepo value.
 * @param[in] output Whether the sysrepo value is from an output.
 * @param[in,out] root Transformed sysrepo value, appended if set.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_val_sr2ly(struct ly_ctx *ctx, const char *xpath, const char *val_str, int dflt, int output,
        struct lyd_node **root);

/**
 * @brief Split this sibling with following siblings and its preceding siblings.
 * Works only for top-level nodes!
 *
 * @param[in] sibling Specific sibling where to split the siblings.
 */
void sr_ly_split(struct lyd_node *sibling);

/**
 * @brief Link together split siblings. Works only for top-level nodes!
 *
 * @param[in] first First sibling of the preceding siblings.
 * @param[in] sibling First sibling of the following siblings.
 */
void sr_ly_link(struct lyd_node *first, struct lyd_node *sibling);

/**
 * @brief Duplicate nodes to the specified depth.
 *
 * @param[in] src_parent Source parent.
 * @param[in] depth Depth to duplicate.
 * @param[in,out] trg_parent Target parent to add children to.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_lyd_dup(const struct lyd_node *src_parent, uint32_t depth, struct lyd_node *trg_parent);

/**
 * @brief Get pointer to data node children.
 *
 * @param[in] node Node to get children of.
 * @param[in] skip_keys Whether to return first non-key child in case of lists.
 * @return Node children, NULL if has none.
 */
struct lyd_node *sr_lyd_child(const struct lyd_node *node, int skip_keys);

/**
 * @brief Duplicate selected nodes from a data tree.
 * Works well even for XPaths with intersections.
 *
 * @param[in] data Data tree to duplicate from.
 * @param[in] xpaths Array of XPaths that will select the duplicated nodes.
 * @param[in] xp_count XPath count.
 * @param[in] cont_ly_mod If set, even non-matching NP containers from this module will be duplicated.
 * @param[out] new_data Duplicated selected nodes.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_lyd_xpath_dup(const struct lyd_node *data, char **xpaths, uint16_t xp_count,
        const struct lys_module *cont_ly_mod, struct lyd_node **new_data);

/**
 * @brief Remove all nodes selected by XPath.
 *
 * @param[in,out] data Data to filter.
 * @param[in] xpath XPath selecting the nodes that will be freed.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_lyd_xpath_complement(struct lyd_node **data, const char *xpath);

/**
 * @brief Learn whether a node is user-ordered (leaf-)list.
 *
 * @param[in] node (Leaf-)list instance.
 * @return 0 if not, non-zero if it is.
 */
int sr_ly_is_userord(const struct lyd_node *node);

/**
 * @brief Learn whether 2 anydata/anyxml nodes are equal or not.
 *
 * @param[in] any1 First anydata/anyxml node.
 * @param[in] any2 Second anydata/anyxml node.
 * @param[out] equal 1 if equal, 0 otherwise.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_lyd_anydata_equal(const struct lyd_node *any1, const struct lyd_node *any2, int *equal);

/**
 * @brief Copy anydata/anyxml value from src to trg.
 *
 * @param[in] trg Target to copy to.
 * @param[in] src Source to copy from.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_lyd_anydata_copy(struct lyd_node *trg, const struct lyd_node *src);

/**
 * @brief Get string value of an anydata/anyxml node.
 *
 * @param[in] any Anydata/anyxml to get the value from.
 * @param[out] value_str String value.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_ly_anydata_value_str(const struct lyd_node *any, char **value_str);

/**
 * @brief Get a hash of a string value.
 *
 * @param[in] str String to hash.
 * @return String hash.
 */
uint32_t sr_str_hash(const char *str);

/**
 * @brief Trim last node from an XPath.
 *
 * @param[in] xpath Full XPath.
 * @param[out] trim_xpath XPath without the last node (and its predicates, if any).
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_xpath_trim_last_node(const char *xpath, char **trim_xpath);

/**
 * @brief Get the first node (with predicates if any) from an XPath.
 *
 * @param[in] xpath Full XPath.
 * @return First XPath node path.
 */
char *sr_xpath_first_node_with_predicates(const char *xpath);

/**
 * @brief Get pointers to the next node name in an XPath.
 *
 * @param[in] xpath Current position in the XPath (`/` expected at the beginning).
 * @param[out] mod Module name, if any.
 * @param[out] mod_len Moduel name length.
 * @param[out] name Node name.
 * @param[out] len Node name length,
 * @param[out] double_slash Whether the node starts with '//'.
 * @param[out] has_predicate Whether a predicate follows.
 * @return Pointer to the next XPath part (node name or predicate).
 */
const char *sr_xpath_next_name(const char *xpath, const char **mod, int *mod_len, const char **name, int *len,
        int *double_slash, int *has_predicate);

/**
 * @brief Get pointers to the next predicate in an XPath.
 *
 * @param[in] xpath Current position in the XPath (`[` expected at the beginning).
 * @param[out] pred Predicate content.
 * @param[out] len Predicate content length,
 * @param[out] has_predicate Whether another predicate follows.
 * @return Pointer to the next XPath part (node name or predicate).
 */
const char *sr_xpath_next_predicate(const char *xpath, const char **pred, int *len, int *has_predicate);

/**
 * @brief Learn length of an XPath withtout any predicates.
 *
 * @param[in] xpath Full XPath.
 * @return XPath length.
 */
size_t sr_xpath_len_no_predicates(const char *xpath);

/**
 * @brief Find last (most nested) parent (node with possible children) in a data tree.
 *
 * @param[in,out] parent Any subtree node, will be moved to the last parent.
 * @param[in] nodetype Whether to stop when a specific node type is found or not.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_ly_find_last_parent(struct lyd_node **parent, int nodetype);

/**
 * @brief Unlink data of a specific module from a data tree.
 *
 * @param[in,out] data Data tree.
 * @param[in] ly_mod libyang module of interest.
 * @return Unlinked data tree.
 */
struct lyd_node *sr_module_data_unlink(struct lyd_node **data, const struct lys_module *ly_mod);

/**
 * @brief Append data loaded from a file/SHM for a specific module.
 *
 * @param[in] ly_mod Module to process.
 * @param[in] ds Datastore.
 * @param[in,out] data Data tree to append to.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_module_file_data_append(const struct lys_module *ly_mod, sr_datastore_t ds, struct lyd_node **data);

/**
 * @brief Set (replace) data in file/SHM for a specific module.
 *
 * @param[in] mod_name Module name.
 * @param[in] ds Target datastore
 * @param[in] mod_data Module data.
 * @param[in] create_flags Additional flags that will be used for opening the file,
 * any of O_CREATE and O_EXCL are expected.
 * @param[in] create_mode In case the file can be created, set these permissions (mode).
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_module_file_data_set(const char *mod_name, sr_datastore_t ds, struct lyd_node *mod_data,
        int create_flags, mode_t create_mode);

/**
 * @brief Update sysrepo stored operational diff of a module.
 *
 * @param[in] conn Connection to use.
 * @param[in] mod_name Module name.
 * @return err_info, NULL on success.
 */
sr_error_info_t *sr_module_update_oper_diff(sr_conn_ctx_t *conn, const char *mod_name);

/**
 * @brief Get next feature of a module.
 *
 * @param[in] last Last returned feature, NULL on first call,
 * @param[in] ly_mod Module with the features.
 * @param[in,out] idx Internal index fo the feature, arbitrary value can be passed but must not be changed in between calls.
 * @return Next found feature, NULL if last was previously returned.
 */
struct lys_feature *sr_lys_next_feature(struct lys_feature *last, const struct lys_module *ly_mod, uint32_t *idx);

#endif
