# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.1

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.1.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.1.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/user/Documents/MATLAB/EE4212/q4/external/sba

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/user/Documents/MATLAB/EE4212/q4/external/sba

# Include any dependencies generated for this target.
include demo/CMakeFiles/eucsbademo.dir/depend.make

# Include the progress variables for this target.
include demo/CMakeFiles/eucsbademo.dir/progress.make

# Include the compile flags for this target's objects.
include demo/CMakeFiles/eucsbademo.dir/flags.make

demo/CMakeFiles/eucsbademo.dir/eucsbademo.o: demo/CMakeFiles/eucsbademo.dir/flags.make
demo/CMakeFiles/eucsbademo.dir/eucsbademo.o: demo/eucsbademo.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/user/Documents/MATLAB/EE4212/q4/external/sba/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object demo/CMakeFiles/eucsbademo.dir/eucsbademo.o"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/eucsbademo.dir/eucsbademo.o   -c /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/eucsbademo.c

demo/CMakeFiles/eucsbademo.dir/eucsbademo.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/eucsbademo.dir/eucsbademo.i"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/eucsbademo.c > CMakeFiles/eucsbademo.dir/eucsbademo.i

demo/CMakeFiles/eucsbademo.dir/eucsbademo.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/eucsbademo.dir/eucsbademo.s"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/eucsbademo.c -o CMakeFiles/eucsbademo.dir/eucsbademo.s

demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.requires:
.PHONY : demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.requires

demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.provides: demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.requires
	$(MAKE) -f demo/CMakeFiles/eucsbademo.dir/build.make demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.provides.build
.PHONY : demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.provides

demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.provides.build: demo/CMakeFiles/eucsbademo.dir/eucsbademo.o

demo/CMakeFiles/eucsbademo.dir/imgproj.o: demo/CMakeFiles/eucsbademo.dir/flags.make
demo/CMakeFiles/eucsbademo.dir/imgproj.o: demo/imgproj.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/user/Documents/MATLAB/EE4212/q4/external/sba/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object demo/CMakeFiles/eucsbademo.dir/imgproj.o"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/eucsbademo.dir/imgproj.o   -c /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/imgproj.c

demo/CMakeFiles/eucsbademo.dir/imgproj.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/eucsbademo.dir/imgproj.i"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/imgproj.c > CMakeFiles/eucsbademo.dir/imgproj.i

demo/CMakeFiles/eucsbademo.dir/imgproj.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/eucsbademo.dir/imgproj.s"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/imgproj.c -o CMakeFiles/eucsbademo.dir/imgproj.s

demo/CMakeFiles/eucsbademo.dir/imgproj.o.requires:
.PHONY : demo/CMakeFiles/eucsbademo.dir/imgproj.o.requires

demo/CMakeFiles/eucsbademo.dir/imgproj.o.provides: demo/CMakeFiles/eucsbademo.dir/imgproj.o.requires
	$(MAKE) -f demo/CMakeFiles/eucsbademo.dir/build.make demo/CMakeFiles/eucsbademo.dir/imgproj.o.provides.build
.PHONY : demo/CMakeFiles/eucsbademo.dir/imgproj.o.provides

demo/CMakeFiles/eucsbademo.dir/imgproj.o.provides.build: demo/CMakeFiles/eucsbademo.dir/imgproj.o

demo/CMakeFiles/eucsbademo.dir/readparams.o: demo/CMakeFiles/eucsbademo.dir/flags.make
demo/CMakeFiles/eucsbademo.dir/readparams.o: demo/readparams.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/user/Documents/MATLAB/EE4212/q4/external/sba/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object demo/CMakeFiles/eucsbademo.dir/readparams.o"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/eucsbademo.dir/readparams.o   -c /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/readparams.c

demo/CMakeFiles/eucsbademo.dir/readparams.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/eucsbademo.dir/readparams.i"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/readparams.c > CMakeFiles/eucsbademo.dir/readparams.i

demo/CMakeFiles/eucsbademo.dir/readparams.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/eucsbademo.dir/readparams.s"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/readparams.c -o CMakeFiles/eucsbademo.dir/readparams.s

demo/CMakeFiles/eucsbademo.dir/readparams.o.requires:
.PHONY : demo/CMakeFiles/eucsbademo.dir/readparams.o.requires

demo/CMakeFiles/eucsbademo.dir/readparams.o.provides: demo/CMakeFiles/eucsbademo.dir/readparams.o.requires
	$(MAKE) -f demo/CMakeFiles/eucsbademo.dir/build.make demo/CMakeFiles/eucsbademo.dir/readparams.o.provides.build
.PHONY : demo/CMakeFiles/eucsbademo.dir/readparams.o.provides

demo/CMakeFiles/eucsbademo.dir/readparams.o.provides.build: demo/CMakeFiles/eucsbademo.dir/readparams.o

# Object files for target eucsbademo
eucsbademo_OBJECTS = \
"CMakeFiles/eucsbademo.dir/eucsbademo.o" \
"CMakeFiles/eucsbademo.dir/imgproj.o" \
"CMakeFiles/eucsbademo.dir/readparams.o"

# External object files for target eucsbademo
eucsbademo_EXTERNAL_OBJECTS =

demo/eucsbademo: demo/CMakeFiles/eucsbademo.dir/eucsbademo.o
demo/eucsbademo: demo/CMakeFiles/eucsbademo.dir/imgproj.o
demo/eucsbademo: demo/CMakeFiles/eucsbademo.dir/readparams.o
demo/eucsbademo: demo/CMakeFiles/eucsbademo.dir/build.make
demo/eucsbademo: libsba.dylib
demo/eucsbademo: demo/CMakeFiles/eucsbademo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable eucsbademo"
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/eucsbademo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demo/CMakeFiles/eucsbademo.dir/build: demo/eucsbademo
.PHONY : demo/CMakeFiles/eucsbademo.dir/build

demo/CMakeFiles/eucsbademo.dir/requires: demo/CMakeFiles/eucsbademo.dir/eucsbademo.o.requires
demo/CMakeFiles/eucsbademo.dir/requires: demo/CMakeFiles/eucsbademo.dir/imgproj.o.requires
demo/CMakeFiles/eucsbademo.dir/requires: demo/CMakeFiles/eucsbademo.dir/readparams.o.requires
.PHONY : demo/CMakeFiles/eucsbademo.dir/requires

demo/CMakeFiles/eucsbademo.dir/clean:
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo && $(CMAKE_COMMAND) -P CMakeFiles/eucsbademo.dir/cmake_clean.cmake
.PHONY : demo/CMakeFiles/eucsbademo.dir/clean

demo/CMakeFiles/eucsbademo.dir/depend:
	cd /Users/user/Documents/MATLAB/EE4212/q4/external/sba && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/user/Documents/MATLAB/EE4212/q4/external/sba /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo /Users/user/Documents/MATLAB/EE4212/q4/external/sba /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo /Users/user/Documents/MATLAB/EE4212/q4/external/sba/demo/CMakeFiles/eucsbademo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demo/CMakeFiles/eucsbademo.dir/depend

