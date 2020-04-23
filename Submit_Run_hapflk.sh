#!/bin/bash
module load slurm
for i in `seq 21 33`;
#do sbatch  Run_hapflk.sh ${i};done
do sbatch --depend=afterok:23256461  Run_hapflk.sh ${i};done
