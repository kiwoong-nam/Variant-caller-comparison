use strict;

my $indir='/home/knam/work/WG_phasing/data_prep/simulation/fasta';
my $outdir='/home/knam/work/WG_phasing/data_prep/simulation/fasta/diploid';

my $seqid;
for(my $i=0;$i<40;$i+=2)
{
	my $file1="$indir/i".($i).".fasta.gz";
	my $file2="$indir/i".($i+1).".fasta.gz";

	my $j=$i/2;
	my $outF="$outdir/s$j.fa";

	`rm $outF`;
	$seqid=1;	
	extseq($outF,$file1);
	extseq($outF,$file2);

	`gzip -f $outF`;
}

sub extseq
{
	(my $output,my $fileN)=(@_);

	open my $fd,"zcat $fileN |";
	while(<$fd>)
	{
		$_=~s/\n//g;
		if($_=~/>/)
		{
			print "$seqid $_ $output\n";
			open my $fdw,">>$output";
			print $fdw ">seq$seqid\n";
			close $fdw;
			$seqid++;
		}
		else
		{
			open my $fdw,">>$output";
			print $fdw "$_\n";
			close $fdw;
		}
	}
	close $fd;
}



