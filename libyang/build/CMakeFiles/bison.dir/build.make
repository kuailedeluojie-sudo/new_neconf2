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

# Utility rule file for bison.

# Include the progress variables for this target.
include CMakeFiles/bison.dir/progress.make

CMakeFiles/bison:
	cd /home/mo/share/netconf2_new/libyang/src && bison -l -o parser_yang_bis.c --defines=parser_yang_bis.h /home/mo/share/netconf2_new/libyang/build/src/yang.y
	cd /home/mo/share/netconf2_new/libyang/src && flex -8 -L -o parser_yang_lex.c --header-file=parser_yang_lex.h yang.l
	cd /home/mo/share/netconf2_new/libyang/src && /bin/sed -i 's/int yychar;/int yychar;\nchar *s = NULL, *tmp_s = NULL, *ext_name = NULL;\nstruct lys_module *trg = NULL;\nstruct lys_node *tpdf_parent = NULL, *data_node = NULL;\nstruct lys_ext_instance_complex *ext_instance = NULL;\nint is_ext_instance;\nvoid *actual = NULL;\nenum yytokentype backup_type, actual_type = MODULE_KEYWORD;\nint64_t cnt_val = 0;\nint is_value = 0;\nvoid *yang_type = NULL;/' parser_yang_bis.c

bison: CMakeFiles/bison
bison: CMakeFiles/bison.dir/build.make

.PHONY : bison

# Rule to build all files generated by this target.
CMakeFiles/bison.dir/build: bison

.PHONY : CMakeFiles/bison.dir/build

CMakeFiles/bison.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bison.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bison.dir/clean

CMakeFiles/bison.dir/depend:
	cd /home/mo/share/netconf2_new/libyang/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mo/share/netconf2_new/libyang /home/mo/share/netconf2_new/libyang /home/mo/share/netconf2_new/libyang/build /home/mo/share/netconf2_new/libyang/build /home/mo/share/netconf2_new/libyang/build/CMakeFiles/bison.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bison.dir/depend

