# Build instructions for UppASD on LUMI AMD GPU nodes
# Uses rocm-afar/24.3.0 compilers directly (amdflang/amdclang/hipcc)
# PrgEnv-amd is loaded for cray-libsci (BLAS/LAPACK) and cray-mpich

# Load the build environment
ml LUMI/25.09
ml partition/G
ml PrgEnv-amd/8.6.0
ml use /appl/local/containers/test-modules/
ml rocm-afar/24.3.0
ml craype-accel-amd-gfx90a

# Compilers from rocm-afar (not Cray wrappers)
ROCM_AFAR=$ROCM_PATH
FC_CMD=${ROCM_AFAR}/llvm/bin/amdflang
CC_CMD=${ROCM_AFAR}/llvm/bin/amdclang
CXX_CMD=${ROCM_AFAR}/bin/hipcc

# cray-libsci for BLAS/LAPACK
LIBSCI_DIR=${CRAY_LIBSCI_PREFIX_DIR}

# Strip the system rocm paths from LIBRARY_PATH so the linker doesn't
# embed them ahead of rocm-afar in RUNPATH.  The Cray PE injects these
# via PrgEnv-amd but we only need rocm-afar for this build.
export LIBRARY_PATH=$(echo "$LIBRARY_PATH" | tr ':' '\n' \
    | grep -v '/appl/lumi/SW.*rocm/' | paste -sd: -)

# Configure with CMake
# Explicit -rpath for rocm-afar so it appears first in RUNPATH,
# ahead of any system rocm paths discovered from linked libraries.
cmake -S . -B build_GPU_AMD \
  -DCMAKE_C_COMPILER=${CC_CMD} \
  -DCMAKE_CXX_COMPILER=${CXX_CMD} \
  -DCMAKE_Fortran_COMPILER=${FC_CMD} \
  -DUSE_HIP=ON -DON_LUMI=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_HIP_ARCHITECTURES=gfx90a \
  -DLIBSCI_DIR=${LIBSCI_DIR} \
  -DCMAKE_EXE_LINKER_FLAGS="-Wl,--disable-new-dtags -Wl,-rpath,${ROCM_AFAR}/lib -Wl,-rpath,${ROCM_AFAR}/llvm/lib"

# Build
cmake --build build_GPU_AMD -j 32
