#!/bin/bash

cd   ~/work/WG_phasing/Illumina.R.01/ref 

module load bioinfo/samtools-1.9

samtools faidx R_0.01.simseq.genome.fa
