#include <stdio.h>

__global__ void infinite_loop(long long int msg) {
    
    while (true) {
        printf("%d", msg);
        msg += 2;
        printf("\n");
    }
}

int main() {

    long long int a = 1;

    infinite_loop<<<1024,1024>>>(a);
    cudaError_t err = cudaGetLastError();

    if (err != cudaSuccess)
        printf("CUDA Error: %s\n", cudaGetErrorString(err));

    cudaDeviceSynchronize();

    return 0;
}
