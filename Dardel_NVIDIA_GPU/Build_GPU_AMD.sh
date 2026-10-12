# Build instructions for UppASD on Dardel Grace Hopper GPU nodes

# Load the environment
ml PrgEnv-amd
ml cudatoolkit/25.9_13.0
ml cmake/4.1.2
ml craype-accel-nvidia90

# Configure with CMake
cmake -S . -B build_NVIDIA_AMD -DUSE_CUDA=1 -DCMAKE_CXX_STANDARD=20 -DCMAKE_BUILD_TYPE=Release

# Build
cmake --build build_NVIDIA_AMD -j 36

# Alternatively, use one of the CMake preset build configurations
#cmake --preset releaseCuda
#cmake --build build/releaseCuda -j 36

# The available preset configurations can be listed with
#cmake --list-presets
