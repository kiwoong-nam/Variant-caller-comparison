#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd ~/work/WG_phasing/Illumina.R.01/GATK/gvcf  
module load bioinfo/gatk-4.2.0.0

gatk HaplotypeCaller -R ~/work/WG_phasing/Illumina.R.01/ref/R_0.01.simseq.genome.fa -I /home/knam/work/WG_phasing/Illumina.R.01/Bam_added_group/a4_g4.bam -O h4.gvcf.gz -ERC GVCF