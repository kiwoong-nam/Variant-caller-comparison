Step 01 : Preparing the reference sequence 
a- Refrence library:
	input :  ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa
	script :  ~/work/WG_phasing/Illumina.R.015/ref/ref_library.sh
	output : ~/work/WG_phasing/Illumina.R.015/ref/bt2_index_base.*
b- Gatk Refrence Indexing 
	input :  ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa
	script :  ~/work/WG_phasing/Illumina.R.015/ref/gatk_ref_index.sh
	output : ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.dict
c- Samtools Refrence Indexing 
	input :  ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa
	script :  ~/work/WG_phasing/Illumina.R.015/ref/samtools_ref_index.sh
	output : ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa.fai
Step 02 : Mapping, Sorting and converting from sam to bam 
	input :   /home/knam/save/WG_phasing/data_prep/Illumina/i*_read*.fq.gz + ~/work/WG_phasing/Illumina.R.015/ref/bt2_index_base.*
	scripting : /home/knam/work/WG_phasing/Illumina.R.015/Bam/scripting.pl
	script :  /home/knam/work/WG_phasing/Illumina.R.015/Bam/alignment_*.sh
	output : /home/knam/work/WG_phasing/Illumina.R.015/Bam/a*.bam
Step 03: Pereparing the Bam before variant calling
a-adding Group 
	input :  /home/knam/work/WG_phasing/Illumina.R.015/Bam/a*.bam
	scripting : /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/scripting.pl
	script :  /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/adding_group_$i.sh
	output : /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/a*_g*.bam
b-Indexing :
	input :  /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/a*_g*.bam
	script :  /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/bam_indexing.sh
	output : /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/a*_g*.bam.bai




