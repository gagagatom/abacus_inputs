##submit abacus_gpu_job on WHU_HPC
##Usage:Submit the file in the same directory as the INPUT file
#!/bin/bash
#SBATCH --partition=xh321
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1

cd $SLURM_SUBMIT_DIR
module load singularity

export OMP_NUM_THREADS=1
singularity exec --cleanenv \
  --bind /project/$(whoami),/scratch/$(whoami) \
  /scratch/xueyingwen/software/abacus-cuda.sif \
  mpirun -np $SLURM_NTASKS abacus
