#include <cuda_runtime.h>
#include <helper_cuda.h>
#include "libcuda.h"


__global__ void kernel_VectorAddScalar(float *v, float *scalar)
{
    int thread_idx = threadIdx.x + blockIdx.x*blockDim.x;
    v[thread_idx] = v[thread_idx] + *scalar;
}

int CcuVectorAddScalar::Add(float *v, float scalar)
{
   cudaError_t error_code = cudaSuccess;

    // allocate v's replica in device mem
    float *d_v = NULL;
    error_code = cudaMalloc((void **)&d_v, 1e6*sizeof(float));
    if (error_code != cudaSuccess)
        return error_code;

    // allocate scalar replica in device mem
    float *d_scalar = NULL;
    error_code = cudaMalloc((void **)&d_scalar, sizeof(float));
    if (error_code != cudaSuccess)
        return error_code;

    // copy vector to device mem
    error_code = cudaMemcpy(d_v, v, 1e6*sizeof(float), cudaMemcpyHostToDevice);
    if (error_code != cudaSuccess)
        return error_code;
    // copy scalar to device mem
    error_code = cudaMemcpy(d_scalar, &scalar, sizeof(float), cudaMemcpyHostToDevice);
    if (error_code != cudaSuccess)
        return error_code;

    // invoke kernel
    kernel_VectorAddScalar<<<1000, 1000>>>(d_v, d_scalar);
    error_code = cudaGetLastError();
    if (error_code != cudaSuccess)
        return error_code;

    // copy result back to host (in place)
    error_code = cudaMemcpy(v, d_v, 1e6*sizeof(float), cudaMemcpyDeviceToHost);
    if (error_code != cudaSuccess)
        return error_code;

    return 0;

 }