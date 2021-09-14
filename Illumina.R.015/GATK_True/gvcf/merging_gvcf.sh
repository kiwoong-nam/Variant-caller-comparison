#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0

cd /home/knam/work/WG_phasing/Illumina.R.015/GATK_True/gvcf 

gatk CombineGVCFs -R ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa --variant h0.gvcf.gz --variant h1.gvcf.gz --variant h2.gvcf.gz --variant h3.gvcf.gz --variant h4.gvcf.gz --variant h5.gvcf.gz --variant h6.gvcf.gz --variant h7.gvcf.gz --variant h8.gvcf.gz --variant h9.gvcf.gz --variant h10.gvcf.gz --variant h11.gvcf.gz --variant h12.gvcf.gz --variant h13.gvcf.gz --variant h14.gvcf.gz --variant h15.gvcf.gz --variant h16.gvcf.gz --variant h17.gvcf.gz --variant h18.gvcf.gz --variant h19.gvcf.gz  -O merged_gvcf_Illumina.gvcf.gz





