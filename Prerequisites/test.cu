#include<stdio.h>
#include<iostream>

__global__ void foo() {}

int main() {
    foo<<<1,1>>>();
    std::cout<<"The Result is "
        <<cudaGetErrorString(cudaGetLastError())<<std::endl;

    return 0;
}
