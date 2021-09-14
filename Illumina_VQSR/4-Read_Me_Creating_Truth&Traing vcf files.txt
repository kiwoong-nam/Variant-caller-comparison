I-Creating Truth : 
Part 01 preparing Bam files 
Step 01 : Mapping, Sorting and converting from sam to bam 
	input :  /home/knam/save/WG_phasing/data_prep/Illumina_true/i*_read*.fq.gz + ~/work/WG_phasing/Illumina/ref/bt2_index_base.*
	scripting :  ~/work/WG_phasing/Illumina_VQSR/True/Bam/scripting.plq
	script :   ~/work/WG_phasing/Illumina_VQSR/True/Bam/alignment_*.sh
	output :  ~/work/WG_phasing/Illumina_VQSR/True/Bam/a*.bam
Step 02: Pereparing the Bam before variant calling
a-adding Group 
	input :  ~/work/WG_phasing/Illumina_VQSR/True/Bam/a*.bam
	scripting : ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/scripting.pl
	script :  ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/adding_group_$i.sh
	output : ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/a*_g*.bam
b-Indexing :
	input :  ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/a*_g*.bam
	script : ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/bam_indexing.sh
	output : ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/a*_g*.bam.bai
Part 2 : GATK variant calling pipeline using bioinfo/gatk-4.2.0.0
Step 01: Haplotype calling
	input :  ~/work/WG_phasing/Illumina/ref/release6.auto.fa + ~/work/WG_phasing/Illumina_VQSR/True/Bam_added_group/a*_g*.bam
	scripting: /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/scripting.pl
	script :  /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/haplotyping_*.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/h*.gvcf.gz
Step 02: Merging gvcf files 
	input :  /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/h*.gvcf.gz +  ~/work/WG_phasing/Illumina/ref/release6.auto.fa 
	script :  /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/merging_gvcf.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/merged_gvcf_Illumina.gvcf.gz
Step 03: variant calling 
	input : /home/knam/work/WG_phasing/Illumina_VQSR/True/gvcf/merged_gvcf_Illumina.gvcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa 
	script :  /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/variant_calling.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina.vcf.gz
Step 04 : Selecting only Snps :
	input : /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina.vcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa
	script : /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Selecting_snps.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps.vcf.gz
Step 05 : Selecting Only TP 
	input : 
		Vcf file :/home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps.vcf.gz 
		True variants file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
		Java script : /home/knam/work/WG_phasing/java_programs/VCF_TP.jar
	script : /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Selecting_TP_snps.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps_True.vcf.gz
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
II-Creating Training : 
Part 01 preparing Bam files 
Step 01 : Mapping, Sorting and converting from sam to bam 
	input :  /home/knam/save/WG_phasing/data_prep/Illumina_training/i*_read*.fq.gz + ~/work/WG_phasing/Illumina/ref/bt2_index_base.*
	scripting :  ~/work/WG_phasing/Illumina_VQSR/Training/Bam/scripting.plq
	script :   ~/work/WG_phasing/Illumina_VQSR/Training/Bam/alignment_*.sh
	output :  ~/work/WG_phasing/Illumina_VQSR/Training/Bam/a*.bam
Step 02: Pereparing the Bam before variant calling
a-adding Group 
	input :  ~/work/WG_phasing/Illumina_VQSR/Training/Bam/a*.bam
	scripting : ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/scripting.pl
	script :  ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/adding_group_$i.sh
	output : ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/a*_g*.bam
b-Indexing :
	input :  ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/a*_g*.bam
	script : ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/bam_indexing.sh
	output : ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/a*_g*.bam.bai
Part 2 : GATK variant calling pipeline using bioinfo/gatk-4.2.0.0
Step 01: Haplotype calling
	input :  ~/work/WG_phasing/Illumina/ref/release6.auto.fa + ~/work/WG_phasing/Illumina_VQSR/Training/Bam_added_group/a*_g*.bam
	scripting: /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/scripting.pl
	script :  /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/haplotyping_*.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/h*.gvcf.gz
Step 02: Merging gvcf files 
	input :  /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/h*.gvcf.gz +  ~/work/WG_phasing/Illumina/ref/release6.auto.fa 
	script :  /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/merging_gvcf.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/merged_gvcf_Illumina.gvcf.gz
Step 03: variant calling 
	input : /home/knam/work/WG_phasing/Illumina_VQSR/Training/gvcf/merged_gvcf_Illumina.gvcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa 
	script :  /home/knam/work/WG_phasing/Illumina_VQSR/Training/vcf/variant_calling.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/Training/vcf/Gatk_Illumina.vcf.gz
Step 04 : Selecting only Snps :
	input : /home/knam/work/WG_phasing/Illumina_VQSR/Training/vcf/Gatk_Illumina.vcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa
	script : /home/knam/work/WG_phasing/Illumina_VQSR/Training/vcf/Selecting_snps.sh
	output : /home/knam/work/WG_phasing/Illumina_VQSR/Training/vcf/Gatk_Illumina_Snps.vcf.gz
