Part 01  Varinat calling using bioinfo/bcftools-1.9
Step 01: variant calling (bcftools mpileup and then  bcftools call)
	input :  ~/work/WG_phasing/Illumina.R.02/ref/R_0.005.simseq.genome.fa + /home/knam/work/WG_phasing/Illumina.R.02/Bam_added_group/a*_g*.bam
	script :  ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/variant_calling.sh
	output : ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina.vcf.gz
Step 02 : Selecting only Snps :
	input :   ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina.vcf.gz + ~/work/WG_phasing/Illumina.R.02/ref/R_0.005.simseq.genome.fa
	script :  ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Selecting_snps.sh
	output : ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina_snps.vcf.gz 
Step 03 : Testing variants 
	input :  variant calling file : /home/knam/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina_snps.vcf
		 True variants from data file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
	         True variants from Mutation : /home/knam/work/WG_phasing/distant_ref/R_0.02.refseq2simseq.SNP.vcf
		 Java script : /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar
	script :  ~/work/WG_phasing/Illumina.R.02/BCFtools/Snp_testing/Snp_testing.sh
	output :  /home/knam/work/WG_phasing/Illumina.R.02/BCFtools/Snp_testing/ BCF_Snp_testing.R.02.txt.gz
------------------------------------------------------------------------------------------------------------------
Part 02 : Hard filtering 
Step 01 : hard filtering 
	  input :~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina_snps.vcf.gz
          script : ~/work/WG_phasing/Illumina.R.02/GATK/Hard_Filtering/filtering_QUAL_Superior20.sh
	  output : ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina_snps_Qual_S20.vcf.gz
Step 02 : Testing variants 
	input :  variant calling file : ~/work/WG_phasing/Illumina.R.02/BCFtools/vcf/Bcf_Illumina_snps_Qual_S20.vcf.gz
		 True variants from data file :/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt"
	         True variants from Mutation : /home/knam/work/WG_phasing/distant_ref/R_0.02.refseq2simseq.SNP.vcf
		 Java script : /home/knam/work/WG_phasing/java_programs/Snps_testing_distRef.jar
	script :  ~/work/WG_phasing/Illumina.R.02/BCFtools/Snp_testing/Snp_testing_filtered.sh
	output : /home/knam/work/WG_phasing/Illumina.R.02/BCFtools/Snp_testing/BCF_Snp_testing.R.02.filtered.txt.gz