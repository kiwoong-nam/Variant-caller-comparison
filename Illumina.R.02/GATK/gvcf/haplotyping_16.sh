#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd ~/work/WG_phasing/Illumina.R.02/GATK/gvcf  
module load bioinfo/gatk-4.2.0.0

gatk HaplotypeCaller -R  ~/work/WG_phasing/Illumina.R.02/ref/R_0.02.simseq.genome.fa -I /home/knam/work/WG_phasing/Illumina.R.02/Bam_added_group/a16_g16.bam -O h16.gvcf.gz -ERC GVCF