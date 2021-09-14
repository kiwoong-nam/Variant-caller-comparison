#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0
cd /home/knam/work/WG_phasing/Illumina/GATK/vcf

gatk SelectVariants -select-type SNP -R ~/work/WG_phasing/Illumina/ref/release6.auto.fa -V Gatk_Illumina.vcf.gz -O Gatk_Illumina_Snps.vcf.gz

