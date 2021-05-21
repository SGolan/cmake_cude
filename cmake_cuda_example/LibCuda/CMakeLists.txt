cmake_minimum_required(VERSION  3.10)

# open cpp+cuda project
# may see : https://cmake.org/cmake/help/latest/module/FindCUDAToolkit.html
project(libcuda LANGUAGES CXX CUDA)

find_package(CUDAToolkit)
if(NOT ${CUDAToolkit_FOUND})
    message(FATAL_ERROR "Error : failed to find CUDA toolkit")
else()
    message(STATUS      "NVCC ${CUDAToolkit_VERSION_MAJOR}.{CUDAToolkit_VERSION_MINOR} found @ ${CUDAToolkit_BIN_DIR}")
    message(STATUS      "CUDA include directory: ${CUDAToolkit_INCLUDE_DIR}"                                          )
    message(STATUS      "CUDA helper directory: ${CUDAToolkit_INCLUDE_DIRS}/../samples/common/inc"                    )
    
endif()

set(CMAKE_CUDA_ARCHITECTURES 61 75 86)

# build the lib-target "libcuda.lib"
file(GLOB_RECURSE sources "${CMAKE_CURRENT_SOURCE_DIR}/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.cu")
add_library(libcuda ${sources})

# add "include" folder to compiler's "-I" list of include directories
# notice the PRBLIC attribute, this exports the path to whatever CMakeLists.txt to use
# this library/CMakeLists.txt
target_include_directories( libcuda PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/include" 
                                    PRIVATE "${CUDAToolkit_INCLUDE_DIRS}"    
                                    PRIVATE "${CUDAToolkit_INCLUDE_DIRS}/../samples/common/inc" 
                                    PRIVATE "/usr/local/cuda-11.2/samples/common/inc"  )
