#!/usr/bin/perl -w
while ($line = <>) { 
}
#==========================
while ($ARGV[0]!=0) {
	print "$ARGV[1]\n";
	$ARGV[0]--;
}
#==========================open file & file to array
open(F ,"<$f" ) or die "tail.pl: can't open $f \n";
my @Lines = <F>;
#===========
push @files, $element;