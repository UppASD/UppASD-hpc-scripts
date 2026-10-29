# Build instructions for UppASD on Dardel Grace Hopper GPU nodes

# Load the environment
ml PrgEnv-cray
ml cudatoolkit/25.9_13.0
ml cmake/4.1.2
ml craype-accel-nvidia90

# Configure with CMake
# UPPASD_CUDA_ARCH=90 targets the H100 (Hopper, sm_90) GPUs of the Grace Hopper
# nodes, so the build does not depend on GPU detection (which fails on nodes
# without a GPU). Remove build_NVIDIA_Cray first if an earlier configure failed.
cmake -S . -B build_NVIDIA_Cray -DUSE_CUDA=1 -DCMAKE_CXX_STANDARD=20 -DCMAKE_BUILD_TYPE=Release -DUPPASD_CUDA_ARCH=90

# Build
cmake --build build_NVIDIA_Cray -j 36

# The executable is placed in build_NVIDIA_Cray/bin

# Run the tests
(cd build_NVIDIA_Cray && ctest -j 8)

# Alternatively, use one of the CMake preset build configurations
#cmake --preset releaseCuda -DUPPASD_CUDA_ARCH=90
#cmake --build build/releaseCuda -j 36
#(cd build/releaseCuda && ctest -j 8)

# The available preset configurations can be listed with
#cmake --list-presets
