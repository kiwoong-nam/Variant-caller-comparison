#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/GATK_True/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a4 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/GATK_True/Bam/a4.bam OUTPUT=a4_g4.bam RGID=a4 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a4;