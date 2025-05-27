#!/bin/bash
source ./venv/bin/activate
export DESIRED_CUDA=12.2
# export PACKAGE_NAME=magma-cuda
export CMAKE_POLICY_VERSION_MINIMUM=3.5
export TORCH_CUDA_ARCH_LIST="7.2"
export CUDA_VERSION=12.2
export USE_CUDA=1
export FORCE_CUDA=1
export USE_PRIORITIZED_TEXT_FOR_LD=1
export BUILD_TEST=0
export USE_CUDNN=1
export USE_CUFILE=0
export NB_COMPILE_JOBS=8
export _GLIBCXX_USE_CXX11_ABI=1
export USE_DISTRIBUTED=0

export PATH="/usr/local/cuda-12.2/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.2/compat"
export CUDACXX="/usr/local/cuda-12.2/bin/nvcc"
export CUDA_HOME="/usr/local/cuda-12.2"


cd vision
source ../venv/bin/activate;python setup.py bdist_wheel


