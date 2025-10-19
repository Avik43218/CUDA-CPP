#include <stdio.h>
#include <cuda_runtime.h>

__global__ void cuda_hello() {
    printf("Hello World\n");
}

int main() {
    cuda_hello<<<1,1>>>();
    cudaError_t err = cudaDeviceSynchronize();

    if (err != cudaSuccess)
        printf("CUDA Error: %s\n", cudaGetErrorString(err));
        
    return 0;
}
