Part 01 : GATK variant calling pipeline using bioinfo/gatk-4.2.0.0
Step 01: Haplotype calling
	input :  ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa + /home/knam/work/WG_phasing/Illumina.R.005/Bam_added_group/a*_g*.bam
	scripting: ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/scripting.pl
	script :  ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/haplotyping_1.sh
	output : ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/h*.gvcf.gz
Step 02: Merging gvcf files 
	input :  ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/h*.gvcf.gz +  ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa 
	script :  ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/merging_gvcf.sh
	output : ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/merged_gvcf_Illumina.gvcf.gz
Step 03: variant calling 
	input :   ~/work/WG_phasing/Illumina.R.005/GATK/gvcf/merged_gvcf_Illumina.gvcf.gz + ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa
	script :  ~/work/WG_phasing/Illumina.R.005/GATK/vcf/variant_calling.sh
	output :  ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina.vcf.gz
Step 04 : Selecting only Snps :
	input :   ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina.vcf.gz + ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa
	script :  ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Selecting_snps.sh
	output : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
Step 05 : Testing variants 
	input :  variant calling file : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
		 True variants from data file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
	         True variants from Mutation : /home/knam/work/WG_phasing/distant_ref/R_0.005.refseq2simseq.SNP.vcf
		 Java script : /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar
	script :  ~/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/Snp_testing.sh
	output :  /home/knam/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_Snp_testing.R.005.txt.gz
Step 5.1:a-parcing annotation scores form vcf file to generate score file (snps position + snps annotations)
	 input : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
	 script :  ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Extractscore.sh 
		this script calls the perl script : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Extractscore.pl
	 output : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.scores.txt
	 b-linking the Snps scores with the snp evaluation 
	 input : Score file : /home/knam/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.scores.txt
		 True variants from data file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
	         True variants from Mutation : /home/knam/work/WG_phasing/distant_ref/R_0.005.refseq2simseq.SNP.vcf
		 Java script : /home/knam/work/WG_phasing/java_programs/Vcf_Annotation_Evaluation_DistantRef.jar 
	 script :  ~/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/Snp_Annotation_Evaluation.sh
	 output : ~/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_Snp_Annotation_testing.R.005.txt.gz
-----------------------------------------------------------------------------------------------------------------------------------------
Part 02: Filtering 
a- VQSR Filtering 
Step 01 :  Preparing tranches & recal files to use to for recalibrating the scores using True and training data 
	input : Ref :  ~/work/WG_phasing/Illumina.R.005/ref/R_0.005.simseq.genome.fa
		Variant calling file : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
		Truth vcf file : /home/knam/work/WG_phasing/Illumina.R.005/GATK_True/vcf/Gatk_Illumina_True_Snps.vcf.gz
		Training vcf file : /home/knam/work/WG_phasing/Illumina.R.005/GATK_Training/vcf/Gatk_Illumina_Snps.vcf.gz 
	script : ~/work/WG_phasing/Illumina.R.005/GATK/VQSR/Recalibrating.sh
	output : ~/work/WG_phasing/Illumina.R.005/GATK/VQSR/cohort_snps.*
Step 2 : Recalibrating the scores/APPLYING VQSR 
	input : Variant calling file : ~/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
		recal file : ~/work/WG_phasing/Illumina.R.005/GATK/VQSR/cohort_snps.recal 
  		tranches file : ~/work/WG_phasing/Illumina.R.005/GATK/VQSR/cohort_snps.tranches
	script : ~/work/WG_phasing/Illumina.R.005/GATK/VQSR/Applying_VQSR.sh
	output : /home/knam/work/WG_phasing/Illumina.R.005/GATK/VQSR/Snps.recalibrated.vcf.gz
Step 03 : Filtering Snps that has "PASS " in it's information and evaluating the results file 
	input : Variant calling file : /home/knam/work/WG_phasing/Illumina.R.005/GATK/VQSR/Snps.recalibrated.vcf.gz
		True variants from data file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
	        True variants from Mutation : /home/knam/work/WG_phasing/distant_ref/R_0.005.refseq2simseq.SNP.vcf
		Java script : /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar
	script : ~/work/WG_phasing/Illumina.R.005/GATK/VQSR/Filtering_Testing_Snps.sh
	output : 
		Vcf file after VQSR filtering: /home/knam/work/WG_phasing/Illumina.R.005/GATK/VQSR/pass_filtered_VQSR_SNPs.vcf.gz
		Evaluation file : /home/knam/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_VQSR_Snp_testing.R.005.txt.gz
		
b- Hard filtering 
Step 01 : hard filtering 
	  input :/home/knam/work/WG_phasing/Illumina.R.005/GATK/vcf/Gatk_Illumina_Snps.vcf.gz
          script : ~/work/WG_phasing/Illumina.R.005/GATK/Hard_Filtering/Hard_Filtering.sh
		 this script calls the perl script : /home/knam/work/WG_phasing/java_programs/SNPfiltering.pl
	  output : /home/knam/work/WG_phasing/Illumina.R.005/GATK/Hard_Filtering/Illumina_GATK_hardfiltering_SNPs.vcf.gz
Step 02 : Testing Snps : 
          input :  variant calling file : /home/knam/work/WG_phasing/Illumina.R.005/GATK/Hard_Filtering/Illumina_GATK_hardfiltering_SNPs.vcf.gz
		 True variants from data file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
	         True variants from Mutation : /home/knam/work/WG_phasing/distant_ref/R_0.005.refseq2simseq.SNP.vcf
		 Java script : /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar
	  script :  ~/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/Snp_hardFiltering_testing.sh
	  output :  /home/knam/work/WG_phasing/Illumina.R.005/GATK/Snp_testing/GATK_Snp_hardFiltering_testing.R.005.txt.gz







P



