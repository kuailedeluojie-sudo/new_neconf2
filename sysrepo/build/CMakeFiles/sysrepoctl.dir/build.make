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
include CMakeFiles/sysrepoctl.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sysrepoctl.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sysrepoctl.dir/flags.make

CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.o: CMakeFiles/sysrepoctl.dir/flags.make
CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.o: ../src/executables/sysrepoctl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.o"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.o   -c /home/mo/share/netconf2_new/sysrepo/src/executables/sysrepoctl.c

CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.i"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/sysrepo/src/executables/sysrepoctl.c > CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.i

CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.s"
	/home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/sysrepo/src/executables/sysrepoctl.c -o CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.s

# Object files for target sysrepoctl
sysrepoctl_OBJECTS = \
"CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.o"

# External object files for target sysrepoctl
sysrepoctl_EXTERNAL_OBJECTS = \
"/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles/compat.dir/compat/compat.c.o"

sysrepoctl: CMakeFiles/sysrepoctl.dir/src/executables/sysrepoctl.c.o
sysrepoctl: CMakeFiles/compat.dir/compat/compat.c.o
sysrepoctl: CMakeFiles/sysrepoctl.dir/build.make
sysrepoctl: libsysrepo.so.5.5.8
sysrepoctl: /home/mo/share/netconf2_new/libyang/_install/lib/libyang.so.1.8.4
sysrepoctl: CMakeFiles/sysrepoctl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/sysrepo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable sysrepoctl"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sysrepoctl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sysrepoctl.dir/build: sysrepoctl

.PHONY : CMakeFiles/sysrepoctl.dir/build

CMakeFiles/sysrepoctl.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sysrepoctl.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sysrepoctl.dir/clean

CMakeFiles/sysrepoctl.dir/depend:
	cd /home/mo/share/netconf2_new/sysrepo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/sysrepo /home/mo/share/netconf2_new/sysrepo /home/mo/share/netconf2_new/sysrepo/build /home/mo/share/netconf2_new/sysrepo/build /home/mo/share/netconf2_new/sysrepo/build/CMakeFiles/sysrepoctl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sysrepoctl.dir/depend

