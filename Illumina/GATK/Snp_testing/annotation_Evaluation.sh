#!/bin/bash
#SBATCH --mem=100G
java -jar /home/knam/work/WG_phasing/java_programs/Vcf_Annotation_Evaluation.jar "/home/knam/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_Snps.scores.txt" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_annotation_evaluation.txt"
gzip -f /home/knam/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_annotation_evaluation.txt

