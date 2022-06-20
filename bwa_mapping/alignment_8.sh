#! /bin/bash
module load bioinfo/bwa-mem2-2.2
module load bioinfo/samtools-1.9

cd ~/work/WG_phasing/Illumina.R.005_bwa/ref  

bwa-mem2 mem R_0.005.simseq.genome.fa /home/knam/work/WG_phasing/data_prep/Illumina/i8_read1.fq.gz /home/knam/work/WG_phasing/data_prep/Illumina/i8_read2.fq.gz|samtools view -bS |samtools sort -o /home/knam/work/WG_phasing/Illumina.R.005_bwa/Bam/a8.bam