#! /bin/bash
module load bioinfo/bowtie2-2.3.5.1

cd ~/work/WG_phasing/Illumina.R.02/ref 
bowtie2-build -f R_0.02.simseq.genome.fa bt2_index_base


