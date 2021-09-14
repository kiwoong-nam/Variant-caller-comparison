#!/bin/bash

cd ~/work/WG_phasing/Illumina.R.02/ref 

module load bioinfo/gatk-4.2.0.0

gatk CreateSequenceDictionary -R R_0.02.simseq.genome.fa -O R_0.02.simseq.genome.dict
