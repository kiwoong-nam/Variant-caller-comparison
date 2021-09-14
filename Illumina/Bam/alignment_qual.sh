#! /bin/bash
#SBATCH -c 8
#SBATCH --mem=10G

module load bioinfo/qualimap-31-08-20

cd ~/work/WG_phasing/Illumina/Bam


qualimap multi-bamqc -d data.bam.txt -r -outdir Qual


