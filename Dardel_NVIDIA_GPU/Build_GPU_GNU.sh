# Build instructions for UppASD on Dardel Grace Hopper GPU nodes

# Load the environment
ml PrgEnv-gnu
ml gcc-native/14
ml cudatoolkit/25.9_13.0
ml cmake/4.1.2
ml craype-accel-nvidia90

# Configure with CMake
cmake -S . -B build_NVIDIA_GNU -DUSE_CUDA=1 -DCMAKE_CXX_STANDARD=20 -DCMAKE_BUILD_TYPE=Release -DUPPASD_CUDA_ARCH=90

# Build
cmake --build build_NVIDIA_GNU -j 36

# Optionally install bin, lib, mod and include to <prefix>/bin, <prefix>/lib, ...
# Either add -DCMAKE_INSTALL_PREFIX=<prefix> to the configure line above and run
#cmake --install build_NVIDIA_GNU
# or give the prefix directly when installing
#cmake --install build_NVIDIA_GNU --prefix <prefix>

# Alternatively, use one of the CMake preset build configurations
#cmake --preset releaseCuda -DUPPASD_CUDA_ARCH=90
#cmake --build build/releaseCuda -j 36

# The available preset configurations can be listed with
#cmake --list-presets
