#!/bin/bash
#SBATCH --mem=100G
java -jar /home/knam/work/WG_phasing/java_programs/VCF_Compare_scorefile_rightposition.jar "/home/knam/work/WG_phasing/Illumina_VQSR/True/Snp_testing/Gatk_Illumina_Snps.scores.txt" "/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/Illumina_VQSR/True/Snp_testing/Gatk_Illumina_annotation_evaluation.txt"
gzip -f /home/knam/work/WG_phasing/Illumina_VQSR/True/Snp_testing/Gatk_Illumina_annotation_evaluation.txt

