#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.01/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a10 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.01/Bam/a10.bam OUTPUT=a10_g10.bam RGID=a10 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a10;