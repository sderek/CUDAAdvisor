# CUDAAdvisor

CUDAAdvisor is a profiling tool for GPU.

## Hardware Depebdencies
  - GPU server with cc 3.5 or later
 
## Software Depebdencies
  - LLVM 4.0 or later
  - CUDA 7.0 or later
  - cmake 3.4.3 or later

## Installation
Your system should have LLVM installed.

`$ cd [llvm source tree]/lib/Transforms/`

`$ git clone https://github.com/sderek/CUDAAdvisor.git`

And copy the fowllowing lines into `lib/Transforms/CMakeLists.txt`

`add_subdirectory(CUDAAdvisor)`

Go to the top level of your LLVM build directory and rebuild, you should get a new file `lib/LLVMCudaAdvisor.so`. You are able to use the **opt** tool to access it. There is an exmple in `src/` subdirectory and a template is provided.

## Paper
[CGO'18] CUDAAdvisor: LLVM-based Runtime Profiling for Modern GPUs

## Authors
Du Shen, College of William and Mary

Leon Shuaiwen Song, Pacific Northwest National Laboratory

Ang Li, Pacific Northwest National Laboratory

Xu Liu, College of William and Mary
