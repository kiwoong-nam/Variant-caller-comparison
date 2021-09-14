#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina.R.02/BCFtools/vcf
zcat Bcf_Illumina_snps.vcf.gz >Bcf_Illumina_snps.vcf

java -jar /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar  "/home/knam/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina_snps.vcf" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.02.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.02/BCFtools/Snp_testing/BCF_Snp_testing.R.02.txt"

gzip -f /home/knam/work/WG_phasing/Illumina.R.02/BCFtools/Snp_testing/BCF_Snp_testing.R.02.txt
rm Bcf_Illumina_snps.vcf

