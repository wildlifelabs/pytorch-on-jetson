#!/bin/bash
root="$( cd "$( dirname "$0" )" >/dev/null 2>&1 && pwd )" 
cd /usr/local/cuda-11.4/samples/1_Utilities/deviceQuery
sudo make
cp ./deviceQuery $root

