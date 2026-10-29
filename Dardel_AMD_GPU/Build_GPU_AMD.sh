# Build instructions for UppASD on Dardel AMD GPU nodes

# Load the build environment
ml PrgEnv-amd
ml rocm/7.2.1
ml cmake/4.3.3
ml craype-accel-amd-gfx90a

# Configure with CMake
cmake -S . -B build_GPU_AMD \
  -DCMAKE_C_COMPILER=cc \
  -DCMAKE_CXX_COMPILER=CC \
  -DCMAKE_Fortran_COMPILER=ftn \
  -DUSE_HIP=ON -DON_LUMI=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_HIP_ARCHITECTURES=gfx90a

# Build
cmake --build build_GPU_AMD -j 32

# The executable is placed in build_GPU_AMD/bin
