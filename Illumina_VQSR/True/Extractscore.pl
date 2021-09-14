use strict;

my $input='/home/knam/work/WG_phasing/Illumina_VQSR/True/vcf/Gatk_Illumina_Snps.vcf.gz';
my $output='/home/knam/work/WG_phasing/Illumina_VQSR/True/Snp_testing/Gatk_Illumina_Snps.scores.txt';

open my $fd,">$output";
print $fd "chr\tpos\tMQ\tFS\tQD\tReadPosRankSum\tMQRankSum\n";
close $fd;

my $res;

my $n=0;
open my $fd,"zcat $input | ";
while(<$fd>)
{
	unless($_=~/#/)
	{
		my @single=split("\t",$_);
		$single[7]=~/ReadPosRankSum=([\d|\.|\-]+)/;
		my $ReadPosRankSum=$1;
		$single[7]=~/MQRankSum=([\d|\.|\-]+)/;
		my $MQRankSum=$1;
		$single[7]=~/QD=([\d|\.|\-]+)/;
		my $QD=$1;
		$single[7]=~/MQ=([\d|\.|\-]+)/;
		my $MQ=$1;
		$single[7]=~/FS=([\d|\.|\-]+)/;
		my $FS=$1;

		my $pass;
		unless($ReadPosRankSum eq '' or $MQRankSum eq '' or $QD eq '' or $MQ eq '' or $FS eq '')
		{
			$res.="$single[0]\t$single[1]\t$MQ\t$FS\t$QD\t$ReadPosRankSum\t$MQRankSum\n";

			$n++;
			if($n%10000==0)
			{
				open my $fd,">>$output";
				print $fd $res;
				close $fd;
				undef $res;
			}

		}
	}
}

open my $fd,">>$output";
print $fd $res;
close $fd;






