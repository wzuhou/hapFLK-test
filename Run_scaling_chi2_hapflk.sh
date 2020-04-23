#!/bin/bash
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --error=error_%j
#SBATCH --job-name=hapflk
#SBATCH --qos=std
#SBATCH --mem=3000
#SBATCH --output=output_%j

source ~/Install/anaconda3/bin/activate ~/Install/anaconda3/envs/my_pymc_env/

#chr=$1
for chr in `seq 6 33`;do
python scaling_chi2_hapflk.py group_cl_pr2_chr${chr}_15k.hapflk 15 15;
done
