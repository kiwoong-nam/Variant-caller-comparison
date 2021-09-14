#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0
cd  ~/work/WG_phasing/Illumina/BCFtools/vcf

/home/knam/save/programs/htslib-1.9/tabix Bcf_Illumina.vcf.gz

gatk SelectVariants -select-type SNP -R  ~/work/WG_phasing/Illumina/ref/release6.auto.fa -V  Bcf_Illumina.vcf.gz -O  Bcf_Illumina_snps.vcf.gz
