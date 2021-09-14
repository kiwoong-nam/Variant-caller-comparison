#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina.R.005/GATK/vcf
zcat Gatk_Illumina_Snps.vcf.gz >Gatk_Illumina_Snps.vcf
java -jar /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar  "/home/knam/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.005.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_Snp_testing.R.005.txt"

gzip -f /home/knam/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_Snp_testing.R.005.txt
rm Gatk_Illumina_Snps.vcf

