#!/bin/bash
#SBATCH --mem=100G
cd /home/knam/work/WG_phasing/Illumina.R.015/GATK/vcf
java -jar /home/knam/work/WG_phasing/java_programs/Vcf_Annotation_Evaluation_DistantRef.jar  "/home/knam/work/WG_phasing/Illumina.R.015/GATK/vcf/Gatk_Illumina_Snps.scores.txt" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.015.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.015/GATK/Snp_testing/GATK_Snp_Annotation_testing.R.015.txt"

gzip -f /home/knam/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_Snp_Annotation_testing.R.015.txt

