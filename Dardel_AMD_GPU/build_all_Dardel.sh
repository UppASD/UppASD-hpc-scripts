#!/bin/bash

# Each build has its own build directory, with the executable in <build dir>/bin
../../UppASD/UppASD-hpc-scripts/Dardel_AMD_GPU/Build_GPU_GNU.sh
../../UppASD/UppASD-hpc-scripts/Dardel_AMD_GPU/Build_GPU_AMD.sh
../../UppASD/UppASD-hpc-scripts/Dardel_AMD_GPU/Build_GPU_Cray.sh

ls -l build_GPU_*/bin/sd.*
