#!/bin/bash

LOGDIR="build_logs"
mkdir -p "$LOGDIR"

echo "Build logs will be written to $LOGDIR/"

# All build configs share source/mod/ for .mod files and lib/ for .a files.
# Stale files from a different compiler cause fatal errors, so we must clean
# them before each build.
clean_between_builds() {
    rm -rf source/mod/*.mod lib/*.a
}

clean_between_builds
../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_GNU.sh 2>&1 | tee "$LOGDIR/build_gpu_gnu.log"
mv bin/sd.hip bin/sd.hip.gpu_gnu

clean_between_builds
../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_GNU_rocm724.sh 2>&1 | tee "$LOGDIR/build_gpu_gnu_rocm724.log"
mv bin/sd.hip bin/sd.hip.gpu_gnu_rocm724

clean_between_builds
../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_AMD.sh 2>&1 | tee "$LOGDIR/build_gpu_amd.log"
mv bin/sd.hip bin/sd.hip.gpu_amd

clean_between_builds
../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_Cray.sh 2>&1 | tee "$LOGDIR/build_gpu_cray.log"
mv bin/sd.hip bin/sd.hip.gpu_Cray

clean_between_builds
../UppASD-hpc-scripts/LUMI_AMD_GPU/Build_GPU_Cray_rocm724.sh 2>&1 | tee "$LOGDIR/build_gpu_cray_rocm724.log"
mv bin/sd.hip bin/sd.hip.gpu_Cray_rocm724

echo ""
echo "All builds finished. Logs:"
ls -lh "$LOGDIR/"
