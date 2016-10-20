# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running interactive CMake command-line interface..."
	/usr/bin/cmake -i .
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/v.nidamarthy/C++/hand_detection/detectSkinBlobs/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named blobslib

# Build rule for target.
blobslib: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 blobslib
.PHONY : blobslib

# fast build rule for target.
blobslib/fast:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/build
.PHONY : blobslib/fast

#=============================================================================
# Target rules for targets named detectskin

# Build rule for target.
detectskin: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 detectskin
.PHONY : detectskin

# fast build rule for target.
detectskin/fast:
	$(MAKE) -f CMakeFiles/detectskin.dir/build.make CMakeFiles/detectskin.dir/build
.PHONY : detectskin/fast

DetectSkinBlobs.o: DetectSkinBlobs.cpp.o
.PHONY : DetectSkinBlobs.o

# target to build an object file
DetectSkinBlobs.cpp.o:
	$(MAKE) -f CMakeFiles/detectskin.dir/build.make CMakeFiles/detectskin.dir/DetectSkinBlobs.cpp.o
.PHONY : DetectSkinBlobs.cpp.o

DetectSkinBlobs.i: DetectSkinBlobs.cpp.i
.PHONY : DetectSkinBlobs.i

# target to preprocess a source file
DetectSkinBlobs.cpp.i:
	$(MAKE) -f CMakeFiles/detectskin.dir/build.make CMakeFiles/detectskin.dir/DetectSkinBlobs.cpp.i
.PHONY : DetectSkinBlobs.cpp.i

DetectSkinBlobs.s: DetectSkinBlobs.cpp.s
.PHONY : DetectSkinBlobs.s

# target to generate assembly for a file
DetectSkinBlobs.cpp.s:
	$(MAKE) -f CMakeFiles/detectskin.dir/build.make CMakeFiles/detectskin.dir/DetectSkinBlobs.cpp.s
.PHONY : DetectSkinBlobs.cpp.s

cvBlobsLib/src/BlobContour.o: cvBlobsLib/src/BlobContour.cpp.o
.PHONY : cvBlobsLib/src/BlobContour.o

# target to build an object file
cvBlobsLib/src/BlobContour.cpp.o:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.o
.PHONY : cvBlobsLib/src/BlobContour.cpp.o

cvBlobsLib/src/BlobContour.i: cvBlobsLib/src/BlobContour.cpp.i
.PHONY : cvBlobsLib/src/BlobContour.i

# target to preprocess a source file
cvBlobsLib/src/BlobContour.cpp.i:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.i
.PHONY : cvBlobsLib/src/BlobContour.cpp.i

cvBlobsLib/src/BlobContour.s: cvBlobsLib/src/BlobContour.cpp.s
.PHONY : cvBlobsLib/src/BlobContour.s

# target to generate assembly for a file
cvBlobsLib/src/BlobContour.cpp.s:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobContour.cpp.s
.PHONY : cvBlobsLib/src/BlobContour.cpp.s

cvBlobsLib/src/BlobOperators.o: cvBlobsLib/src/BlobOperators.cpp.o
.PHONY : cvBlobsLib/src/BlobOperators.o

# target to build an object file
cvBlobsLib/src/BlobOperators.cpp.o:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.o
.PHONY : cvBlobsLib/src/BlobOperators.cpp.o

cvBlobsLib/src/BlobOperators.i: cvBlobsLib/src/BlobOperators.cpp.i
.PHONY : cvBlobsLib/src/BlobOperators.i

# target to preprocess a source file
cvBlobsLib/src/BlobOperators.cpp.i:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.i
.PHONY : cvBlobsLib/src/BlobOperators.cpp.i

cvBlobsLib/src/BlobOperators.s: cvBlobsLib/src/BlobOperators.cpp.s
.PHONY : cvBlobsLib/src/BlobOperators.s

# target to generate assembly for a file
cvBlobsLib/src/BlobOperators.cpp.s:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobOperators.cpp.s
.PHONY : cvBlobsLib/src/BlobOperators.cpp.s

cvBlobsLib/src/BlobResult.o: cvBlobsLib/src/BlobResult.cpp.o
.PHONY : cvBlobsLib/src/BlobResult.o

# target to build an object file
cvBlobsLib/src/BlobResult.cpp.o:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.o
.PHONY : cvBlobsLib/src/BlobResult.cpp.o

cvBlobsLib/src/BlobResult.i: cvBlobsLib/src/BlobResult.cpp.i
.PHONY : cvBlobsLib/src/BlobResult.i

# target to preprocess a source file
cvBlobsLib/src/BlobResult.cpp.i:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.i
.PHONY : cvBlobsLib/src/BlobResult.cpp.i

cvBlobsLib/src/BlobResult.s: cvBlobsLib/src/BlobResult.cpp.s
.PHONY : cvBlobsLib/src/BlobResult.s

# target to generate assembly for a file
cvBlobsLib/src/BlobResult.cpp.s:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/BlobResult.cpp.s
.PHONY : cvBlobsLib/src/BlobResult.cpp.s

cvBlobsLib/src/ComponentLabeling.o: cvBlobsLib/src/ComponentLabeling.cpp.o
.PHONY : cvBlobsLib/src/ComponentLabeling.o

# target to build an object file
cvBlobsLib/src/ComponentLabeling.cpp.o:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.o
.PHONY : cvBlobsLib/src/ComponentLabeling.cpp.o

cvBlobsLib/src/ComponentLabeling.i: cvBlobsLib/src/ComponentLabeling.cpp.i
.PHONY : cvBlobsLib/src/ComponentLabeling.i

# target to preprocess a source file
cvBlobsLib/src/ComponentLabeling.cpp.i:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.i
.PHONY : cvBlobsLib/src/ComponentLabeling.cpp.i

cvBlobsLib/src/ComponentLabeling.s: cvBlobsLib/src/ComponentLabeling.cpp.s
.PHONY : cvBlobsLib/src/ComponentLabeling.s

# target to generate assembly for a file
cvBlobsLib/src/ComponentLabeling.cpp.s:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/ComponentLabeling.cpp.s
.PHONY : cvBlobsLib/src/ComponentLabeling.cpp.s

cvBlobsLib/src/blob.o: cvBlobsLib/src/blob.cpp.o
.PHONY : cvBlobsLib/src/blob.o

# target to build an object file
cvBlobsLib/src/blob.cpp.o:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.o
.PHONY : cvBlobsLib/src/blob.cpp.o

cvBlobsLib/src/blob.i: cvBlobsLib/src/blob.cpp.i
.PHONY : cvBlobsLib/src/blob.i

# target to preprocess a source file
cvBlobsLib/src/blob.cpp.i:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.i
.PHONY : cvBlobsLib/src/blob.cpp.i

cvBlobsLib/src/blob.s: cvBlobsLib/src/blob.cpp.s
.PHONY : cvBlobsLib/src/blob.s

# target to generate assembly for a file
cvBlobsLib/src/blob.cpp.s:
	$(MAKE) -f CMakeFiles/blobslib.dir/build.make CMakeFiles/blobslib.dir/cvBlobsLib/src/blob.cpp.s
.PHONY : cvBlobsLib/src/blob.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... blobslib"
	@echo "... detectskin"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... DetectSkinBlobs.o"
	@echo "... DetectSkinBlobs.i"
	@echo "... DetectSkinBlobs.s"
	@echo "... cvBlobsLib/src/BlobContour.o"
	@echo "... cvBlobsLib/src/BlobContour.i"
	@echo "... cvBlobsLib/src/BlobContour.s"
	@echo "... cvBlobsLib/src/BlobOperators.o"
	@echo "... cvBlobsLib/src/BlobOperators.i"
	@echo "... cvBlobsLib/src/BlobOperators.s"
	@echo "... cvBlobsLib/src/BlobResult.o"
	@echo "... cvBlobsLib/src/BlobResult.i"
	@echo "... cvBlobsLib/src/BlobResult.s"
	@echo "... cvBlobsLib/src/ComponentLabeling.o"
	@echo "... cvBlobsLib/src/ComponentLabeling.i"
	@echo "... cvBlobsLib/src/ComponentLabeling.s"
	@echo "... cvBlobsLib/src/blob.o"
	@echo "... cvBlobsLib/src/blob.i"
	@echo "... cvBlobsLib/src/blob.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

