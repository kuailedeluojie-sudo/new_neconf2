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
CMAKE_SOURCE_DIR = /home/mo/share/netconf2_new/sysrepo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mo/share/netconf2_new/sysrepo/build

# Include any dependencies generated for this target.
include examples/CMakeFiles/notif_subscribe_example.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/notif_subscribe_example.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/notif_subscribe_example.dir/flags.make

examples/CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.o: examples/CMakeFiles/notif_subscribe_example.dir/flags.make
examples/CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.o: ../examples/notif_subscribe_example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.o"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.o   -c /home/mo/share/netconf2_new/sysrepo/examples/notif_subscribe_example.c

examples/CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.i"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/sysrepo/examples/notif_subscribe_example.c > CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.i

examples/CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.s"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/sysrepo/examples/notif_subscribe_example.c -o CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.s

# Object files for target notif_subscribe_example
notif_subscribe_example_OBJECTS = \
"CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.o"

# External object files for target notif_subscribe_example
notif_subscribe_example_EXTERNAL_OBJECTS =

examples/notif_subscribe_example: examples/CMakeFiles/notif_subscribe_example.dir/notif_subscribe_example.c.o
examples/notif_subscribe_example: examples/CMakeFiles/notif_subscribe_example.dir/build.make
examples/notif_subscribe_example: libsysrepo.so.5.5.8
examples/notif_subscribe_example: /opt/libyang/_install/lib/libyang.so.1.8.4
examples/notif_subscribe_example: examples/CMakeFiles/notif_subscribe_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable notif_subscribe_example"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/notif_subscribe_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/notif_subscribe_example.dir/build: examples/notif_subscribe_example

.PHONY : examples/CMakeFiles/notif_subscribe_example.dir/build

examples/CMakeFiles/notif_subscribe_example.dir/clean:
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/notif_subscribe_example.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/notif_subscribe_example.dir/clean

examples/CMakeFiles/notif_subscribe_example.dir/depend:
	cd /home/mo/share/netconf2_new/sysrepo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/sysrepo /home/mo/share/netconf2_new/sysrepo/examples /home/mo/share/netconf2_new/sysrepo/build /home/mo/share/netconf2_new/sysrepo/build/examples /home/mo/share/netconf2_new/sysrepo/build/examples/CMakeFiles/notif_subscribe_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/notif_subscribe_example.dir/depend

