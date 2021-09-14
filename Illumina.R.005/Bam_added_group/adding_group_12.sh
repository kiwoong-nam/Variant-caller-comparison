#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.005/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a12 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.005/Bam/a12.bam OUTPUT=a12_g12.bam RGID=a12 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a12;