cmake_minimum_required(VERSION  3.10)

message(STATUS "-vv------------------------------------------------------ " )
message(STATUS "-vv- CMakeList.txt @ LibCuda" )
message(STATUS "-vv------------------------------------------------------ " )

# open cpp+cuda project
# may see : https://cmake.org/cmake/help/latest/module/FindCUDAToolkit.html
project(libcuda LANGUAGES CXX CUDA)

set(vv_cuda_version 11.1)
message(STATUS "-vv- " )
message(STATUS "-vv- VayaVision's required CUDAToolkit version : ${vv_cuda_version}" )
message(STATUS "-vv- " )
set(CUDAToolkit_ROOT "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v11.1")
find_package(CUDAToolkit REQUIRED)
message(STATUS "-vv- CUDAToolkit_VERSION         : ${CUDAToolkit_VERSION}"        )
message(STATUS "-vv- CUDAToolkit_BIN_DIR         : ${CUDAToolkit_BIN_DIR}"        )
message(STATUS "-vv- CUDAToolkit_INCLUDE_DIRS    : ${CUDAToolkit_INCLUDE_DIRS}"   )
message(STATUS "-vv- CUDAToolkit_LIBRARY_DIR     : ${CUDAToolkit_LIBRARY_DIR}"    )
message(STATUS "-vv- CUDAToolkit_NVCC_EXECUTABLE : ${CUDAToolkit_NVCC_EXECUTABLE}")
string(FIND ${CUDAToolkit_VERSION} ${vv_cuda_version} cuda_tool_kit_match)
#message(STATUS "-vv- cuda_tool_kit_match         : ${cuda_tool_kit_match}"        )
if( ${cuda_tool_kit_match} EQUAL "-1" )
    message( FATAL_ERROR "CUDAToolkit mismatch, CMake will exit." )
endif()

# C:\ProgramData\NVIDIA Corporation\CUDA Samples\v11.1\common\inc
set(CMAKE_CUDA_ARCHITECTURES 61 75 86)

# build the lib-target "libcuda.lib"
file(GLOB_RECURSE sources "${CMAKE_CURRENT_SOURCE_DIR}/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.cu")
add_library(libcuda ${sources})

# add "include" folder to compiler's "-I" list of include directories
# notice the PRBLIC attribute, this exports the path to whatever CMakeLists.txt to use
# this library/CMakeLists.txt
target_include_directories( libcuda PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/include" 
                                    PUBLIC "${CUDAToolkit_INCLUDE_DIRS}"    )
                                   # PUBLIC "${CUDAToolkit_INCLUDE_DIRS}/../samples/common/inc"  )
if(UNIX) 
    message(STATUS "-vv- helper_cuda.h : /usr/local/cuda-${CUDAToolkit_VERSION_MAJOR}.${CUDAToolkit_VERSION_MINOR}/samples/common/inc")
    target_include_directories( libcuda PUBLIC "/usr/local/cuda-${CUDAToolkit_VERSION_MAJOR}.${CUDAToolkit_VERSION_MINOR}/samples/common/inc")
else()
    message(STATUS "-vv- helper_cuda.h : C:/ProgramData/NVIDIA Corporation/CUDA Samples/v${CUDAToolkit_VERSION_MAJOR}.${CUDAToolkit_VERSION_MINOR}/common/inc")
    target_include_directories( libcuda PUBLIC "C:/ProgramData/NVIDIA Corporation/CUDA Samples/v${CUDAToolkit_VERSION_MAJOR}.${CUDAToolkit_VERSION_MINOR}/common/inc")
endif()

