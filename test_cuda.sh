#!/bin/bash
export PATH="/usr/local/cuda-12.2/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.2/compat"
export CUDACXX="/usr/local/cuda-12.2/bin/nvcc"
export CUDA_HOME="/usr/local/cuda-12.2"
./deviceQuery



