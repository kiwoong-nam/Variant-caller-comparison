#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.02/GATK_Training/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a1 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.02/GATK_Training/Bam/a1.bam OUTPUT=a1_g1.bam RGID=a1 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a1;