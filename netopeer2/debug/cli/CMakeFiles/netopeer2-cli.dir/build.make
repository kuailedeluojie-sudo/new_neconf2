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
CMAKE_BINARY_DIR = /home/mo/share/netconf2_new/netopeer2/debug

# Include any dependencies generated for this target.
include cli/CMakeFiles/netopeer2-cli.dir/depend.make

# Include the progress variables for this target.
include cli/CMakeFiles/netopeer2-cli.dir/progress.make

# Include the compile flags for this target's objects.
include cli/CMakeFiles/netopeer2-cli.dir/flags.make

cli/CMakeFiles/netopeer2-cli.dir/main.c.o: cli/CMakeFiles/netopeer2-cli.dir/flags.make
cli/CMakeFiles/netopeer2-cli.dir/main.c.o: ../cli/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object cli/CMakeFiles/netopeer2-cli.dir/main.c.o"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netopeer2-cli.dir/main.c.o   -c /home/mo/share/netconf2_new/netopeer2/cli/main.c

cli/CMakeFiles/netopeer2-cli.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netopeer2-cli.dir/main.c.i"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/netopeer2/cli/main.c > CMakeFiles/netopeer2-cli.dir/main.c.i

cli/CMakeFiles/netopeer2-cli.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netopeer2-cli.dir/main.c.s"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/netopeer2/cli/main.c -o CMakeFiles/netopeer2-cli.dir/main.c.s

cli/CMakeFiles/netopeer2-cli.dir/commands.c.o: cli/CMakeFiles/netopeer2-cli.dir/flags.make
cli/CMakeFiles/netopeer2-cli.dir/commands.c.o: ../cli/commands.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object cli/CMakeFiles/netopeer2-cli.dir/commands.c.o"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netopeer2-cli.dir/commands.c.o   -c /home/mo/share/netconf2_new/netopeer2/cli/commands.c

cli/CMakeFiles/netopeer2-cli.dir/commands.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netopeer2-cli.dir/commands.c.i"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/netopeer2/cli/commands.c > CMakeFiles/netopeer2-cli.dir/commands.c.i

cli/CMakeFiles/netopeer2-cli.dir/commands.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netopeer2-cli.dir/commands.c.s"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/netopeer2/cli/commands.c -o CMakeFiles/netopeer2-cli.dir/commands.c.s

cli/CMakeFiles/netopeer2-cli.dir/completion.c.o: cli/CMakeFiles/netopeer2-cli.dir/flags.make
cli/CMakeFiles/netopeer2-cli.dir/completion.c.o: ../cli/completion.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object cli/CMakeFiles/netopeer2-cli.dir/completion.c.o"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netopeer2-cli.dir/completion.c.o   -c /home/mo/share/netconf2_new/netopeer2/cli/completion.c

cli/CMakeFiles/netopeer2-cli.dir/completion.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netopeer2-cli.dir/completion.c.i"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/netopeer2/cli/completion.c > CMakeFiles/netopeer2-cli.dir/completion.c.i

cli/CMakeFiles/netopeer2-cli.dir/completion.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netopeer2-cli.dir/completion.c.s"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/netopeer2/cli/completion.c -o CMakeFiles/netopeer2-cli.dir/completion.c.s

cli/CMakeFiles/netopeer2-cli.dir/configuration.c.o: cli/CMakeFiles/netopeer2-cli.dir/flags.make
cli/CMakeFiles/netopeer2-cli.dir/configuration.c.o: ../cli/configuration.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object cli/CMakeFiles/netopeer2-cli.dir/configuration.c.o"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netopeer2-cli.dir/configuration.c.o   -c /home/mo/share/netconf2_new/netopeer2/cli/configuration.c

cli/CMakeFiles/netopeer2-cli.dir/configuration.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netopeer2-cli.dir/configuration.c.i"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/netopeer2/cli/configuration.c > CMakeFiles/netopeer2-cli.dir/configuration.c.i

cli/CMakeFiles/netopeer2-cli.dir/configuration.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netopeer2-cli.dir/configuration.c.s"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/netopeer2/cli/configuration.c -o CMakeFiles/netopeer2-cli.dir/configuration.c.s

cli/CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.o: cli/CMakeFiles/netopeer2-cli.dir/flags.make
cli/CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.o: ../cli/linenoise/linenoise.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object cli/CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.o"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.o   -c /home/mo/share/netconf2_new/netopeer2/cli/linenoise/linenoise.c

cli/CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.i"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/netopeer2/cli/linenoise/linenoise.c > CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.i

cli/CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.s"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/netopeer2/cli/linenoise/linenoise.c -o CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.s

# Object files for target netopeer2-cli
netopeer2__cli_OBJECTS = \
"CMakeFiles/netopeer2-cli.dir/main.c.o" \
"CMakeFiles/netopeer2-cli.dir/commands.c.o" \
"CMakeFiles/netopeer2-cli.dir/completion.c.o" \
"CMakeFiles/netopeer2-cli.dir/configuration.c.o" \
"CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.o"

# External object files for target netopeer2-cli
netopeer2__cli_EXTERNAL_OBJECTS = \
"/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles/compat.dir/compat/compat.c.o"

netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/main.c.o
netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/commands.c.o
netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/completion.c.o
netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/configuration.c.o
netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/linenoise/linenoise.c.o
netopeer2-cli: CMakeFiles/compat.dir/compat/compat.c.o
netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/build.make
netopeer2-cli: /home/mo/share/netconf2_new/libyang/_install/lib/libyang.so.1.8.4
netopeer2-cli: /home/mo/share/netconf2_new/libnetconf2/_install/lib/libnetconf2.so.1.3.5
netopeer2-cli: cli/CMakeFiles/netopeer2-cli.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/netopeer2/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable ../netopeer2-cli"
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/netopeer2-cli.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
cli/CMakeFiles/netopeer2-cli.dir/build: netopeer2-cli

.PHONY : cli/CMakeFiles/netopeer2-cli.dir/build

cli/CMakeFiles/netopeer2-cli.dir/clean:
	cd /home/mo/share/netconf2_new/netopeer2/debug/cli && $(CMAKE_COMMAND) -P CMakeFiles/netopeer2-cli.dir/cmake_clean.cmake
.PHONY : cli/CMakeFiles/netopeer2-cli.dir/clean

cli/CMakeFiles/netopeer2-cli.dir/depend:
	cd /home/mo/share/netconf2_new/netopeer2/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/netopeer2 /home/mo/share/netconf2_new/netopeer2/cli /home/mo/share/netconf2_new/netopeer2/debug /home/mo/share/netconf2_new/netopeer2/debug/cli /home/mo/share/netconf2_new/netopeer2/debug/cli/CMakeFiles/netopeer2-cli.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cli/CMakeFiles/netopeer2-cli.dir/depend

