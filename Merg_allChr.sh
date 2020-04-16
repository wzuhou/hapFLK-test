#!/bin/bash
for i in `seq 1 33`;do cat group_cl_pr2_chr${i}_4k.hapflk_sc;done>Merged_group_cl_pr2_4k.hapflk_sc

for i in `seq 1 33`;do cat group_cl_pr2_chr${i}_4k.flk_sc;done>Merged_group_cl_pr2_4k.flk
