#!/bin/bash
cd  ~/work/WG_phasing/Illumina.R.01/BCFtools/vcf
zcat Bcf_Illumina_snps.vcf.gz | awk '{if($1 ~ "#") print; else if($6>20)print}'> Bcf_Illumina_snps_Qual_S20.vcf
/home/knam/save/programs/htslib-1.9/bgzip -f Bcf_Illumina_snps_Qual_S20.vcf

