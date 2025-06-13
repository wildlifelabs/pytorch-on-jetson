#!/bin/bash
python3 -m venv venv
source ./venv/bin/activate;python -m pip install cmake ninja # mkl-static mkl-include
source ./venv/bin/activate;python -m pip install -r pytorch/requirements.txt --verbose
sudo cp ./pytorch/.ci/magma/magma-cuda/build/include/* /usr/local/include/
sudo cp ./pytorch/.ci/magma/magma-cuda/build/lib/* /usr/local/lib/


