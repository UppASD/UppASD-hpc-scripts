# Build instructions for UppASD on LUMI AMD GPU nodes

# Load the build environment
ml use /appl/local/containers/test-modules/
ml LUMI/25.09
ml partition/G
ml PrgEnv-amd/8.6.0
ml rocm/7.2.4
ml craype-accel-amd-gfx90a

# Configure with CMake
cmake -S . -B build_GPU_AMD_rocm724 \
  -DCMAKE_C_COMPILER=cc \
  -DCMAKE_CXX_COMPILER=CC \
  -DCMAKE_Fortran_COMPILER=ftn \
  -DUSE_HIP=ON -DON_LUMI=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_HIP_ARCHITECTURES=gfx90a

# Build
cmake --build build_GPU_AMD_rocm724 -j 32
