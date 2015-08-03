#include <iostream>
#include <stdio.h>
#include <stdlib.h>

int main(void) {

    int num_bits = 16;
    int num_bytes = num_bits * sizeof(int);

    int* device_array = 0;
    int* host_array = 0;
    
    host_array = (int*) malloc(num_bytes);

    cudaMalloc((void**)&device_array, num_bytes);
    cudaMemset(device_array, 0, num_bytes);
    cudaMemcpy(host_array, device_array, num_bytes, 
            cudaMemcpyDeviceToHost);
    for (int i = 0; i < 16; i++) {
        std::cout<<host_array[i]<<std::endl;
    }

    free(host_array);
    cudaFree(device_array);
    return 0;
}

