#!/bin/bash

cd  ~/work/WG_phasing/Illumina.R.005/ref 

module load bioinfo/samtools-1.9

samtools faidx R_0.005.simseq.genome.fa
