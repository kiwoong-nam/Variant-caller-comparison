#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.02/GATK_Training/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a14 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.02/GATK_Training/Bam/a14.bam OUTPUT=a14_g14.bam RGID=a14 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a14;