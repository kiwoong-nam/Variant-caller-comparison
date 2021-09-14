use strict;

my $ni=40;
my $input='/home/knam/work/WG_phasing/data_prep/simulation/slim/sim.vcf.gz';
my $ref='/home/knam/work/WG_phasing/data_prep/simulation/ref/release6.auto.fa.gz';
my $outD='/home/knam/work/WG_phasing/data_prep/simulation/fasta';

for (my $i=0;$i<$ni;$i++)
{
	my $j=$i+9;

	my $output="$outD/i$i.fasta";
	my %mut;
	my $go='n';
	open my $fd, "zcat $input |";
	while(<$fd>)
	{
		if($_=~/OUT/) {$go='y'}
		if($_=~/#/) {next}
		if($go ne 'y') {next}
		$_=~s/\n//;
		my @single=split("\t",$_);
		$single[$j]=~/^./;
		my $gen=$&;
		my $pos=$single[1];
		if($gen==1){ $mut{$pos}=1}
	}
	close $fd;

	my $n=0;
	my $seq;
	my $id;
	my $newseq;
	open my $fd, "zcat $ref |";
	while(<$fd>)
	{
		if($_=~/>.* (\w+)/)
		{
			my $preid=$1;
			unless($seq eq '')
			{
				$newseq.="\n>$id\n";
				for(my $i=0;$i<(length $seq);$i++)
				{
					$n++;
					my $nt=substr($seq,$i,1);
					my $j=$i+1;
					if($mut{$n} eq '') {$newseq.=$nt}
					else
					{
						my $r=rand 1;
						if($nt eq 'A')
						{
							if($r<0.333333) {$newseq.='T'}
							elsif($r<0.666666) {$newseq.='G'}
							else {$newseq.='C'}
						}
						if($nt eq 'T')
						{
							if($r<0.333333) {$newseq.='G'}
							elsif($r<0.666666) {$newseq.='A'}
							else {$newseq.='C'}
						}
						if($nt eq 'G')
						{
							if($r<0.333333) {$newseq.='T'}
							elsif($r<0.666666) {$newseq.='A'}
							else {$newseq.='C'}
						}
						if($nt eq 'C')
						{
							if($r<0.333333) {$newseq.='T'}
							elsif($r<0.666666) {$newseq.='G'}
							else {$newseq.='A'}
						}
					}
				}

			}
			$id=$preid;
			undef $seq;
		}
		else
		{
			$_=~s/\n//;
			$seq.=$_;
		}
	}	
	close $fd;

	$newseq.="\n>$id\n";

	for(my $i=0;$i<(length $seq);$i++)
	{
		$n++;
		my $nt=substr($seq,$i,1);
		my $j=$i+1;

		if($mut{$n} eq '') {$newseq.=$nt}
		else
		{
			my $r=rand 1;
			if($nt eq 'A')
			{
				if($r<0.333333) {$newseq.='T'}
				elsif($r<0.666666) {$newseq.='G'}
				else {$newseq.='C'}
			}
			if($nt eq 'T')
			{
				if($r<0.333333) {$newseq.='G'}
				elsif($r<0.666666) {$newseq.='A'}
				else {$newseq.='C'}
			}
			if($nt eq 'G')
			{
				if($r<0.333333) {$newseq.='T'}
				elsif($r<0.666666) {$newseq.='A'}
				else {$newseq.='C'}
			}
			if($nt eq 'C')
			{
				if($r<0.333333) {$newseq.='T'}
				elsif($r<0.666666) {$newseq.='G'}
				else {$newseq.='A'}
			}
		}
	}
  
	$newseq=~s/^\n//;

	open my $fd,">$output";
	print $fd $newseq;
	close $fd;

	`gzip -f $output`;
}   

