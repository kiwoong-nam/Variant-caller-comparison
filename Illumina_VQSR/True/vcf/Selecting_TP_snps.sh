#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf
zcat Gatk_Illumina_Snps.vcf.gz >Gatk_Illumina_Snps.vcf
java -jar /home/knam/work/WG_phasing/java_programs/VCF_TP.jar  "/home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps.vcf" "/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps_True.vcf"

/home/knam/save/programs/htslib-1.9/bgzip -c Gatk_Illumina_Snps_True.vcf > Gatk_Illumina_Snps_True.vcf.gz
/home/knam/save/programs/htslib-1.9/tabix  Gatk_Illumina_Snps_True.vcf.gz
rm Gatk_Illumina_Snps_True.vcf
rm Gatk_Illumina_Snps.vcf
