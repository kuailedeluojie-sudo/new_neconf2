cmake_minimum_required(VERSION 2.8.12)

# correct RPATH usage on OS X
set(CMAKE_MACOSX_RPATH TRUE)

# list of all the examples
set(examples application_changes_example sr_set_item_example sr_get_items_example oper_data_example notif_subscribe_example
    notif_send_example rpc_send_example rpc_subscribe_example)

foreach(app_name IN LISTS examples)
    add_executable(${app_name} ${app_name}.c)
	
	
	target_link_libraries(${app_name} ${SYSREPO_LIBRARIES})
	include_directories(${SYSREPO_INCLUDE_DIRS})
	list(APPEND CMAKE_REQUIRED_INCLUDES ${SYSREPO_INCLUDE_DIRS})
	list(APPEND CMAKE_REQUIRED_LIBRARIES ${SYSREPO_LIBRARIES})
	
	target_link_libraries(${app_name}  ${LIBYANG_LIBRARIES})
	include_directories(${LIBYANG_INCLUDE_DIRS})
	list(APPEND CMAKE_REQUIRED_INCLUDES ${LIBYANG_INCLUDE_DIRS})
	list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBYANG_LIBRARIES})
	
	
    #target_link_libraries(${app_name} sysrepo)
endforeach(app_name)

# oven plugin
add_library(oven MODULE plugin/oven.c)
target_link_libraries(oven ${SYSREPO_LIBRARIES})
include_directories(${SYSREPO_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_INCLUDES ${SYSREPO_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_LIBRARIES ${SYSREPO_LIBRARIES})
	
target_link_libraries(oven  ${LIBYANG_LIBRARIES})
include_directories(${LIBYANG_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_INCLUDES ${LIBYANG_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBYANG_LIBRARIES})
set_target_properties(oven PROPERTIES PREFIX "")
#target_link_libraries(oven sysrepo)
