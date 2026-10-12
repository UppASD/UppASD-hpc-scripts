#!/bin/bash
#SBATCH -A <project>          # Set the allocation to be charged for this job
#SBATCH -J uppasd             # The name of the script is myjob
#SBATCH -t 04:00:00           # 4 hours wall-clock time
#SBATCH -p gpugh              # The partition
#SBATCH -N 1                  # Number of nodes
#SBATCH -n 1                  # Number of tasks
#SBATCH -c 16                 # Number of cpus per task

ml PrgEnv-gnu
ml gcc-native/14
ml cudatoolkit/25.9_13.0
ml craype-accel-nvidia90

export SD_BINARY= #Set here path to UppASD executable
export OMP_NUM_THREADS=16

echo "Script initiated at `date` on `hostname`"

$SD_BINARY > out.log

echo "Script finished at `date` on `hostname`"
