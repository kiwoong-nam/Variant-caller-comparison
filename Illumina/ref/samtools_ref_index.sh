#!/bin/bash

cd ~/work/WG_phasing/Illumina/ref  

module load bioinfo/samtools-1.9

samtools faidx release6.auto.fa  
