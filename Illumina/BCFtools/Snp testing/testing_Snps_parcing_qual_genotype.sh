#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina/BCFtools/vcf
zcat Bcf_Illumina_snps.vcf.gz >Bcf_Illumina_snps.vcf
java -jar /home/knam/work/WG_phasing/java_programs/bcf_vcfParser.jar  "/home/knam/work/WG_phasing/Illumina/BCFtools/vcf/Bcf_Illumina_snps.vcf" "/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/Illumina/BCFtools/Snp_testing/Bcf_Illumina_evaluation_QUAL.txt"

gzip -f /home/knam/work/WG_phasing/Illumina/BCFtools/Snp_testing/Bcf_Illumina_evaluation_QUAL.txt
rm Bcf_Illumina_snps.vcf


