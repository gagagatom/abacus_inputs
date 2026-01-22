##submit abacus_gpu_job on WHU_HPC
##Usage:Submit the file in the same directory as the INPUT file
#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=5
#SBATCH --nodes=1
#SBATCH --gres=gpu:1

cd $SLURM_SUBMIT_DIR
module load singularity
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
singularity exec --nv \
  --bind /project/$(whoami),/scratch/$(whoami) \
  --env NVIDIA_VISIBLE_DEVICES=all \
  --env NVIDIA_DRIVER_CAPABILITIES=compute,utility \
  /scratch/xueyingwen/software/abacus-cuda.sif \
  abacus
