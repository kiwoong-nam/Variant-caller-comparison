Part 01 using bioinfo/bcftools-1.9
Step 01: variant calling (bcftools mpileup and then  bcftools call)
	input :  ~/work/WG_phasing/Illumina/ref/release6.auto.fa.gz + /home/knam/work/WG_phasing/Illumina/Bam_added_group/a*_g*.bam
	script :  ~/work/WG_phasing/Illumina/BCFtools/vcf/variant_calling.sh
	output : ~/work/WG_phasing/Illumina/BCFtools/vcf/Bcf_Illumina.vcf.gz
Step 02 : Selecting only Snps :
	input :   ~/work/WG_phasing/Illumina/BCFtools/vcf/Bcf_Illumina.vcf.gz + ~/work/WG_phasing/Illumina/ref/release6.auto.fa
	script :  ~/work/WG_phasing/Illumina/BCFtools/vcf/Selecting_snps.sh
	output : ~/work/WG_phasing/Illumina/BCFtools/vcf/Bcf_Illumina_snps.vcf.gz 
Step 03 : Testing variants 
	input :  variant calling file : ~/work/WG_phasing/Illumina/BCFtools/vcf/Bcf_Illumina_snps.vcf.gz
		 True variants file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
		 Java script : /home/knam/work/WG_phasing/java_programs/bcf_vcfParser.jar
	script :  /work/WG_phasing/Illumina/BCFtools/Snp_testing/testing_Snps_parcing_qual_genotype.sh
	output :  /home/knam/work/WG_phasing/Illumina/BCFtools/Snp_testing/Bcf_Illumina_evaluation_QUAL.txt
Step 04 : Hard Filtering using quality score :
	using an R scrip + library tidyverse 
----------------------------------------------------------------------------------------------------------------------------------------------
Part 02 using bioinfo/samtools-0.1.19
Step 01: variant calling (bcftools mpileup and then  bcftools call)
	input :  ~/work/WG_phasing/Illumina/ref/release6.auto.fa.gz + /home/knam/work/WG_phasing/Illumina/Bam_added_group/a*_g*.bam
	script :  ~/work/WG_phasing/Illumina/BCFtools/vcf_v0.1.19/variant_calling.sh
	output : ~/work/WG_phasing/Illumina/BCFtools/vcf_v0.1.19/Bcf_Illumina_2.vcf.gz

Step 02 : Testing variants 
	input :  variant calling file : ~/work/WG_phasing/Illumina/BCFtools/vcf_v0.1.19/Bcf_Illumina_2.vcf.gz
		 True variants file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
		 Java script : /home/knam/work/WG_phasing/java_programs/bcf_vcfParser.jar
	script :  /work/WG_phasing/Illumina/BCFtools/Snp_testing/testing_Snps_bcftools_oldVersion.sh
	output :  /home/knam/work/WG_phasing/Illumina/BCFtools/Snp_testing/Bcf_oldVesrion_Illumina_evaluation_QUAL.txt.gz 
Step 03 : Hard Filtering using quality score :
	using an R scrip + library tidyverse 
	input file : ~/work/WG_phasing/Illumina/BCFtools/Snp_testing/Bcf_Illumina_evaluation_QUAL.txt.gz
	which contains the variants qual score and evaluation 

