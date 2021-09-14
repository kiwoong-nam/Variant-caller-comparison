#!/bin/bash
#SBATCH --mem=50G
module load bioinfo/bcftools-1.9

cd ~/work/WG_phasing/Illumina.R.01/Bam_added_group

bcftools mpileup -f ~/work/WG_phasing/Illumina.R.01/ref/R_0.01.simseq.genome.fa a0_g0.bam a1_g1.bam a2_g2.bam a3_g3.bam a4_g4.bam a5_g5.bam a6_g6.bam a7_g7.bam a8_g8.bam a9_g9.bam a10_g10.bam a11_g11.bam a12_g12.bam a13_g13.bam a14_g14.bam a15_g15.bam a16_g16.bam a17_g17.bam a18_g18.bam a19_g19.bam | bcftools call -mv -Oz -o   ~/work/WG_phasing/Illumina.R.01/BCFtools/vcf/Bcf_Illumina.vcf.gz


