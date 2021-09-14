#!/bin/bash
#SBATCH --mem=20G

cd /home/knam/work/WG_phasing/Illumina.R.01/GATK/Hard_Filtering
perl /home/knam/work/WG_phasing/java_programs/SNPfiltering.pl /home/knam/work/WG_phasing/Illumina.R.01/GATK/vcf/Gatk_Illumina_Snps.vcf.gz|grep -P '#|PASS'|/home/knam/save/programs/htslib-1.9/bgzip -c >  Illumina_GATK_hardfiltering_SNPs.vcf.gz

/home/knam/save/programs/htslib-1.9/tabix -p vcf Illumina_GATK_hardfiltering_SNPs.vcf.gz


