#!/bin/bash

# Each build has its own build directory, with the executable in <build dir>/bin
../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_GNU.sh
../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_GNU_rocm724.sh
../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_AMD.sh
../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_AMD_rocm724.sh
../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_Cray.sh
../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_Cray_rocm724.sh

ls -l build_GPU_*/bin/sd.*
