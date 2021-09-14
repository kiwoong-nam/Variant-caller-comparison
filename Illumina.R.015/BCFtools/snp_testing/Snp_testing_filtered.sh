#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina.R.015/BCFtools/vcf
zcat Bcf_Illumina_snps_Qual_S20.vcf.gz >Bcf_Illumina_snps_Qual_S20.vcf
java -jar /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar  "/home/knam/work/WG_phasing/Illumina.R.015/BCFtools/vcf/Bcf_Illumina_snps_Qual_S20.vcf" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.015.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.015/BCFtools/Snp_testing/BCF_Snp_testing.R.015.filtered.txt"

gzip -f /home/knam/work/WG_phasing/Illumina.R.015/BCFtools/Snp_testing/BCF_Snp_testing.R.015.filtered.txt
rm Bcf_Illumina_snps_Qual_S20.vcf

