# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lera/Lerra227/workspace/reports/lab03/formatter_lib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build

# Include any dependencies generated for this target.
include CMakeFiles/formatter_lib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/formatter_lib.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/formatter_lib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/formatter_lib.dir/flags.make

CMakeFiles/formatter_lib.dir/formatter.cpp.o: CMakeFiles/formatter_lib.dir/flags.make
CMakeFiles/formatter_lib.dir/formatter.cpp.o: ../formatter.cpp
CMakeFiles/formatter_lib.dir/formatter.cpp.o: CMakeFiles/formatter_lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/formatter_lib.dir/formatter.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/formatter_lib.dir/formatter.cpp.o -MF CMakeFiles/formatter_lib.dir/formatter.cpp.o.d -o CMakeFiles/formatter_lib.dir/formatter.cpp.o -c /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/formatter.cpp

CMakeFiles/formatter_lib.dir/formatter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/formatter_lib.dir/formatter.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/formatter.cpp > CMakeFiles/formatter_lib.dir/formatter.cpp.i

CMakeFiles/formatter_lib.dir/formatter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/formatter_lib.dir/formatter.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/formatter.cpp -o CMakeFiles/formatter_lib.dir/formatter.cpp.s

# Object files for target formatter_lib
formatter_lib_OBJECTS = \
"CMakeFiles/formatter_lib.dir/formatter.cpp.o"

# External object files for target formatter_lib
formatter_lib_EXTERNAL_OBJECTS =

libformatter_lib.a: CMakeFiles/formatter_lib.dir/formatter.cpp.o
libformatter_lib.a: CMakeFiles/formatter_lib.dir/build.make
libformatter_lib.a: CMakeFiles/formatter_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libformatter_lib.a"
	$(CMAKE_COMMAND) -P CMakeFiles/formatter_lib.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/formatter_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/formatter_lib.dir/build: libformatter_lib.a
.PHONY : CMakeFiles/formatter_lib.dir/build

CMakeFiles/formatter_lib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/formatter_lib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/formatter_lib.dir/clean

CMakeFiles/formatter_lib.dir/depend:
	cd /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lera/Lerra227/workspace/reports/lab03/formatter_lib /home/lera/Lerra227/workspace/reports/lab03/formatter_lib /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build /home/lera/Lerra227/workspace/reports/lab03/formatter_lib/build/CMakeFiles/formatter_lib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/formatter_lib.dir/depend
