#! /bin/bash
module load bioinfo/bowtie2-2.3.5.1

cd   ~/work/WG_phasing/Illumina/ref 
bowtie2-build -f release6.auto.fa.gz bt2_index_base

