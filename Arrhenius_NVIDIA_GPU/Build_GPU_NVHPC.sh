# Build instructions for UppASD on Arrhenius NVIDIA GPU nodes

# Load the build environment
ml GPU/buildtool-easybuild/5.2.1-hpca3ef7d197
ml nvmpichcnvpl/25.9
ml CMake/4.4.0

# Configure with CMake
# UPPASD_CUDA_ARCH=90 targets the H100 (Hopper, sm_90) GPUs of the GH200
# superchips, so the build does not depend on GPU detection (which fails on nodes
# without a GPU). Remove build_NVIDIA_NVHPC first if an earlier configure failed.
cmake -S . -B build_NVIDIA_NVHPC -DUSE_CUDA=1 -DCMAKE_BUILD_TYPE=Release -DUPPASD_CUDA_ARCH=90

# Build
cmake --build build_NVIDIA_NVHPC -j 36

# The executable is placed in build_NVIDIA_NVHPC/bin

# Run the tests
(cd build_NVIDIA_NVHPC && ctest -j 8)

# Alternatively, use one of the CMake preset build configurations
#cmake --preset releaseCuda -DUPPASD_CUDA_ARCH=90
#cmake --build build/releaseCuda -j 36
#(cd build/releaseCuda && ctest -j 8)

# The available preset configurations can be listed with
#cmake --list-presets
