#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0
cd  ~/work/WG_phasing/Illumina.R.005/BCFtools/vcf

/home/knam/save/programs/htslib-1.9/tabix Bcf_Illumina.vcf.gz

gatk SelectVariants -select-type SNP -R  ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa  -V  Bcf_Illumina.vcf.gz -O  Bcf_Illumina_snps.vcf.gz
