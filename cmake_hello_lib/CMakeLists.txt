cmake_minimum_required(VERSION 3.1)

project(main)

file(GLOB sources "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_executable(main ${sources})
add_subdirectory(Lib)

target_link_libraries(main PRIVATE lib)


