#include "gpu_merkle.h"
#include <cuda_error_check.h>
#include "sha256_gpu.h"
__global__ 
void merkelKernel(char *header, int headerLen){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // each thread handles a consecutive pair of hashes
    if(i*2+1>=headerLen) return; // out of bounds
    //for hash indexing

    unsigned char* left = (unsigned char*) (header + (i * 2)*32);// left hash
    unsigned char* right = (unsigned char*) (header + (i * 2+1)*32); // right hash
    unsigned char * out = (unsigned char * )(header+i);// output slot (thread itself)
    //for calculating
    unsigned char combined_hashes[64];
    memcpy(combined_hashes, left, 32);
    memcpy(combined_hashes + 32, right, 32);

    //calling self created hashfunction to hash them together
    unsigned char hash_output[32]; // output of the hash function
    sha256_device(combined_hashes, 64, hash_output); // hash the combined hashes
    memcpy(out, hash_output, 32); // store resultant hash into thread id place
}
