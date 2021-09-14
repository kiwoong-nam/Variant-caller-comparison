Part 01 : GATK variant calling pipeline using bioinfo/gatk-4.2.0.0
Step 01: Haplotype calling
	input :  ~/work/WG_phasing/Illumina/ref/release6.auto.fa + /home/knam/work/WG_phasing/Illumina/Bam_added_group/a*_g*.bam
	scripting: ~/work/WG_phasing/Illumina/GATK/gvcf/scripting.pl
	script :  ~/work/WG_phasing/Illumina/GATK/gvcf/haplotyping_1.sh
	output : ~/work/WG_phasing/Illumina/GATK/gvcf/h*.gvcf.gz
Step 02: Merging gvcf files 
	input :  ~/work/WG_phasing/Illumina/GATK/gvcf/h*.gvcf.gz +  ~/work/WG_phasing/Illumina/ref/release6.auto.fa 
	script :  ~/work/WG_phasing/Illumina/GATK/gvcf/merging_gvcf.sh
	output : ~/work/WG_phasing/Illumina/GATK/gvcf/merged_gvcf_Illumina.gvcf.gz
Step 03: variant calling 
	input :   ~/work/WG_phasing/Illumina/GATK/gvcf/merged_gvcf_Illumina.gvcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa 
	script :  ~/work/WG_phasing/Illumina/GATK/vcf/variant_calling.sh
	output :  ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina.vcf.gz
Step 04 : Selecting only Snps :
	input :   ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina.vcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa
	script :  ~/work/WG_phasing/Illumina/GATK/vcf/Selecting_snps.sh
	output : ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
Step 05 : Testing variants 
	input :  variant calling file : ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
		 True variants file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
		 Java script : /home/knam/work/WG_phasing/java_programs/VCF_Compare.jar
	script :  ~/work/WG_phasing/Illumina/GATK/Snp_testing/Snp_testing.sh
	output :  ~/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_Snps_evaluation.txt.gz
Step 5.1:a-parcing annotation scores form vcf file to generate score file (snps position + snps annotations)
	 input : ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
	 script :  ~/work/WG_phasing/Illumina/GATK/Snp_testing/Extractscore.sh 
		this script calls the perl script : ~/work/WG_phasing/Illumina/GATK/Snp_testing/Extractscore.pl
	 output : ~/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_Snps.scores.txt
	 b-linking the Snps scores with the snp evaluation 
	 input : Score file : ~/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_Snps.scores.txt
		 True variants file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
		 Java script : /home/knam/work/WG_phasing/java_programs/Vcf_Annotation_Evaluation.jar
	 script :  ~/work/WG_phasing/Illumina/GATK/Snp_testing/annotation_Evaluation.sh 
	 output : ~/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_annotation_evaluation.txt.gz
-----------------------------------------------------------------------------------------------------------------------------------------
Part 02: Filtering 
a- VQSR Filtering 
Step 01 :  Preparing tranches & recal files to use to for recalibrating the scores using True and training data 
	input : Ref :  ~/work/WG_phasing/Illumina/ref/release6.auto.fa
		Variant calling file : ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
		Truth vcf file :  /home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps_True.vcf.gz\
		Training vcf file : /home/knam/work/WG_phasing/Illumina_VQSR/Training/vcf/Gatk_Illumina_Snps.vcf.gz \
	script : ~/work/WG_phasing/Illumina/GATK/VQSR/Recalibrating.sh
	output : ~/work/WG_phasing/Illumina/GATK/VQSR/cohort_snps.*
Step 2 : Recalibrating the scores/APPLYING VQSR 
	input : Variant calling file : ~/work/WG_phasing/Illumina/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
		recal file : ~/work/WG_phasing/Illumina/GATK/VQSR/cohort_snps.recal 
  		tranches file : ~/work/WG_phasing/Illumina/GATK/VQSR/cohort_snps.tranches
	script : ~/work/WG_phasing/Illumina/GATK/VQSR/Applying_VQSR.sh
	output : /home/knam/work/WG_phasing/Illumina/GATK/VQSR/Snps.recalibrated.vcf.gz
Step 03 : Filtering Snps that has "PASS " in it's information and evaluating the results file 
	input : Variant calling file : /home/knam/work/WG_phasing/Illumina/GATK/VQSR/Snps.recalibrated.vcf.gz
		True variants file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
		Java script : /home/knam/work/WG_phasing/java_programs/VCF_Compare.jar
	script : ~/work/WG_phasing/Illumina/GATK/VQSR/Filtering_Testing_Snps.sh
	output : 
		Vcf file after VQSR filtering: /home/knam/work/WG_phasing/Illumina/GATK/VQSR/pass_filtered_VQSR_SNPs.vcf.vcf.gz
		Evaluation file : /home/knam/work/WG_phasing/Illumina/GATK/VQSR/VQSR_Filtered_snp_testing.txt.gz
		
b- Hard filtering using an R script + library tidyverse 
	and input file :~/work/WG_phasing/Illumina/GATK/Snp_testing/Gatk_Illumina_annotation_evaluation.txt.gz
	which contains the variants + their diffrent annotation scores(QD,FS..................)  and Snps evaluation(TP or FPà)  








