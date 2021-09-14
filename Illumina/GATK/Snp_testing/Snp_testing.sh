#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina/GATK/vcf
zcat Gatk_Illumina_Snps.vcf.gz >Gatk_Illumina_Snps.vcf 
java -jar /home/knam/work/WG_phasing/java_programs/VCF_Compare.jar "/home/knam/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf" "/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_Snps_evaluation.txt"
gzip -f /home/knam/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_Snps_evaluation.txt
rm Gatk_Illumina_Snps.vcf

