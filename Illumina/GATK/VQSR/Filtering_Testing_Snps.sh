#!/bin/bash
#SBATCH --mem=100G
cd   ~/work/WG_phasing/Illumina/GATK/VQSR
zcat Snps.recalibrated.vcf.gz|grep -P '#|PASS' >pass_filtered_VQSR_SNPs.vcf
java -jar /home/knam/work/WG_phasing/java_programs/VCF_Compare.jar "/home/knam/work/WG_phasing/Illumina/GATK/VQSR/pass_filtered_VQSR_SNPs.vcf" "/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/Illumina/GATK/VQSR/VQSR_Filtered_snp_testing.txt"

/home/knam/save/programs/htslib-1.9/bgzip -c pass_filtered_VQSR_SNPs.vcf > pass_filtered_VQSR_SNPs.vcf.vcf.gz
/home/knam/save/programs/htslib-1.9/tabix  pass_filtered_VQSR_SNPs.vcf.gz
rm pass_filtered_VQSR_SNPs.vcf
gzip -f /home/knam/work/WG_phasing/Illumina/GATK/VQSR/VQSR_Filtered_snp_testing.txt
