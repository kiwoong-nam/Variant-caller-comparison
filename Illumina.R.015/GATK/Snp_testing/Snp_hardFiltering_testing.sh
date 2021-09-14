#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina.R.015/GATK/Hard_Filtering
zcat Illumina_GATK_hardfiltering_SNPs.vcf.gz >Illumina_GATK_hardfiltering_SNPs.vcf
java -jar /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar  "/home/knam/work/WG_phasing/Illumina.R.015/GATK/Hard_Filtering/Illumina_GATK_hardfiltering_SNPs.vcf" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.015.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.015/GATK/Snp_testing/GATK_Snp_Hardfiltring_testing.R.015.txt"

gzip -f /home/knam/work/WG_phasing/Illumina.R.015/GATK/Snp_testing/GATK_Snp_Hardfiltring_testing.R.015.txt
rm Illumina_GATK_hardfiltering_SNPs.vcf

