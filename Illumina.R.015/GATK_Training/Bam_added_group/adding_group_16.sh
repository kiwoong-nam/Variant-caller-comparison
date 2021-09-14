#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/GATK_Training/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a16 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/GATK_Training/Bam/a16.bam OUTPUT=a16_g16.bam RGID=a16 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a16;