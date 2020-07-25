# Install script for directory: /home/mo/share/netconf2_new/libyang/src/user_types

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mo/share/netconf2_new/libyang/_install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types" TYPE SHARED_LIBRARY FILES "/home/mo/share/netconf2_new/libyang/build/src/user_types/user_yang_types.so")
  if(EXISTS "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so"
         OLD_RPATH "/home/mo/share/netconf2_new/libyang/build:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_yang_types.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types" TYPE SHARED_LIBRARY FILES "/home/mo/share/netconf2_new/libyang/build/src/user_types/user_inet_types.so")
  if(EXISTS "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so"
         OLD_RPATH "/home/mo/share/netconf2_new/libyang/build:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/mo/share/netconf2_new/libyang/_install/lib/libyang1/user_types/user_inet_types.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

