#!/usr/bin/perl
#=============Remarks=======================
#@ARGV can sometimes be considered as the number of elements in the array, perl's dynamic type feature isn't accurate all the time, avoid using @ARGV directly when you want the size of it, use $#AGV + 1 instead. But you can use scalar @ARGV, scalar means to treat variable as number.
#
#  =~ m/pattern/    for matching
#
#
#when input contains \, it treats it specially, so...
#
#=============================================

#print "@ARGV and $#ARGV\n";
#if (@ARGV = $#ARGV){ true, because perls thinks you want @ARGV to be int when you compare with another int.
#	print "hello"; 
#}


#this program should take exactly 2 arguments
#print "$ARGV[0]";# question : can print
#$number=$ARGV[0]; #1
if ($#ARGV + 1 != 2 ) {
	#print "$ARGV[0] $number";# question : cant print if #1 is executed
	die "Usage: ./echon.pl <number of lines> <string>\n";
	
}

$string = $ARGV[1];

for ($i = 0; $i < $ARGV[0]; $i++) {
	print "$string\n"; #question how to print \ from the command line. \n outputs n
}
