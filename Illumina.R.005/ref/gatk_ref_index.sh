#!/bin/bash

cd ~/work/WG_phasing/Illumina.R.005/ref 

module load bioinfo/gatk-4.2.0.0

gatk CreateSequenceDictionary -R R_0.005.simseq.genome.fa  -O R_0.005.simseq.genome.dict
