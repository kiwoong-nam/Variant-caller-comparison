#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd ~/work/WG_phasing/Illumina.R.015/GATK_True/gvcf  
module load bioinfo/gatk-4.2.0.0

gatk HaplotypeCaller -R ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa -I /home/knam/work/WG_phasing/Illumina.R.015/GATK_True/Bam_added_group/a10_g10.bam -O h10.gvcf.gz -ERC GVCF