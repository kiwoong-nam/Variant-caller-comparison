#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a15 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/Bam/a15.bam OUTPUT=a15_g15.bam RGID=a15 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a15;