cmake_minimum_required(VERSION 3.8)
project(c_project)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES string_reader.c vector.c)
add_executable(c_project ${SOURCE_FILES})