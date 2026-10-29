# UppASD-hpc-scripts

This repository contains build scripts and job scripts for using the [UppASD](https://github.com/UppASD/UppASD) code on HPC systems.

Note that build and runtime environments on HPC system are a moving target and commonly change once or a few times per year.

*October 2026 contents: This repository contains scripts for UppASD on the three HPE Cray EX supercomputers [Arrhenius](https://user.naiss.se/arrhenius_hpc/quickstart/) [Dardel](https://support.pdc.kth.se/doc/), and [LUMI](https://lumi-supercomputer.eu/user-support/).*

*October 2026 status: the recommendation is to use primarily the build scripts with GNU host compiler.*

## Instructions

- Clone the current git repo and the [UppASD](https://github.com/UppASD/UppASD). Let them reside within a common top directory `UppASD`, as in
```bash
UppASD/UppASD
UppASD/UppASD-hpc-scripts
```
- To build for GPU nodes, request a single GPU or a full GPU node for interactive use.
- On the interactive node, change directory into `UppASD/UppASD`
- Checkout the desired branch of the code. As of October 2026, use `gpu_hip_cu`
- Launch a single build with, for instance, `../../UppASD/UppASD-hpc-scripts/Arrhenius_NVIDIA_GPU/Build_GPU_GNU.sh`
- Launch of multiple builds can be done with, for instance, `../../UppASD/UppASD-hpc-scripts/LUMI_AMD_GPU/build_all_LUMI.sh`
- Inspect the results of the regression test that the build scripts launch with `ctest -j 8`
- Optionally install to desired destination directory with `cmake --install build_<build_variant> --prefix=<installation_directory>`

```
