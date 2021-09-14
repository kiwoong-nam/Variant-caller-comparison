#!/bin/bash
#SBATCH --mem=20G

module load bioinfo/gatk-4.2.0.0
cd  /home/knam/work/WG_phasing/Illumina/GATK/VQSR 
gatk --java-options "-Xmx5g -Xms5g" \
    ApplyVQSR \
    -V ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf.gz\
    --recal-file cohort_snps.recal \
    --tranches-file cohort_snps.tranches\
    --truth-sensitivity-filter-level 99.7 \
    --create-output-variant-index true\
    -mode SNP \
    -O /home/knam/work/WG_phasing/Illumina/GATK/VQSR/Snps.recalibrated.vcf.gz

