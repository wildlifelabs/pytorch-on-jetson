import torch
import os
import torchvision
# from PIL import __version__, features


# os.environ["LD_LIBRARY_PATH"]="/usr/local/cuda-12.2/targets/aarch64-linux/lib"
# os.environ["CUDA_HOME"]="/usr/local/cuda-12.2"

print(f"PyTorch version: {torch.__version__}")
print(f"Torchvision version: {torchvision.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
print(f"CUDA version: {torch.version.cuda}")
# print(f"PIL version: {__version__}")
# print(f"JPEGTurbo Installed: {features.check_feature('libjpeg_turbo')}")
print()
print("CUDA check")
torch.rand(2, 3, device='cuda') @ torch.rand(3, 2, device='cuda')
print()
print("Magma Check")
torch.svd(torch.rand(3,3, device='cuda')) # Check MAGMA-CUDA is working

