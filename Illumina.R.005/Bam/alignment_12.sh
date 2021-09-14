#! /bin/bash
module load bioinfo/bowtie2-2.3.5.1
module load bioinfo/samtools-1.9

cd  ~/work/WG_phasing/Illumina.R.005/ref 

bowtie2 -x bt2_index_base -1 /home/knam/save/WG_phasing/data_prep/Illumina/i12_read1.fq.gz -2 /home/knam/save/WG_phasing/data_prep/Illumina/i12_read2.fq.gz|samtools view -bS |samtools sort -o  /home/knam/work/WG_phasing/Illumina.R.005/Bam/a12.bam