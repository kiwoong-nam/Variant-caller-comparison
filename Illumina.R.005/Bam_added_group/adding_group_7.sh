#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.005/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a7 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.005/Bam/a7.bam OUTPUT=a7_g7.bam RGID=a7 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a7;