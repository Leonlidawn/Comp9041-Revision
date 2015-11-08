#!/usr/bin/perl -w
#
#=====remarks=========
#  m// is the matching operator.
# $1 eql to the first match string in the last match operation.
# 
#
##
$name = "@ARGV";
$numPod = 0;
$numInd = 0;
#$esc = "\e\n";
while($line = <STDIN>){
	
	chomp $line;
	
	if($line =~ /.* $name/g){
		$line =~ /\s?([0-9]+)/;
		$numInd += $1; 
 		$numPod++;
	}
}

print "$name observations: $numPod pods, $numInd individuals\n";

exit;
