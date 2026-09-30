#!/bin/bash

../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_GNU.sh
mv bin/sd.hip bin/sd.hip.gpu_gnu

../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_GNU_rocm724.sh
mv bin/sd.hip bin/sd.hip.gpu_gnu_rocm724

../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_AMD.sh
mv bin/sd.hip bin/sd.hip.gpu_amd

../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_AMD_rocm724.sh
mv bin/sd.hip bin/sd.hip.gpu_amd_rocm724

../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_Cray.sh
mv bin/sd.hip bin/sd.hip.gpu_Cray

../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_Cray_rocm724.sh
mv bin/sd.hip bin/sd.hip.gpu_Cray_rocm724
