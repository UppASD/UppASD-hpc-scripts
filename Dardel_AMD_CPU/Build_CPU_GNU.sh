# Build instructions for UppASD on Dardel AMD CPU nodes

# Load the build environment
ml PrgEnv-gnu
ml cmake/4.3.3

# Configure with CMake
cmake -S . -B build_GNU_CPU

# Build
cmake --build build_GNU_CPU -j 32

# Alternatively, use one of the CMake preset build configurations
#cmake --preset release
#cmake --build build/release -j 32

# The available preset configurations can be listed with
#cmake --list-presets

