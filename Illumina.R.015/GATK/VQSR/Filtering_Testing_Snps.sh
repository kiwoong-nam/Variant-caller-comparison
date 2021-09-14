#!/bin/bash
#SBATCH --mem=100G
cd   ~/work/WG_phasing/Illumina.R.015/GATK/VQSR
zcat Snps.recalibrated.vcf.gz|grep -P '#|PASS' >pass_filtered_VQSR_SNPs.vcf
java -jar /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar  "/home/knam/work/WG_phasing/Illumina.R.015/GATK/VQSR/pass_filtered_VQSR_SNPs.vcf" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.015.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.015/GATK/Snp_testing/GATK_VQSR_Snp_testing.R.015.txt"

/home/knam/save/programs/htslib-1.9/bgzip -c pass_filtered_VQSR_SNPs.vcf > pass_filtered_VQSR_SNPs.vcf.gz
/home/knam/save/programs/htslib-1.9/tabix  pass_filtered_VQSR_SNPs.vcf.gz
rm pass_filtered_VQSR_SNPs.vcf
gzip -f /home/knam/work/WG_phasing/Illumina.R.015/GATK/Snp_testing/GATK_VQSR_Snp_testing.R.015.txt
