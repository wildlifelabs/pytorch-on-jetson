#!/bin/bash
source venv/bin/activate
export PATH="/usr/local/cuda-12.2/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.2/compat"
export CUDACXX="/usr/local/cuda-12.2/bin/nvcc"
export CUDA_HOME="/usr/local/cuda-12.2"
docker run --shm-size=1g -it --runtime nvidia --privileged --rm -v /run/jtop.sock:/run/jtop.sock -v /usr/local/cuda-12.2:/usr/local/cuda -v /usr/local/cuda-12.2:/usr/local/cuda-12.2 --name jetson-baseline-instance jetson-baseline /work/deviceQuery




