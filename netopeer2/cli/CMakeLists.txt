include(CheckFunctionExists)

project(netopeer2-cli C)

# set version
set(NP2CLI_VERSION 2.0.60)
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cli_version.h.in" "${PROJECT_BINARY_DIR}/cli_version.h" ESCAPE_QUOTES @ONLY)
include_directories(${PROJECT_BINARY_DIR})

# source files
set(CLI_SRC
    main.c
    commands.c
    completion.c
    configuration.c
    linenoise/linenoise.c)

# netopeer2-cli target
add_executable(netopeer2-cli ${CLI_SRC} $<TARGET_OBJECTS:compat>)

# reuse server variables
target_link_libraries(netopeer2-cli ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(netopeer2-cli ${LIBYANG_LIBRARIES})
target_link_libraries(netopeer2-cli ${LIBNETCONF2_LIBRARIES})

#以下三行为新添加 2020.7.1
include_directories(${LIBNETCONF2_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_INCLUDES ${LIBNETCONF2_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBNETCONF2_LIBRARIES})

#2020.7.2添加

target_link_libraries(netopeer2-cli  ${LIBSSH_LIBRARIES})
include_directories(${LIBSSH_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBSSH_LIBRARIES}  )
list(APPEND CMAKE_REQUIRED_INCLUDES ${LIBSSH_INCLUDE_DIRS})

target_link_libraries(netopeer2-cli  ${LIBCRYPTO_LIBRARIES})
include_directories(${LIBCRYPTO_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBCRYPTO_LIBRARIES}  )
list(APPEND CMAKE_REQUIRED_INCLUDES ${LIBCRYPTO_INCLUDE_DIRS})


target_link_libraries(netopeer2-cli  ${OPENSSL_INCLUDE_DIRS}) #修改的地方
include_directories(${OPENSSL_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIRS})
list(APPEND CMAKE_REQUIRED_LIBRARIES ${OPENSSL_LIBRARIES})
find_package(OpenSSL REQUIRED)

#结束添加


# message(STATUS ${LIBNETCONF2_LIBRARIES})

# dependencies - libssl
if(LIBNETCONF2_ENABLED_TLS)
    find_package(OpenSSL REQUIRED)
    target_link_libraries(netopeer2-cli ${OPENSSL_LIBRARIES})
    include_directories(${OPENSSL_INCLUDE_DIR})


endif()

check_function_exists(eaccess HAVE_EACCESS)
check_function_exists(mkstemps HAVE_MKSTEMPS)
if(HAVE_MKSTEMPS)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DHAVE_MKSTEMPS")
endif(HAVE_MKSTEMPS)

# install binary
install(TARGETS netopeer2-cli DESTINATION ${CMAKE_INSTALL_BINDIR})

# man -> html
find_program(ROFF2HTML roff2html)
if(NOT ROFF2HTML)
    message(STATUS "roff2html not found, html version of man pages cannot be generated!")
else()
    add_custom_target(doc ${ROFF2HTML} "${CMAKE_CURRENT_SOURCE_DIR}/doc/${PROJECT_NAME}.1" >
        "${CMAKE_CURRENT_SOURCE_DIR}/doc/${PROJECT_NAME}.1.html"
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/doc/${PROJECT_NAME}.1)
endif()

# install doc (man)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/doc/${PROJECT_NAME}.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
