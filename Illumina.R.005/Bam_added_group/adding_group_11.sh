#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.005/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a11 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.005/Bam/a11.bam OUTPUT=a11_g11.bam RGID=a11 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a11;