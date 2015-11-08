#!/usr/bin/perl
#======remarks==================
#$string in perls does not need to worry about special commands contained in it, they dont execute unless you use '$string'
#
#only print will allow output to display on screen.
#
#perls variables needs $ all the time, unlike shell only needs $ when variable is used on righthand side.
#
# =~ s///g  is same as sed 's///g'
#
#
#=========================

while($string = <STDIN>){
	$string =~ s/[0-4]/</g;
	$string =~ s/[6-9]/>/g;
	print $string;

}
