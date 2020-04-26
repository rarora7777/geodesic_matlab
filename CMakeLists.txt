cmake_minimum_required (VERSION 3.1)

project(geodesic)

include_directories("include")

set(CMAKE_DEBUG_POSTFIX "_debug")
set(CMAKE_RELEASE_POSTFIX "_release")

add_library(${PROJECT_NAME} SHARED "src/geodesic_matlab_api.cpp")


add_executable("example0" "src/example0.cpp")
add_executable("example1" "src/example1.cpp")