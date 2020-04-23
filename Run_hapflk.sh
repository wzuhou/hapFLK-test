#!/bin/bash
#SBATCH --time=5-3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --error=error_%j
#SBATCH --job-name=hapflk
#SBATCH --qos=std
#SBATCH --mem=32000
#SBATCH --output=output_%j
module load R/3.4.3
source ~/Install/anaconda3/bin/activate ~/Install/anaconda3/envs/my_pymc_env/ #call the working conda env

# 0.Generate group_cl_pr_reynolds.txt_hapmap_kinship_noroot.txt matrix
hapflk --bfile group_cl_pr --reynolds --nfit=2 --ncpu=2 -p group_cl_pr ##this will create a file >>group_cl_pr_reynolds.txt
R CMD BATCH reynolds2kinship.R

# 1.Run flk analysis on chr basis
chr=$1
hapflk --bfile ${chr}/group_cl_pr2_chr${chr} -K15 --nfit=2 --ncpu=12 --kinship group_cl_pr_reynolds.txt_hapmap_kinship_noroot.txt  --kfrq -p group_cl_pr2_chr${chr}_15k
