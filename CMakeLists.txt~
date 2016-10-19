cmake_minimum_required(VERSION 2.8)

project(detectSkinBlobs)

find_package(OpenCV REQUIRED)

file(GLOB SOURCES "cvBlobsLib/src/*.h" "cvBlobsLib/src/*.cpp")

add_library(blobslib ${SOURCES})

add_executable(detectskin DetectSkinBlobs.cpp)
target_link_libraries(detectskin blobslib ${OpenCV_LIBS})
