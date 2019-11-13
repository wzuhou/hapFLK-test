##A lot of filtering required for fastphase input 
1.Convert the original vcf to bed format, for the common bed we used was normalized for the snp and indel and the multi-allele were changed into more lines; additionally, give phenotype to the bed file 
2.Pruning for snp

2.1 filtered for r2`indep-pairwise 10 10 0.8`
2.2 extract the pruning list
```
plink\
  --allow-extra-chr\
  --allow-no-sex\
  --bfile nondupSNP_group_cl\
  --cow\
  --extract nondupSNP_group_cl.pr.prune.in\
  --make-bed\
  --out nondupSNP_group_cl.pr
```

3. remove the duplicated  position snp
```
plink \
--bfile nondupSNP_group_cl.pr \
--cow --alloe-extra-chr  \
--geno 0.2 \ 
--make-bed \
--out nondupSNP_group_cl.pr.filtered
```
```
plink \
--bfile nondupSNP_group_cl.pr.filtered \
--cow \
--allow-extra-chr \
--list-duplicate-vars ids-only  suppress-first \
--out nondupSNP_group_cl.pr.filtered.dup
```
```bash
#plink --bfile nondupSNP_group_cl.pr.filtered --cow --allow-extra-chr --exclude nondupSNP_group_cl.pr.filtered.dup.dupvar --make-bed --biallelic-only --snps-only --out nondupSNP_group_cl.pr.filtered.duprm
plink --bfile group_cl_pr2_chr1 --cow --allow-extra-chr --exclude group_cl_pr2_chr1.dup.dupvar.ID --geno 0.2 --biallelic-only --recode 01 --snps-only  --output-missing-genotype ?  --out group_cl_pr2_chr1.duprm
```
4.Convert to fastphase
```
plink --file group_cl_pr2_chr1.duprm --allow-extra-chr --allow-no-sex --biallelic-only --chr 1 --cow --recode 01 fastphase-1chr --snps-only --out group_cl_pr2_chr1.duprm_fq
```
```
 plink --bfile group_cl_pr2_chr1.duprm --allow-extra-chr --allow-no-sex --biallelic-only --chr 1 --cow --recode 01 fastphase-1chr --snps-only --out group_cl_pr2_chr1.duprm_fq
  ```

` sed -i '3d' group_cl_pr2_chr1.duprm_fq.recode.phase.inp`
#fastphase
/home/WUR/wu090/Install/fastPHASE -T10 -C10 -H-4 -KL6 -KU12 -Ki2 -Ks50 -Km1000 -oMyresult test_chr1.recode.phase.inp

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUwODUyMzIwNl19
-->