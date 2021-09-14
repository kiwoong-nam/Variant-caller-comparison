#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0

cd  /home/knam/work/WG_phasing/Illumina.R.005/GATK/VQSR 
gatk VariantRecalibrator \
   -R ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa \
   -V ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz \
   --resource:True_positives,known=false,training=true,truth=true,prior=15.0 /home/knam/work/WG_phasing/Illumina.R.005/GATK_True/vcf/Gatk_Illumina_True_Snps.vcf.gz\
   --resource:Training_illumina_SNPs,known=false,training=true,truth=false /home/knam/work/WG_phasing/Illumina.R.005/GATK_Training/vcf/Gatk_Illumina_Snps.vcf.gz \
   -an QD -an MQ -an MQRankSum -an ReadPosRankSum -an FS \
   -mode SNP \
   -O cohort_snps.recal \
   --tranches-file cohort_snps.tranches 


