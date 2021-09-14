#!/bin/bash

cd  ~/work/WG_phasing/Illumina.R.015/ref 

module load bioinfo/samtools-1.9

samtools faidx R_0.015.simseq.genome.fa
