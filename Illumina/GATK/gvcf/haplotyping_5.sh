#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd    ~/work/WG_phasing/Illumina/GATK/gvcf  
module load bioinfo/gatk-4.2.0.0

gatk HaplotypeCaller -R ~/work/WG_phasing/Illumina/ref/release6.auto.fa -I /home/knam/work/WG_phasing/Illumina/Bam_added_group/a5_g5.bam -O h5.gvcf.gz -ERC GVCF