cmake_minimum_required(VERSION 3.1)

project(lib)

file(GLOB sources "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_library(lib STATIC ${sources})
target_include_directories(lib PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")


