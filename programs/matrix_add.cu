#include <iostream>

__global__ float* GenerateMatrix(float* d_matrix, int rows, int cols) {

    

}

__global__ void MatAdd(float* A, float* B, float* C) {
    
    int i = threadIdx.x;
    int j = threadIdx.y;
    C[i][j] = A[i][j] + B[i][j];

    
}