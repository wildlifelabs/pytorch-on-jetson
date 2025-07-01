# pytorch-on-jetson
Build scripts for building PyTorch 2.7 using CUDA 12.2 on NVidia Xavier AGX with support for Python 3.13

You see you can get hold of the previous generation NVidia Jetson Xavier AGX hardware on the cheap - eBay is your friend! But can you do anything with this? Well, yes you can. Unfortunately, the documentation is not that great - and seems to be spread across multiple sites. So this project seeks to consolidate all of this into one place. 

## Step 1
Flash the Xavier AGX and install the full Jetpack 5.1.5 (the last available for the Jetson Xavier AGX) which ships with CUDA 11.4

## Step 2
* Run `install_jetson_stats.sh`
* Complete installation and reboot.

## Step 3
You need to update the subsystem for CUDA on the Jetson. 
* Run `install_cuda.sh`, which configures and downloads CUDA 12.2 and also configures Jetson compatibility support 

## Step 4
* Run the command `sudo usermod -a -G docker $USER`, which is required to enable your local user to use Docker.

## Step 5
* Run `sudo install_dependencies.sh`, which adds all the required libraries to build PyTorch 2.7 that the Jetson can support.
* complete installation and reboot

## Step 6
Now you have the latest CUDA compiler and examples, you can build Device Query: 
* Run `install_dquery.sh`
I found that while deviceQuery reports it has 12.2 drivers and 11.4 runtime, when PyTorch uses CUDA, it's 12.2 all the way. Don't panic.
* You should now be able to see the output of Device Query using the latest CUDA by using `test_cuda.sh`. 

## Step 7
* Run `install_python.sh` to update the Python 3 version using the Miniconda environment.
* Complete installation and restart your shell (or reboot) 

## Step 8
* Run `checkout_pytorch.sh` to check out PyTorch and TorchVision code and all submodules

## Step 9
* Run `install_pytorch_dependencies.sh` to then install all of the python libraries required to build

## Step 10
* Run `build_magma.sh` to build the Magma dependency

## Step 11
* Run `build_pytorch.sh` to finally build Pytorch. This process will saturate all eight cores of your Jetson for several hours. You should ensure you have set the power profile to `MAXN` and are using a proper cooling solution.

## Step 12
* Run `install_pytorch.sh` to install the output of the previous step into the python environment for the next step to work correctly.

## Step 13
* Run `build_vision.sh` to build Torchvision. This process will saturate all eight cores of your Jetson again.
* Note that we are installing PyTorch locally in our `env` so we can build TorchVision - not to use it in anger.

## Step 14
* Use `build_docker.sh` to build the docker container with all the dependencies PyTorch and TorchVision require - as well as Python 3.13

## Step 15
* Ok, now for the magic - use `test_cuda_docker.sh` and `test_pytorch_docker.sh` to test CUDA, PyTorch and TorchVision on the container. You need to pay very close attention to the command-line parameters being used to run Docker for your own project. ALL of these parameters are essential for CUDA to work correctly, especially mapping the LOCAL CUDA INSTALL into the container since we need the compatibility layer to be surfaced in the container. 


