#!/bin/bash
git clone --recursive --branch v2.7.0 https://github.com/pytorch/pytorch
cd pytorch 
git submodule sync
git submodule update --init --recursive
cd ..
git clone --recursive --branch v0.22.0 https://github.com/pytorch/vision

