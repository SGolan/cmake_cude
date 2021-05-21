cmake_minimum_required(VERSION  3.10)

# open cpp project
project(cmake_cuda LANGUAGES CXX)

find_package(CUDAToolkit)
if(NOT ${CUDAToolkit_FOUND})
    message(FATAL_ERROR "Error : failed to find CUDA toolkit")
else()
    message(STATUS      "NVCC ${CUDAToolkit_VERSION_MAJOR}.{CUDAToolkit_VERSION_MINOR} found @ ${CUDAToolkit_BIN_DIR}")
    message(STATUS      "CUDA include directory: ${CUDAToolkit_INCLUDE_DIR}"                                          )
    message(STATUS      "CUDA helper directory: ${CUDAToolkit_INCLUDE_DIRS}/../samples/common/inc"                    )
    
endif()

# build the exe-target "cmake_cuda_main.exe"
add_executable(cmake_cuda main.cpp)

# "go" to another directory for a another "CMakeLists.txt" recipe to build "libcuda.lib" lib-target
add_subdirectory(LibCuda)

# link the lib-target with the exe-target, to yield the fatbin file exe (containing the cuda kernels +
# the cpp code )
target_link_libraries(cmake_cuda PRIVATE CUDA::cudart libcuda)







