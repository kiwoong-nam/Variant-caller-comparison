#!/bin/bash

cd ~/work/WG_phasing/Illumina/ref 

module load bioinfo/gatk-4.2.0.0

gatk CreateSequenceDictionary -R release6.auto.fa.gz  -O release6.auto.dict
