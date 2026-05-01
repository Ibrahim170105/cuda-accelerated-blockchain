#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "mining_gpu.h"

// pair<string,string> findHash(int index, string prevHash, vector<string> &merkle) {
//     string header = to_string(index) + prevHash + getMerkleRoot(merkle);
//     unsigned int nonce;
//     for (nonce = 0; nonce < 100000000000; nonce++ ) {
//         string blockHash = sha256(header + to_string(nonce));
//         if (blockHash.substr(0,6) == "000000"){
//             // cout << "nonce: " << nonce;
//             // cout << "header: " << header;
//             return make_pair(blockHash,to_string(nonce));
//             break;
//         }
//     }
//     return make_pair("fail","fail");
// }
// __global__ void findHashGPU(int index, char * prevHash, char * merkleRoot, char * resultHash, char * resultNonce) {
//     int nonce = blockIdx.x * blockDim.x + threadIdx.x;
//     if (nonce < 100000000000) {
//         string header = to_string(index) + string(prevHash) + string(merkleRoot);
//         string blockHash = sha256(header + to_string(nonce));
//         if (blockHash.substr(0,6) == "000000"){
//             // Copy the result back to the host
//             strcpy(resultHash, blockHash.c_str());
//             strcpy(resultNonce, to_string(nonce).c_str());
//         }
//     }
// }