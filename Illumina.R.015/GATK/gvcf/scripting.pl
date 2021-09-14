use strict;

for(my $i=0;$i<20;$i++)
{
        my $job=
"#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=20G

cd ~/work/WG_phasing/Illumina.R.015/GATK/gvcf  
module load bioinfo/gatk-4.2.0.0

gatk HaplotypeCaller -R ~/work/WG_phasing/Illumina.R.015/ref/R_0.015.simseq.genome.fa -I /home/knam/work/WG_phasing/Illumina.R.015/Bam_added_group/a${i}_g$i.bam -O h$i.gvcf.gz -ERC GVCF";
        open my $fd,">/home/knam/work/WG_phasing/Illumina.R.015/GATK/gvcf/haplotyping_$i.sh";
        print $fd $job;
        close $fd;
}

