#!/usr/bin/perl -w
#=====remarks=================
#it is useful to use split and array together.
#@array = split /regex/, $string ;
#  the split function gives \n at every splitted word. in this case, @array handles it as element separator.
#
# $#array gives the number of elements in @array counting from 0
#
while ($line = <>){
	
	chomp $line;
	if ($line){
		$line =~ s/^[^a-zA-Z]+//g;
		@words = split /[^a-zA-Z]+/, $line; 
		$total +=  $#words+1;
	}
}
print "$total words\n";
