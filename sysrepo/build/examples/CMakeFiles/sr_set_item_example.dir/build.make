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
include examples/CMakeFiles/sr_set_item_example.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/sr_set_item_example.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/sr_set_item_example.dir/flags.make

examples/CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.o: examples/CMakeFiles/sr_set_item_example.dir/flags.make
examples/CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.o: ../examples/sr_set_item_example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.o"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.o   -c /home/mo/share/netconf2_new/sysrepo/examples/sr_set_item_example.c

examples/CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.i"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/sysrepo/examples/sr_set_item_example.c > CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.i

examples/CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.s"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/sysrepo/examples/sr_set_item_example.c -o CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.s

# Object files for target sr_set_item_example
sr_set_item_example_OBJECTS = \
"CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.o"

# External object files for target sr_set_item_example
sr_set_item_example_EXTERNAL_OBJECTS =

examples/sr_set_item_example: examples/CMakeFiles/sr_set_item_example.dir/sr_set_item_example.c.o
examples/sr_set_item_example: examples/CMakeFiles/sr_set_item_example.dir/build.make
examples/sr_set_item_example: /opt/libyang/lib/libyang.so.1.8.4
examples/sr_set_item_example: examples/CMakeFiles/sr_set_item_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable sr_set_item_example"
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sr_set_item_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/sr_set_item_example.dir/build: examples/sr_set_item_example

.PHONY : examples/CMakeFiles/sr_set_item_example.dir/build

examples/CMakeFiles/sr_set_item_example.dir/clean:
	cd /home/mo/share/netconf2_new/sysrepo/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/sr_set_item_example.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/sr_set_item_example.dir/clean

examples/CMakeFiles/sr_set_item_example.dir/depend:
	cd /home/mo/share/netconf2_new/sysrepo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/sysrepo /home/mo/share/netconf2_new/sysrepo/examples /home/mo/share/netconf2_new/sysrepo/build /home/mo/share/netconf2_new/sysrepo/build/examples /home/mo/share/netconf2_new/sysrepo/build/examples/CMakeFiles/sr_set_item_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/sr_set_item_example.dir/depend

