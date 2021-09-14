#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/GATK_Training/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a5 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/GATK_Training/Bam/a5.bam OUTPUT=a5_g5.bam RGID=a5 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a5;