```bash
#!bin/bash
conda  activate ~/Install/anaconda/
cd /home/WUR/wu090/Install/hapFLK/hapflk-tutorial/


#Basic analysis
hapflk --file hapmap3-lct --kinship kinship.txt -K15 --nfit=1 --ncpu=2 --kfrq -p hapmap_tutorial

#1. Computing local Reynolds distances
#It will create two new files: hapflk_snp_reynolds.txt and hapflk_hap_reynolds.txt that contain the local Reynolds distance matrices for SNP and haplotype clusters respectively.
python local_reynolds.py -p hapmap_tutorial

#2.Producing local population trees:This is done using the R script called local_trees.R. To use it you must edit it with a text editor and fill in the USER INPUT section, reproduced below:
module load R/3.4.3
R CMD BATCH local_trees.R

#R script for cluster representation
./hapflk-clusterplot.R hapmap_tutorial.kfrq.fit_0.bz2

#Calculate hapflk p-values:where K is the number of clusters used and N the number of populations.
#The script creates a new file (suffix .hapflk_sc) which is the original file plus 2 new colums: the rescaled statistic and the corresponding p-values.
python scaling_chi2_hapflk.py hapmap_tutorial.hapflk 15 4


#These three files are needed to run hapflk:
#
#hapmap3-lct.ped : the ped file (plink format) with a particularity. First column of the file (FID) contains the population identifier of individuals (rather than a family ID).
#hapmap3-lct.map : the map file
#kinship.txt: the kinship matrix estimated from the Reynolds distances
#For information we provide the following files:
#
#Reynolds.txt : the Reynolds distances estimated from a sample of ~ 70K SNPs on the whole genome
#reynolds2kinship.R : the R script to estimate kinship matrix from the reynolds distances. Yoruba population (YRI) is used as the outgroup.
#hapmap_tree.txt : the population tree estimated genome wide, in Newick format.
```


> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjE5OTg3NDExXX0=
-->