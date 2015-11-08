#!/usr/bin/perl -w

($match = lc($ARGV[0])) or die "Usage: count_word.pl <matching word>";

while ($line = <STDIN>){

	@words = split /[^a-zA-Z]+/, $line; 
	foreach $word (@words){
		if (lc($word) eq $match){
		$count++;
	}
	
	}
	
}
print "$match occurred $count times \n";
