#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a17 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina/Bam/a17.bam OUTPUT=a17_g17.bam RGID=a17 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a17;