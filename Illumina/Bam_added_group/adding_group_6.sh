#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a6 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina/Bam/a6.bam OUTPUT=a6_g6.bam RGID=a6 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a6;