# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mo/share/netconf2_new/netopeer2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mo/share/netconf2_new/netopeer2/build

# Include any dependencies generated for this target.
include CMakeFiles/netopeer2-server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/netopeer2-server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/netopeer2-server.dir/flags.make

CMakeFiles/netopeer2-server.dir/src/main.c.o: CMakeFiles/netopeer2-server.dir/flags.make
CMakeFiles/netopeer2-server.dir/src/main.c.o: ../src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/netopeer2-server.dir/src/main.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netopeer2-server.dir/src/main.c.o   -c /home/mo/share/netconf2_new/netopeer2/src/main.c

CMakeFiles/netopeer2-server.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netopeer2-server.dir/src/main.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/netopeer2/src/main.c > CMakeFiles/netopeer2-server.dir/src/main.c.i

CMakeFiles/netopeer2-server.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netopeer2-server.dir/src/main.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/netopeer2/src/main.c -o CMakeFiles/netopeer2-server.dir/src/main.c.s

# Object files for target netopeer2-server
netopeer2__server_OBJECTS = \
"CMakeFiles/netopeer2-server.dir/src/main.c.o"

# External object files for target netopeer2-server
netopeer2__server_EXTERNAL_OBJECTS = \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/common.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf_monitoring.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf_server.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf_server_ssh.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf_server_tls.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf_acm.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/netconf_nmda.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/serverobj.dir/src/log.c.o" \
"/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/compat.dir/compat/compat.c.o"

netopeer2-server: CMakeFiles/netopeer2-server.dir/src/main.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/common.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf_monitoring.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf_server.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf_server_ssh.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf_server_tls.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf_acm.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/netconf_nmda.c.o
netopeer2-server: CMakeFiles/serverobj.dir/src/log.c.o
netopeer2-server: CMakeFiles/compat.dir/compat/compat.c.o
netopeer2-server: CMakeFiles/netopeer2-server.dir/build.make
netopeer2-server: /opt/libssh/lib/libssh.so.4.8.3
netopeer2-server: /home/mo/share/netconf2/lib/openssl/debug/output/lib/libcrypto.so.1.1
netopeer2-server: /opt/libyang/lib/libyang.so.1.8.4
netopeer2-server: /opt/libnetconf2/lib/libnetconf2.so.1.3.5
netopeer2-server: /opt/sysrepo/lib/libsysrepo.so.5.5.8
netopeer2-server: CMakeFiles/netopeer2-server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/netopeer2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable netopeer2-server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/netopeer2-server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/netopeer2-server.dir/build: netopeer2-server

.PHONY : CMakeFiles/netopeer2-server.dir/build

CMakeFiles/netopeer2-server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/netopeer2-server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/netopeer2-server.dir/clean

CMakeFiles/netopeer2-server.dir/depend:
	cd /home/mo/share/netconf2_new/netopeer2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/netopeer2 /home/mo/share/netconf2_new/netopeer2 /home/mo/share/netconf2_new/netopeer2/build /home/mo/share/netconf2_new/netopeer2/build /home/mo/share/netconf2_new/netopeer2/build/CMakeFiles/netopeer2-server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/netopeer2-server.dir/depend

