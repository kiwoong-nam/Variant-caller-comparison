#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a0 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina/Bam/a0.bam OUTPUT=a0_g0.bam RGID=a0 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a0;