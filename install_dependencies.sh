#!/bin/bash
python3 -m venv venv
sudo wget -q -O- https://packagecloud.io/dcommander/libjpeg-turbo/gpgkey | sudo gpg --dearmor >/etc/apt/trusted.gpg.d/libjpeg-turbo.gpg
sudo wget -q -O- https://raw.githubusercontent.com/libjpeg-turbo/repo/main/libjpeg-turbo.list >/etc/apt/sources.list.d/libjpeg-turbo.list
sudo apt update
sudo apt install -y --fix-missing --reinstall ca-certificates
sudo apt install -y --fix-missing software-properties-common
sudo apt install -y --fix-missing libjpeg-turbo-official
sudo apt install -y --fix-missing libatlas-base-dev
sudo apt install -y --fix-missinf nvidia-opencv-dev
sudo apt install -y --fix-missing libhdf5-serial-dev
sudo apt install -y --fix-missing libopenblas-dev 
sudo apt install -y --fix-missing libnuma-dev libnuma1
sudo apt install -y --fix-missing libpng-dev zlib1g-dev
sudo apt install -y --fix-missing gfortran
source ./venv/bin/activate;python -m pip install cmake ninja # mkl-static mkl-include
source ./venv/bin/activate;python -m pip install -r pytorch/requirements.txt --verbose
sudo cp ./pytorch/.ci/magma/magma-cuda/build/include/* /usr/local/include/
sudo cp ./pytorch/.ci/magma/magma-cuda/build/lib/* /usr/local/lib/

sudo apt install build-essential cmake pkg-config unzip yasm git checkinstall
sudo apt install libjpeg-dev libpng-dev libtiff-dev
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libavresample-dev
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt install libfaac-dev libmp3lame-dev libvorbis-dev
sudo apt install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd ~
sudo apt-get install libgtk-3-dev
sudo apt-get install libtbb-dev
sudo apt-get install libatlas-base-dev gfortran
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# assume we have an environment with Jetpack 5 already installed so this works
cp -r /usr/local/cuda-11.4/samples/1_Utilities/deviceQuery ./
cd deviceQuery
make
cd ..
sudo ldconfig
