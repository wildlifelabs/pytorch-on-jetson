#!/bin/bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/arm64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda-tegra-repo-ubuntu2004-12-2-local_12.2.2-1_arm64.deb
sudo dpkg -i cuda-tegra-repo-ubuntu2004-12-2-local_12.2.2-1_arm64.deb
sudo cp /var/cuda-tegra-repo-ubuntu2004-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
sudo apt-get install -y cuda-compat-12-2

