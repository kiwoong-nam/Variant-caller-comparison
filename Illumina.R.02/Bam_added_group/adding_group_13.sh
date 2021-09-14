#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.02/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a13 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.02/Bam/a13.bam OUTPUT=a13_g13.bam RGID=a13 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a13;