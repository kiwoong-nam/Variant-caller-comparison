#!/bin/bash
#SBATCH --mem=100G

module load bioinfo/gatk-4.2.0.0
cd /home/knam/work/WG_phasing/Illumina.R.005/GATK/vcf 
gatk GenotypeGVCFs -R ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa --variant /home/knam/work/WG_phasing/Illumina.R.005/GATK/gvcf/merged_gvcf_Illumina.gvcf.gz -O Gatk_Illumina.vcf.gz -all-sites

