cmake_minimum_required(VERSION 3.10)

project(main)

file(GLOB sources  "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_executable(main ${sources})
