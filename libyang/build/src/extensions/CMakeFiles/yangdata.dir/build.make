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
CMAKE_SOURCE_DIR = /home/mo/share/netconf2_new/libyang

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mo/share/netconf2_new/libyang/build

# Include any dependencies generated for this target.
include src/extensions/CMakeFiles/yangdata.dir/depend.make

# Include the progress variables for this target.
include src/extensions/CMakeFiles/yangdata.dir/progress.make

# Include the compile flags for this target's objects.
include src/extensions/CMakeFiles/yangdata.dir/flags.make

src/extensions/CMakeFiles/yangdata.dir/yangdata.c.o: src/extensions/CMakeFiles/yangdata.dir/flags.make
src/extensions/CMakeFiles/yangdata.dir/yangdata.c.o: ../src/extensions/yangdata.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mo/share/netconf2_new/libyang/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/extensions/CMakeFiles/yangdata.dir/yangdata.c.o"
	cd /home/mo/share/netconf2_new/libyang/build/src/extensions && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yangdata.dir/yangdata.c.o   -c /home/mo/share/netconf2_new/libyang/src/extensions/yangdata.c

src/extensions/CMakeFiles/yangdata.dir/yangdata.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yangdata.dir/yangdata.c.i"
	cd /home/mo/share/netconf2_new/libyang/build/src/extensions && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mo/share/netconf2_new/libyang/src/extensions/yangdata.c > CMakeFiles/yangdata.dir/yangdata.c.i

src/extensions/CMakeFiles/yangdata.dir/yangdata.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yangdata.dir/yangdata.c.s"
	cd /home/mo/share/netconf2_new/libyang/build/src/extensions && /home/mo/share/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin/arm-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mo/share/netconf2_new/libyang/src/extensions/yangdata.c -o CMakeFiles/yangdata.dir/yangdata.c.s

# Object files for target yangdata
yangdata_OBJECTS = \
"CMakeFiles/yangdata.dir/yangdata.c.o"

# External object files for target yangdata
yangdata_EXTERNAL_OBJECTS =

src/extensions/yangdata.so: src/extensions/CMakeFiles/yangdata.dir/yangdata.c.o
src/extensions/yangdata.so: src/extensions/CMakeFiles/yangdata.dir/build.make
src/extensions/yangdata.so: libyang.so.1.8.4
src/extensions/yangdata.so: /home/mo/share/netconf2/lib_src/pcre-8.44/_install/lib/libpcre.a
src/extensions/yangdata.so: src/extensions/CMakeFiles/yangdata.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mo/share/netconf2_new/libyang/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library yangdata.so"
	cd /home/mo/share/netconf2_new/libyang/build/src/extensions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yangdata.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/extensions/CMakeFiles/yangdata.dir/build: src/extensions/yangdata.so

.PHONY : src/extensions/CMakeFiles/yangdata.dir/build

src/extensions/CMakeFiles/yangdata.dir/clean:
	cd /home/mo/share/netconf2_new/libyang/build/src/extensions && $(CMAKE_COMMAND) -P CMakeFiles/yangdata.dir/cmake_clean.cmake
.PHONY : src/extensions/CMakeFiles/yangdata.dir/clean

src/extensions/CMakeFiles/yangdata.dir/depend:
	cd /home/mo/share/netconf2_new/libyang/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/libyang /home/mo/share/netconf2_new/libyang/src/extensions /home/mo/share/netconf2_new/libyang/build /home/mo/share/netconf2_new/libyang/build/src/extensions /home/mo/share/netconf2_new/libyang/build/src/extensions/CMakeFiles/yangdata.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/extensions/CMakeFiles/yangdata.dir/depend

