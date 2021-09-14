#!/bin/bash
#SBATCH --mem=100G
cd ~/work/WG_phasing/Illumina.R.015/GATK_True/vcf
zcat Gatk_Illumina_Snps.vcf.gz>Gatk_Illumina_Snps.vcf
java -jar /home/knam/work/WG_phasing/java_programs/vcf_Selecting_PopulationTP_RefTp.jar "/home/knam/work/WG_phasing/Illumina.R.015/GATK_True/vcf/Gatk_Illumina_Snps.vcf" "/home/knam/save/WG_phasing/data_prep/simulation/fasta/right.position.txt" "/home/knam/work/WG_phasing/distant_ref/R_0.015.refseq2simseq.SNP.vcf" "/home/knam/work/WG_phasing/Illumina.R.015/GATK_True/vcf/Gatk_Illumina_True_Snps.vcf" 
/home/knam/save/programs/htslib-1.9/bgzip -c Gatk_Illumina_True_Snps.vcf>Gatk_Illumina_True_Snps.vcf.gz
/home/knam/save/programs/htslib-1.9/tabix Gatk_Illumina_True_Snps.vcf.gz
rm Gatk_Illumina_Snps.vcf
rm Gatk_Illumina_True_Snps.vcf
