# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /home/qwerty/Downloads/clion-2017.2.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/qwerty/Downloads/clion-2017.2.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/qwerty/CLionProjects/c-project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/qwerty/CLionProjects/c-project/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/c_project.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/c_project.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/c_project.dir/flags.make

CMakeFiles/c_project.dir/string_reader.c.o: CMakeFiles/c_project.dir/flags.make
CMakeFiles/c_project.dir/string_reader.c.o: ../string_reader.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qwerty/CLionProjects/c-project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/c_project.dir/string_reader.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/c_project.dir/string_reader.c.o   -c /home/qwerty/CLionProjects/c-project/string_reader.c

CMakeFiles/c_project.dir/string_reader.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/c_project.dir/string_reader.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/qwerty/CLionProjects/c-project/string_reader.c > CMakeFiles/c_project.dir/string_reader.c.i

CMakeFiles/c_project.dir/string_reader.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/c_project.dir/string_reader.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/qwerty/CLionProjects/c-project/string_reader.c -o CMakeFiles/c_project.dir/string_reader.c.s

CMakeFiles/c_project.dir/string_reader.c.o.requires:

.PHONY : CMakeFiles/c_project.dir/string_reader.c.o.requires

CMakeFiles/c_project.dir/string_reader.c.o.provides: CMakeFiles/c_project.dir/string_reader.c.o.requires
	$(MAKE) -f CMakeFiles/c_project.dir/build.make CMakeFiles/c_project.dir/string_reader.c.o.provides.build
.PHONY : CMakeFiles/c_project.dir/string_reader.c.o.provides

CMakeFiles/c_project.dir/string_reader.c.o.provides.build: CMakeFiles/c_project.dir/string_reader.c.o


CMakeFiles/c_project.dir/vector.c.o: CMakeFiles/c_project.dir/flags.make
CMakeFiles/c_project.dir/vector.c.o: ../vector.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qwerty/CLionProjects/c-project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/c_project.dir/vector.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/c_project.dir/vector.c.o   -c /home/qwerty/CLionProjects/c-project/vector.c

CMakeFiles/c_project.dir/vector.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/c_project.dir/vector.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/qwerty/CLionProjects/c-project/vector.c > CMakeFiles/c_project.dir/vector.c.i

CMakeFiles/c_project.dir/vector.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/c_project.dir/vector.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/qwerty/CLionProjects/c-project/vector.c -o CMakeFiles/c_project.dir/vector.c.s

CMakeFiles/c_project.dir/vector.c.o.requires:

.PHONY : CMakeFiles/c_project.dir/vector.c.o.requires

CMakeFiles/c_project.dir/vector.c.o.provides: CMakeFiles/c_project.dir/vector.c.o.requires
	$(MAKE) -f CMakeFiles/c_project.dir/build.make CMakeFiles/c_project.dir/vector.c.o.provides.build
.PHONY : CMakeFiles/c_project.dir/vector.c.o.provides

CMakeFiles/c_project.dir/vector.c.o.provides.build: CMakeFiles/c_project.dir/vector.c.o


# Object files for target c_project
c_project_OBJECTS = \
"CMakeFiles/c_project.dir/string_reader.c.o" \
"CMakeFiles/c_project.dir/vector.c.o"

# External object files for target c_project
c_project_EXTERNAL_OBJECTS =

c_project: CMakeFiles/c_project.dir/string_reader.c.o
c_project: CMakeFiles/c_project.dir/vector.c.o
c_project: CMakeFiles/c_project.dir/build.make
c_project: CMakeFiles/c_project.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qwerty/CLionProjects/c-project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable c_project"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/c_project.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/c_project.dir/build: c_project

.PHONY : CMakeFiles/c_project.dir/build

CMakeFiles/c_project.dir/requires: CMakeFiles/c_project.dir/string_reader.c.o.requires
CMakeFiles/c_project.dir/requires: CMakeFiles/c_project.dir/vector.c.o.requires

.PHONY : CMakeFiles/c_project.dir/requires

CMakeFiles/c_project.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/c_project.dir/cmake_clean.cmake
.PHONY : CMakeFiles/c_project.dir/clean

CMakeFiles/c_project.dir/depend:
	cd /home/qwerty/CLionProjects/c-project/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qwerty/CLionProjects/c-project /home/qwerty/CLionProjects/c-project /home/qwerty/CLionProjects/c-project/cmake-build-debug /home/qwerty/CLionProjects/c-project/cmake-build-debug /home/qwerty/CLionProjects/c-project/cmake-build-debug/CMakeFiles/c_project.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/c_project.dir/depend

