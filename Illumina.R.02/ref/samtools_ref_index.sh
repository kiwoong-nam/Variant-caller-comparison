#!/bin/bash

cd   ~/work/WG_phasing/Illumina.R.02/ref 

module load bioinfo/samtools-1.9

samtools faidx R_0.02.simseq.genome.fa
