cmake_minimum_required(VERSION  3.10)

# "go" to another directory for a another "CMakeLists.txt" recipe to build "libcuda.lib" lib-target
add_subdirectory(LibCuda)

message(STATUS "-vv------------------------------------------------------ " )
message(STATUS "-vv- CMakeList.txt @ cmake_cuda_example" )
message(STATUS "-vv------------------------------------------------------ " )

# open cpp project
project(cmake_cuda LANGUAGES CXX CUDA)

# build the exe-target "cmake_cuda_main.exe"
add_executable(cmake_cuda main.cpp)


# link the lib-target with the exe-target, to yield the fatbin file exe (containing the cuda kernels +
# the cpp code )
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

target_link_libraries(cmake_cuda PRIVATE CUDA::cudart libcuda)







