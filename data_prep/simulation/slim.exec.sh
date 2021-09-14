#!/bin/bash
#SBATCH --mem=150G

cd /home/knam/work/WG_phasing/data_prep/simulation/slim

/home/knam/save/programs/SLiM2/SLiM/build/slim input/input_test  > test.vcf
gzip -f test.vcf

/home/knam/save/programs/SLiM2/SLiM/build/slim input/input  > sim.vcf
gzip -f sim.vcf



