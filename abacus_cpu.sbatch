#
#!/bin/bash
#SBATCH --partition=xh321
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1

cd $SLURM_SUBMIT_DIR
module load singularity

IMG=/scratch/xueyingwen/software/abacus-cuda.sif
export OMP_NUM_THREADS=1
singularity exec --cleanenv \
  --bind /project/$(whoami),/scratch/$(whoami) \
  $IMG \
  mpirun -np $SLURM_NTASKS abacus
