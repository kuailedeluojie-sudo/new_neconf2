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
include CMakeFiles/sysrepo-plugind.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sysrepo-plugind.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sysrepo-plugind.dir/flags.make

CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.o: CMakeFiles/sysrepo-plugind.dir/flags.make
CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.o: ../src/executables/sysrepo-plugind.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.o   -c /home/mo/share/netconf2_new/sysrepo/src/executables/sysrepo-plugind.c

CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/sysrepo/src/executables/sysrepo-plugind.c > CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.i

CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/sysrepo/src/executables/sysrepo-plugind.c -o CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.s

# Object files for target sysrepo-plugind
sysrepo__plugind_OBJECTS = \
"CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.o"

# External object files for target sysrepo-plugind
sysrepo__plugind_EXTERNAL_OBJECTS = \
"/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles/compat.dir/compat/compat.c.o"

sysrepo-plugind: CMakeFiles/sysrepo-plugind.dir/src/executables/sysrepo-plugind.c.o
sysrepo-plugind: CMakeFiles/compat.dir/compat/compat.c.o
sysrepo-plugind: CMakeFiles/sysrepo-plugind.dir/build.make
sysrepo-plugind: libsysrepo.so.5.5.8
sysrepo-plugind: /opt/libyang/_install/lib/libyang.so.1.8.4
sysrepo-plugind: CMakeFiles/sysrepo-plugind.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable sysrepo-plugind"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sysrepo-plugind.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sysrepo-plugind.dir/build: sysrepo-plugind

.PHONY : CMakeFiles/sysrepo-plugind.dir/build

CMakeFiles/sysrepo-plugind.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sysrepo-plugind.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sysrepo-plugind.dir/clean

CMakeFiles/sysrepo-plugind.dir/depend:
	cd /home/mo/share/netconf2_new/sysrepo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/sysrepo /home/mo/share/netconf2_new/sysrepo /home/mo/share/netconf2_new/sysrepo/build /home/mo/share/netconf2_new/sysrepo/build /home/mo/share/netconf2_new/sysrepo/build/CMakeFiles/sysrepo-plugind.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sysrepo-plugind.dir/depend

