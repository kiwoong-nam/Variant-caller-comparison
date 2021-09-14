use strict;

for(my $i=0;$i<20;$i++)
{
        my $job=
"#!/bin/bash
#SBATCH --mem=20G
cd ~/work/WG_phasing/Illumina.R.015/GATK_True/Bam_added_group
java -Xmx4g -Djava.io.tmpdir=temp.a$i -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT= ~/work/WG_phasing/Illumina.R.015/GATK_True/Bam/a$i.bam OUTPUT=a${i}_g$i.bam RGID=a$i RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=a$i;";
        open my $fd,">/home/knam/work/WG_phasing/Illumina.R.015/GATK_True/Bam_added_group/adding_group_$i.sh";
                        print $fd $job;
                                                close $fd;
                                                                        }

                                                                        
