#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a2 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina/Bam/a2.bam OUTPUT=a2_g2.bam RGID=a2 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a2;