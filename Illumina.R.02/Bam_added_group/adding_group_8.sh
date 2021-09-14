#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.02/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a8 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.02/Bam/a8.bam OUTPUT=a8_g8.bam RGID=a8 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a8;