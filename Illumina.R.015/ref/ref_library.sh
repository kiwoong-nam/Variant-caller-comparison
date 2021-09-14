#! /bin/bash
module load bioinfo/bowtie2-2.3.5.1

cd ~/work/WG_phasing/Illumina.R.015/ref 
bowtie2-build -f R_0.015.simseq.genome.fa bt2_index_base


