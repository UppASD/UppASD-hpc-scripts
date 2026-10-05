# Build instructions for UppASD on LUMI AMD GPU nodes

# Load the build environment
ml use /appl/local/containers/test-modules/
ml LUMI/25.09
ml buildtools/25.09
ml partition/G
ml PrgEnv-amd/8.6.0
ml rocm-afar/24.3.0
ml craype-accel-amd-gfx90a

# Configure with CMake
cmake -S . -B build_GPU_AMD_rocm724 \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_Fortran_COMPILER=flang \
  -DUSE_HIP=ON -DON_LUMI=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_HIP_ARCHITECTURES=gfx90a

# Build
cmake --build build_GPU_AMD_rocm724 -j 32
