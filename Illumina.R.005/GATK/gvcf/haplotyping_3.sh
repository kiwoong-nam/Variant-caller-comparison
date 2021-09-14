#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd ~/work/WG_phasing/Illumina.R.005/GATK/gvcf  
module load bioinfo/gatk-4.2.0.0

gatk HaplotypeCaller -R ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa -I /home/knam/work/WG_phasing/Illumina.R.005/Bam_added_group/a3_g3.bam -O h3.gvcf.gz -ERC GVCF