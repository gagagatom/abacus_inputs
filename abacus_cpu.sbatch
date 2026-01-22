#!/bin/bash
#SBATCH --partition=xh321
#SBATCH --account=xueyingwen
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1

#submit abacus_gpu_job on WHU_HPC
#Usage:Submit the file in the same directory as the INPUT file
cd $SLURM_SUBMIT_DIR
module load singularity


singularity exec --cleanenv \
  --env OMP_NUM_THREADS=1 \
  --bind /project/$(whoami),/scratch/$(whoami) \
  /scratch/liangjiatong/software/abacus-cuda.sif \
  mpirun -np $SLURM_NTASKS  abacus
