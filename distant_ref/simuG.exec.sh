#!/bin/bash
#SBATCH --mem=50G

cd /home/knam/work/WG_phasing/distant_ref

perl /home/knam/save/programs/simuG/simuG.pl -refseq /home/knam/save/WG_phasing/data_prep/simulation/ref/release6.auto.fa.gz -snp_count 2206767 -prefix R_0.02

perl /home/knam/save/programs/simuG/simuG.pl -refseq /home/knam/save/WG_phasing/data_prep/simulation/ref/release6.auto.fa.gz -snp_count 1655075 -prefix R_0.015

perl /home/knam/save/programs/simuG/simuG.pl -refseq /home/knam/save/WG_phasing/data_prep/simulation/ref/release6.auto.fa.gz -snp_count 1103383 -prefix R_0.01

perl /home/knam/save/programs/simuG/simuG.pl -refseq /home/knam/save/WG_phasing/data_prep/simulation/ref/release6.auto.fa.gz -snp_count 551692 -prefix R_0.005

