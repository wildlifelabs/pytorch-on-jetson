#!/bin/bash
source venv/bin/activate
export PATH="/usr/local/cuda-12.2/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.2/compat"
# export LD_LIBRARY_PATH="/usr/local/cuda-12.2/targets/aarch64-linux/lib:/lib"
export CUDACXX="/usr/local/cuda-12.2/bin/nvcc"
export CUDA_HOME="/usr/local/cuda-12.2"
# export PYTORCH_NVML_BASED_CUDA_CHECK="1"
cd realtime-welfare
source ../venv/bin/activate;python check_cuda.py
cd ../
deviceQuery/deviceQuery



