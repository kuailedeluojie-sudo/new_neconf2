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
CMAKE_SOURCE_DIR = /home/mo/share/netconf2_new/libnetconf2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mo/share/netconf2_new/libnetconf2/build

# Include any dependencies generated for this target.
include CMakeFiles/netconf2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/netconf2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/netconf2.dir/flags.make

CMakeFiles/netconf2.dir/src/io.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/io.c.o: ../src/io.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/netconf2.dir/src/io.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/io.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/io.c

CMakeFiles/netconf2.dir/src/io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/io.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/io.c > CMakeFiles/netconf2.dir/src/io.c.i

CMakeFiles/netconf2.dir/src/io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/io.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/io.c -o CMakeFiles/netconf2.dir/src/io.c.s

CMakeFiles/netconf2.dir/src/log.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/log.c.o: ../src/log.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/netconf2.dir/src/log.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/log.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/log.c

CMakeFiles/netconf2.dir/src/log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/log.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/log.c > CMakeFiles/netconf2.dir/src/log.c.i

CMakeFiles/netconf2.dir/src/log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/log.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/log.c -o CMakeFiles/netconf2.dir/src/log.c.s

CMakeFiles/netconf2.dir/src/messages_client.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/messages_client.c.o: ../src/messages_client.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/netconf2.dir/src/messages_client.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/messages_client.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/messages_client.c

CMakeFiles/netconf2.dir/src/messages_client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/messages_client.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/messages_client.c > CMakeFiles/netconf2.dir/src/messages_client.c.i

CMakeFiles/netconf2.dir/src/messages_client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/messages_client.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/messages_client.c -o CMakeFiles/netconf2.dir/src/messages_client.c.s

CMakeFiles/netconf2.dir/src/messages_server.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/messages_server.c.o: ../src/messages_server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/netconf2.dir/src/messages_server.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/messages_server.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/messages_server.c

CMakeFiles/netconf2.dir/src/messages_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/messages_server.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/messages_server.c > CMakeFiles/netconf2.dir/src/messages_server.c.i

CMakeFiles/netconf2.dir/src/messages_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/messages_server.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/messages_server.c -o CMakeFiles/netconf2.dir/src/messages_server.c.s

CMakeFiles/netconf2.dir/src/session.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session.c.o: ../src/session.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/netconf2.dir/src/session.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session.c

CMakeFiles/netconf2.dir/src/session.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session.c > CMakeFiles/netconf2.dir/src/session.c.i

CMakeFiles/netconf2.dir/src/session.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session.c -o CMakeFiles/netconf2.dir/src/session.c.s

CMakeFiles/netconf2.dir/src/session_client.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session_client.c.o: ../src/session_client.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/netconf2.dir/src/session_client.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session_client.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session_client.c

CMakeFiles/netconf2.dir/src/session_client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session_client.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session_client.c > CMakeFiles/netconf2.dir/src/session_client.c.i

CMakeFiles/netconf2.dir/src/session_client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session_client.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session_client.c -o CMakeFiles/netconf2.dir/src/session_client.c.s

CMakeFiles/netconf2.dir/src/session_server.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session_server.c.o: ../src/session_server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/netconf2.dir/src/session_server.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session_server.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session_server.c

CMakeFiles/netconf2.dir/src/session_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session_server.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session_server.c > CMakeFiles/netconf2.dir/src/session_server.c.i

CMakeFiles/netconf2.dir/src/session_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session_server.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session_server.c -o CMakeFiles/netconf2.dir/src/session_server.c.s

CMakeFiles/netconf2.dir/src/time.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/time.c.o: ../src/time.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/netconf2.dir/src/time.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/time.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/time.c

CMakeFiles/netconf2.dir/src/time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/time.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/time.c > CMakeFiles/netconf2.dir/src/time.c.i

CMakeFiles/netconf2.dir/src/time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/time.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/time.c -o CMakeFiles/netconf2.dir/src/time.c.s

CMakeFiles/netconf2.dir/src/session_client_ssh.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session_client_ssh.c.o: ../src/session_client_ssh.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/netconf2.dir/src/session_client_ssh.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session_client_ssh.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session_client_ssh.c

CMakeFiles/netconf2.dir/src/session_client_ssh.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session_client_ssh.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session_client_ssh.c > CMakeFiles/netconf2.dir/src/session_client_ssh.c.i

CMakeFiles/netconf2.dir/src/session_client_ssh.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session_client_ssh.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session_client_ssh.c -o CMakeFiles/netconf2.dir/src/session_client_ssh.c.s

CMakeFiles/netconf2.dir/src/session_server_ssh.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session_server_ssh.c.o: ../src/session_server_ssh.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/netconf2.dir/src/session_server_ssh.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session_server_ssh.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session_server_ssh.c

CMakeFiles/netconf2.dir/src/session_server_ssh.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session_server_ssh.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session_server_ssh.c > CMakeFiles/netconf2.dir/src/session_server_ssh.c.i

CMakeFiles/netconf2.dir/src/session_server_ssh.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session_server_ssh.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session_server_ssh.c -o CMakeFiles/netconf2.dir/src/session_server_ssh.c.s

CMakeFiles/netconf2.dir/src/session_client_tls.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session_client_tls.c.o: ../src/session_client_tls.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/netconf2.dir/src/session_client_tls.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session_client_tls.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session_client_tls.c

CMakeFiles/netconf2.dir/src/session_client_tls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session_client_tls.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session_client_tls.c > CMakeFiles/netconf2.dir/src/session_client_tls.c.i

CMakeFiles/netconf2.dir/src/session_client_tls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session_client_tls.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session_client_tls.c -o CMakeFiles/netconf2.dir/src/session_client_tls.c.s

CMakeFiles/netconf2.dir/src/session_server_tls.c.o: CMakeFiles/netconf2.dir/flags.make
CMakeFiles/netconf2.dir/src/session_server_tls.c.o: ../src/session_server_tls.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/netconf2.dir/src/session_server_tls.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netconf2.dir/src/session_server_tls.c.o   -c /home/mo/share/netconf2_new/libnetconf2/src/session_server_tls.c

CMakeFiles/netconf2.dir/src/session_server_tls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netconf2.dir/src/session_server_tls.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libnetconf2/src/session_server_tls.c > CMakeFiles/netconf2.dir/src/session_server_tls.c.i

CMakeFiles/netconf2.dir/src/session_server_tls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netconf2.dir/src/session_server_tls.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libnetconf2/src/session_server_tls.c -o CMakeFiles/netconf2.dir/src/session_server_tls.c.s

# Object files for target netconf2
netconf2_OBJECTS = \
"CMakeFiles/netconf2.dir/src/io.c.o" \
"CMakeFiles/netconf2.dir/src/log.c.o" \
"CMakeFiles/netconf2.dir/src/messages_client.c.o" \
"CMakeFiles/netconf2.dir/src/messages_server.c.o" \
"CMakeFiles/netconf2.dir/src/session.c.o" \
"CMakeFiles/netconf2.dir/src/session_client.c.o" \
"CMakeFiles/netconf2.dir/src/session_server.c.o" \
"CMakeFiles/netconf2.dir/src/time.c.o" \
"CMakeFiles/netconf2.dir/src/session_client_ssh.c.o" \
"CMakeFiles/netconf2.dir/src/session_server_ssh.c.o" \
"CMakeFiles/netconf2.dir/src/session_client_tls.c.o" \
"CMakeFiles/netconf2.dir/src/session_server_tls.c.o"

# External object files for target netconf2
netconf2_EXTERNAL_OBJECTS = \
"/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles/compat.dir/compat/compat.c.o"

libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/io.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/log.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/messages_client.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/messages_server.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session_client.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session_server.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/time.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session_client_ssh.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session_server_ssh.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session_client_tls.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/src/session_server_tls.c.o
libnetconf2.so.1.3.5: CMakeFiles/compat.dir/compat/compat.c.o
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/build.make
libnetconf2.so.1.3.5: /home/mo/share/netconf2/lib/openssl/debug/output/lib/libssl.so
libnetconf2.so.1.3.5: /home/mo/share/netconf2/lib/openssl/debug/output/lib/libcrypto.so
libnetconf2.so.1.3.5: /opt/libssh/lib/libssh.so.4.8.3
libnetconf2.so.1.3.5: /opt/libyang/lib/libyang.so.1.8.4
libnetconf2.so.1.3.5: CMakeFiles/netconf2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking C shared library libnetconf2.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/netconf2.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library libnetconf2.so.1.3.5 libnetconf2.so.1 libnetconf2.so

libnetconf2.so.1: libnetconf2.so.1.3.5
	@$(CMAKE_COMMAND) -E touch_nocreate libnetconf2.so.1

libnetconf2.so: libnetconf2.so.1.3.5
	@$(CMAKE_COMMAND) -E touch_nocreate libnetconf2.so

# Rule to build all files generated by this target.
CMakeFiles/netconf2.dir/build: libnetconf2.so

.PHONY : CMakeFiles/netconf2.dir/build

CMakeFiles/netconf2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/netconf2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/netconf2.dir/clean

CMakeFiles/netconf2.dir/depend:
	cd /home/mo/share/netconf2_new/libnetconf2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/libnetconf2 /home/mo/share/netconf2_new/libnetconf2 /home/mo/share/netconf2_new/libnetconf2/build /home/mo/share/netconf2_new/libnetconf2/build /home/mo/share/netconf2_new/libnetconf2/build/CMakeFiles/netconf2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/netconf2.dir/depend

