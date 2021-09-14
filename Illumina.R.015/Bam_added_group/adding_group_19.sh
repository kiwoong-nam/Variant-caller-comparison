#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a19 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/Bam/a19.bam OUTPUT=a19_g19.bam RGID=a19 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a19;