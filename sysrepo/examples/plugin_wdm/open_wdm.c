#define _QNX_SOURCE /* sleep */

#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>

#include <sysrepo.h>
#include <libyang/libyang.h>

//插件的会话，在调用cleanup之前可以使用
sr_session_ctx_t *sess;
//保持所有订阅的结构
sr_subscription_ctx_t *subscription;
#define DATA_LENGTH 24
//所有的变量都封装在一个结构体类型里面
typedef volatile struct open_wdm{
	volatile pthread_t open_wdm_tid; //线程号
	volatile char name[DATA_LENGTH];
}OPEN_WDM;
OPEN_WDM Open_Wdm;
static void * open_wdm_thread(void *arg)
{
		
		(void) arg;
		while(open_wdm_tid)
		{
			
		}
		return NULL;
	
}
//订阅open_wdm时调用这个函数
static int
open_wdm_config_change_cb(sr_session_ctx_t *session, const char *module_name, const char *xpath, sr_event_t event,
        uint32_t request_id, void *private_data)
{
	
	int rc;
    sr_val_t *val; //保存节点中的默认值
    pthread_t tid;
    (void)module_name;
    (void)xpath;
    (void)event;
    (void)request_id;
    (void)private_data;
	
	rc = sr_get_item(session, "/open_wdm:/wdm/name", 0, &val);
    if (rc != SR_ERR_OK) {
        goto sr_error;
    }
	//节点对应信息是"/open_wdm:/wdm/name" ,这个节点应该用字符数组保存起来，定义一个结构体来保存这些信息
	//string_val string
	//拷贝名字过来
	strncpy(Open_Wdm.name,val->data.string_val,DATA_LENGTH);
	SRP_LOG_ERR("Open_Wdm.name:%s,val->data.string_val:%s.\n",Open_Wdm.name,val->data.string_val);
	 sr_free_val(val);
	return SR_ERR_OK;
	
	sr_error:
		SRP_LOG_ERR("OPEN_WDM: OPEN_WDM config change callback failed: %s.", sr_strerror(rc));
		return rc;
	sys_error:
		sr_free_val(val);
		 SRP_LOG_ERR("OPEN_WDM: OPEN_WDM config change callback failed: %s.", strerror(rc));
		 return SR_ERR_OPERATION_FAILED;
}
//初始化这个连接，找到对应的节点和编写相应的回调函数
int
sr_plugin_init_cb(sr_session_ctx_t *session, void **private_data)
{
	int rc;
    (void)private_data;
	
	 rc = sr_module_change_subscribe(session, "open_wdm", NULL, open_wdm_config_change_cb, NULL, 0,
            SR_SUBSCR_ENABLED | SR_SUBSCR_DONE_ONLY, &subscription);
    if (rc != SR_ERR_OK) {
        goto error;
    }
error:
    SRP_LOG_ERR("OPEN_WDM: open_wdm plugin initialization failed: %s.", sr_strerror(rc));
    sr_unsubscribe(subscription);
    return rc;	
}

//退出的时候清理会话
void
sr_plugin_cleanup_cb(sr_session_ctx_t *session, void *private_data)
{
    (void)session;
    (void)private_data;

    /* nothing to cleanup except freeing the subscriptions */
    sr_unsubscribe(subscription);
    SRP_LOG_DBGMSG("OPEN_WDM: Open_Wdm plugin cleanup finished.");
}

