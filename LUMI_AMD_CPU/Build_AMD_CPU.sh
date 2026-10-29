# Build instructions for UppASD on LUMI AMD CPU nodes

# Load the build environment
ml LUMI/25.09
ml PrgEnv-gnu/8.6.0

# Configure with CMake
cmake -S . -B build_AMD_CPU

# Build
cmake --build build_AMD_CPU -j 32

# The executable is placed in build_AMD_CPU/bin

# Run the tests
(cd build_AMD_CPU && ctest -j 8)

# Alternatively, use one of the CMake preset build configurations
#cmake --preset release
#cmake --build build/release -j 32
#(cd build/release && ctest -j 8)

# The available preset configurations can be listed with
#cmake --list-presets
