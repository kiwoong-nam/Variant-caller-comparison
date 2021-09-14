#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0
cd /home/knam/work/WG_phasing/Illumina.R.02/GATK_Training/vcf

gatk SelectVariants -select-type SNP -R  ~/work/WG_phasing/Illumina.R.02/ref/R_0.02.simseq.genome.fa -V Gatk_Illumina.vcf.gz -O Gatk_Illumina_Snps.vcf.gz

