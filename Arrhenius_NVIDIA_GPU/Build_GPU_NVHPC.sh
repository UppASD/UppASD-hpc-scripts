# Build instructions for UppASD on Arrhenius NVIDIA GPU nodes

# Load the build environment
ml GPU/buildtool-easybuild/5.2.1-hpca3ef7d197
ml nvmpichcnvpl/14.3.0
ml CMake/4.4.0

# Configure with CMake
cmake -S . -B build_NVIDIA_NVHPC -DUSE_CUDA=1 -DCMAKE_BUILD_TYPE=Release

# Build
cmake --build build_NVIDIA_NVHPC -j 36

# Alternatively, use one of the CMake preset build configurations
#cmake --preset releaseCuda
#cmake --build build/releaseCuda -j 36

# The available preset configurations can be listed with
#cmake --list-presets
