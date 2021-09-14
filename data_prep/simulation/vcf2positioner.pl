use strict;

my $ni=40;
my $outF='/home/knam/work/WG_phasing/data_prep/simulation/fasta/right.position.txt';
my $input='/home/knam/work/WG_phasing/data_prep/simulation/slim/sim.vcf.gz';
my $ref='/home/knam/work/WG_phasing/data_prep/simulation/ref/release6.auto.fa.gz';

my $res="slim2\tchr\tpos\t";
my %MUT=mutationFinder();

my $nonvar;
for(my $i=0;$i<$ni;$i++) {$nonvar.='0'}

my $n=0;

my $id;
my $seq;
open my $fd, "zcat $ref |";
while(<$fd>)
{
	if($_=~/>.* (\w+)/)
	{
		my $preid=$1;
		unless($seq eq '')
		{
			collectINFO($seq,$id);
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
collectINFO($seq,$id);

open my $fd,">$outF";
print $fd $res;
close $fd;

sub collectINFO
{
	(my $s,my $name)=(@_);

	for(my $i=1;$i<=(length $s);$i++)
	{
		$n++;
		my $position="$id\t$i";
		if($MUT{$n} ne '') {$res.="$n\t$name\t$i\t$MUT{$n}\tYes\n"}
		else {$res.="$n\t$name\t$i\t$nonvar\tNo\n"}
	}
}

sub mutationFinder
{
	my $resT="slim2\tchr\tpos\t";

	my $go='n';
	my %mu;
	open my $fd, "zcat $input |";
	L:while(<$fd>)
	{
		$_=~s/\n//;
		my @single=split("\t",$_);

		if($_=~/CHROM/)
		{
			for(my $j=9;$j<(9+$ni);$j++) {$res.="$single[$j]\|"}
	                $res.="\tVAR\n";
			$go='y';
			next;
		}

		if($go eq 'y')
		{
			my $seqp;
			for(my $j=9;$j<(9+$ni);$j++)
			{
				$single[$j]=~/^./;
				my $gen=$&;
				$seqp.=$gen;
			}
			if($seqp=~/1/) {$mu{$single[1]}=$seqp}
		}
	}
	close $fd;

	return %mu;
}
