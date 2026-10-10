#!/bin/bash

../../UppASD/UppASD-hpc-scripts/Dardel_AMD_GPU/Build_GPU_GNU.sh
mv bin/sd.hip bin/sd.hip.gpu_gnu

../../UppASD/UppASD-hpc-scripts/Dardel_AMD_GPU/Build_GPU_AMD.sh
mv bin/sd.hip bin/sd.hip.gpu_amd

../../UppASD/UppASD-hpc-scripts/Dardel_AMD_GPU/Build_GPU_Cray.sh
mv bin/sd.hip bin/sd.hip.gpu_cray
