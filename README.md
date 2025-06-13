# pytorch-on-jetson
Build scripts for building PyTorch 2.7 using CUDA 12.2 on NVidia Xavier AGX with support for Python 3.13

You see you can get hold of the previous generation NVidia Jetson Xavier AGX hardware on the cheap - eBay is your friend! But can you do anything with this? Well, yes you can. Unfortunately, the documentation is not that great - and seems to be spread across multiple sites. So this project seeks to consolidate all of this into one place. 

## Step 1
Flash the Xavier AGX and install the full Jetpack 5.1.5 (the last available for the Jetson Xavier AGX) which ships with CUDA 11.4
You may need to also use:
* `sudo apt install nvidia-jetpack` 
* complete installation and reboot.

Also consider installing jtop:
* `sudo apt install python3-pip`
* `sudo pip3 install -U jetson-stats`
* complete installation and reboot

## Step 2
You need to update the subsystem for CUDA on the Jetson. 
* run `install_cuda.sh` which configures and download CUDA 12.2 and also configures Jetson compatability support 
* complete installation and reboot
 
You can read the following background documentation/download link:
* https://docs.nvidia.com/cuda/cuda-for-tegra-appnote/index.html#upgradable-package-for-jetson
* https://developer.nvidia.com/cuda-12-2-2-download-archive?target_os=Linux&target_arch=aarch64-jetson&Compilation=Native&Distribution=Ubuntu&target_version=20.04&target_type=deb_local

You should be able to use `test_cuda.sh` once you complete *step 4* to check the output of `deviceQuery` with the correct environment variables set so CUDA 12.2 is working. 

I found that while deviceQuery says it has 12.2 drivers and 11.4 runtime, when PyTorch goes to use CUDA, it's 12.2 all the way. Don't panic.

## Step 3
* run `install_python.sh` to update the Python 3 version using Miniconda environment by running.
* complete installation and restart your shell (or reboot) 

## Step 4
* run `sudo install_dependencies.sh` which adds all the required libraries to build PyTorch 2.7 that the Jetson can support.
* complete installation and reboot

## Step 5
* run `checkout_pytorch.sh` to check out PyTorch and TorchVision code and all submodules
* run `install_pytorch_dependencies.sh` to then install all of the python libraries required to build

## Step 6
run `build_magma.sh` to build the Magma dependency

## Step 7
run `build_pytorch.sh` to finally build Pytorch and `build_vision.sh` to build Torchvision. This process will saturate all eight cores of your Jetson for about 11 hours. You should ensure you have set the power profile to `MAXN` and are using a proper cooling solution.

## Step 8
Optionally, you can now install the `whl` files from the `dist` directory into the `venv` and use `test_cuda.sh` and `test_pytorch.sh` to test the local build worked as expected. It will test using the existing venv. Better to test using the docker version.

## Step 9
Use `build_docker.sh` to build the docker container with all the dependencies PyTorch and TorchVision require - as well as Python 3.13

## Step 10
Ok, now for the magic - use `test_cuda_docker.sh` and `test_pytorch_docker.sh` to test CUDA, PyTorch and TorchVision on the container. You need to pay very close attention to the command-line parameters being used to run Docker for your own project. ALL of these parameters are essential for CUDA to work correctly, especially mapping the LOCAL CUDA INSTALL into the container since we need the compatability layer to be surfaced in the container. 


