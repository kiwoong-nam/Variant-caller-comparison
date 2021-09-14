#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a9 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/Bam/a9.bam OUTPUT=a9_g9.bam RGID=a9 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a9;