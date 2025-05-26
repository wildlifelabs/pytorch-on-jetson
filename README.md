# pytorch-on-jetson
Build scripts for building PyTorch 2.7 using CUDA 12.2 on NVidia Xavier AGX with support for Python 3.13

You see you can get hold of the previous generation NVidia Jetson Xavier AGX hardware on the cheap - eBay is your friend! But can you do anything with this? Well, yes you can. Unfortunately, the documentation is not that great - and seems to be spread across multiple sites. So this project seeks to consolidate all of this into one place. 

## Step 1
Install the full Jetpack 5.1.5 (the last available for the Jetson Xavier AGX) which ships with CUDA 11.4

## Step 2
You need to update the subsystem for CUDA on the Jetson. Read the following document and then install using the download link:
* https://docs.nvidia.com/cuda/cuda-for-tegra-appnote/index.html#upgradable-package-for-jetson
* https://developer.nvidia.com/cuda-12-2-2-download-archive?target_os=Linux&target_arch=aarch64-jetson&Compilation=Native&Distribution=Ubuntu&target_version=20.04&target_type=deb_local

This approach will get the hardware up to CUDA 12.2 however it requires special environment to be set when using it. This is covered in the shell scripts.

You should be able to use `test_cuda.sh` to check the output of `deviceQuery` with the correct environment variables set so CUDA 12.2 is working. I found that while deviceQuery says it has 12.2 drivers and 11.4 runtime, when PyTorch goes to use CUDA, it's 12.2 all the way. Don't panic.

## Step 3
update the Python 3 version using the embedded Conda environment by running `conda install python=3.13`

## Step 4
run `install_dependencies.sh` which adds all the required libraries to build PyTorch 2.7 that the Jetson can support.

## Step 5
run `checkout_pytorch.sh` to check out PyTorch and TorchVision code and all submodules

## Step 6
run `build_magma.sh` to build the Magma dependency

## Step 7
run `build_pytorch.sh` to finally build Pytorch and Torchvision. This process will saturate all eight cores of your Jetson for about 11 hours. You should ensure you have set the power profile to `MAXN` and are using a proper cooling solution.

## Step 8
You can now use `test_pytorch.sh` to test the local build worked as expected. It will create a new venv, install the newly built wheels and test they work.

## Step 9
Use `build_pytorch_docker.sh` to build the docker container with all the dependencies PyTorch and TorchVision require - as well as Python 3.13

## Step 10
Ok, now for the magic - use `test_pytorch_docker.sh` to test CUDA, PyTorch and TorchVision on the container. You need to pay very close attention to the command-line parameters being used to run Docker for your own project. ALL of these parameters are essential for CUDA to work correctly, especially mapping the LOCAL CUDA INSTALL into the container since we need the compatability layer to be surfaced in the container. 


