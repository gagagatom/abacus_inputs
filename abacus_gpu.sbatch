#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=5
#SBATCH --nodes=1
#SBATCH --gres=gpu:1

##submit abacus_gpu_job on WHU_HPC
##Usage:Submit the file in the same directory as the INPUT file

cd $SLURM_SUBMIT_DIR

module load singularity

singularity exec --nv \
  --env OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK \
  --bind /project/$(whoami),/scratch/$(whoami) \
  --env NVIDIA_VISIBLE_DEVICES=all \
  --env NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  /scratch/xueyingwen/software/abacus-cuda.sif \
  mpirun -np 1 abacus    # -np n = n gpus or 
# abacus
