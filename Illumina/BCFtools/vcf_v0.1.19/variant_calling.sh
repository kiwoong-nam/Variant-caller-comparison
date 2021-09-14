#!/bin/bash
#SBATCH --mem=50G
module load bioinfo/samtools-0.1.19

cd ~/work/WG_phasing/Illumina/Bam

samtools mpileup -f ~/work/WG_phasing/Illumina/ref/release6.auto.fa -g a0.bam a1.bam a2.bam a3.bam a4.bam a5.bam a6.bam a7.bam a8.bam a9.bam a10.bam a11.bam a12.bam a13.bam a14.bam a15.bam a16.bam a17.bam a18.bam a19.bam | bcftools view - -v -c | gzip -f >  ~/work/WG_phasing/Illumina/BCFtools/vcf_v0.1.19/Bcf_Illumina_2.vcf.gz
