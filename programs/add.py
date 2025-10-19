import numpy as np
import pycuda.driver as cuda
import pycuda.autoinit
from pycuda.compiler import SourceModule

kernel = """
__global__ void add_arrays(float* A, float* B, float* C, int N) {

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}
"""

mod = SourceModule(kernel)
add_arrays = mod.get_function("add_arrays")

N = 1000

a = np.random.randn(N).astype(np.float32)
b = np.random.randn(N).astype(np.float32)
c = np.zeros_like(a)

add_arrays(cuda.In(a), cuda.In(b), cuda.Out(c), block=(10,1,1))
print(c)
