#!/bin/bash

cd ~/work/WG_phasing/Illumina.R.01/ref 

module load bioinfo/gatk-4.2.0.0

gatk CreateSequenceDictionary -R R_0.01.simseq.genome.fa  -O R_0.01.simseq.genome.dict
