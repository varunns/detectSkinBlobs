# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs

# Include any dependencies generated for this target.
include CMakeFiles/blobslib.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/blobslib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/blobslib.dir/flags.make

CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o: CMakeFiles/blobslib.dir/flags.make
CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o: cvBlobsLib/src/blob.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o -c /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/blob.cpp

CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/blob.cpp > CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.i

CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/blob.cpp -o CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.s

CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.requires:
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.requires

CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.provides: CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.requires
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.provides.build
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.provides

CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.provides.build: CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o: CMakeFiles/blobslib.dir/flags.make
CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o: cvBlobsLib/src/BlobResult.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o -c /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobResult.cpp

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobResult.cpp > CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.i

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobResult.cpp -o CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.s

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.requires:
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.requires

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.provides: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.requires
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.provides.build
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.provides

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.provides.build: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o

CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o: CMakeFiles/blobslib.dir/flags.make
CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o: cvBlobsLib/src/ComponentLabeling.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o -c /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/ComponentLabeling.cpp

CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/ComponentLabeling.cpp > CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.i

CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/ComponentLabeling.cpp -o CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.s

CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.requires:
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.requires

CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.provides: CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.requires
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.provides.build
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.provides

CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.provides.build: CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o: CMakeFiles/blobslib.dir/flags.make
CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o: cvBlobsLib/src/BlobContour.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o -c /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobContour.cpp

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobContour.cpp > CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.i

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobContour.cpp -o CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.s

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.requires:
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.requires

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.provides: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.requires
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.provides.build
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.provides

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.provides.build: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o: CMakeFiles/blobslib.dir/flags.make
CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o: cvBlobsLib/src/BlobOperators.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o -c /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobOperators.cpp

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobOperators.cpp > CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.i

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/cvBlobsLib/src/BlobOperators.cpp -o CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.s

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.requires:
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.requires

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.provides: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.requires
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.provides.build
.PHONY : CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.provides

CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.provides.build: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o

# Object files for target blobslib
blobslib_OBJECTS = \
"CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o" \
"CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o" \
"CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o" \
"CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o" \
"CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o"

# External object files for target blobslib
blobslib_EXTERNAL_OBJECTS =

libblobslib.a: CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o
libblobslib.a: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o
libblobslib.a: CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o
libblobslib.a: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o
libblobslib.a: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o
libblobslib.a: CMakeFiles/blobslib.dir/build.make
libblobslib.a: CMakeFiles/blobslib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libblobslib.a"
	$(CMAKE_COMMAND) -P CMakeFiles/blobslib.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/blobslib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/blobslib.dir/build: libblobslib.a
.PHONY : CMakeFiles/blobslib.dir/build

CMakeFiles/blobslib.dir/requires: CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o.requires
CMakeFiles/blobslib.dir/requires: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o.requires
CMakeFiles/blobslib.dir/requires: CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o.requires
CMakeFiles/blobslib.dir/requires: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o.requires
CMakeFiles/blobslib.dir/requires: CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o.requires
.PHONY : CMakeFiles/blobslib.dir/requires

CMakeFiles/blobslib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/blobslib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/blobslib.dir/clean

CMakeFiles/blobslib.dir/depend:
	cd /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles/blobslib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/blobslib.dir/depend

