#!/bin/bash
if [ "$EUID" != 0 ]; then
    echo "Script must be run as root."
    exit 1
fi
sudo wget -q -O- https://packagecloud.io/dcommander/libjpeg-turbo/gpgkey | sudo gpg --dearmor >/etc/apt/trusted.gpg.d/libjpeg-turbo.gpg
sudo wget -q -O- https://raw.githubusercontent.com/libjpeg-turbo/repo/main/libjpeg-turbo.list >/etc/apt/sources.list.d/libjpeg-turbo.list
sudo apt update
sudo apt install -y --fix-missing --reinstall ca-certificates
sudo apt install -y --fix-missing software-properties-common
sudo apt install -y --fix-missing libjpeg-turbo-official
sudo apt install -y --fix-missing libatlas-base-dev
sudo apt install -y --fix-missing nvidia-opencv-dev
sudo apt install -y --fix-missing libhdf5-serial-dev
sudo apt install -y --fix-missing libopenblas-dev 
sudo apt install -y --fix-missing libnuma-dev libnuma1
sudo apt install -y --fix-missing libpng-dev zlib1g-dev
sudo apt install -y --fix-missing gfortran

sudo apt install -y --fix-missing build-essential cmake pkg-config unzip yasm git checkinstall
sudo apt install -y --fix-missing libjpeg-dev libpng-dev libtiff-dev
sudo apt install -y --fix-missing libavcodec-dev libavformat-dev libswscale-dev libavresample-dev
sudo apt install -y --fix-missing libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install -y --fix-missing libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt install -y --fix-missing libfaac-dev libmp3lame-dev libvorbis-dev
sudo apt install -y --fix-missing libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt install -y --fix-missing libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd ~
sudo apt install -y --fix-missing libgtk-3-dev
sudo apt install -y --fix-missing libtbb-dev
sudo apt install -y --fix-missing libatlas-base-dev gfortran
sudo apt install -y --fix-missing libprotobuf-dev protobuf-compiler
sudo apt install -y --fix-missing libgoogle-glog-dev libgflags-dev
sudo apt install -y --fix-missing libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# assume we have an environment with Jetpack 5 already installed so this works
cp -r /usr/local/cuda-11.4/samples/1_Utilities/deviceQuery ./
cd deviceQuery
make
cd ..
sudo ldconfig

