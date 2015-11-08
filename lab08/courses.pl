#!/usr/bin/perl -w
#======remarks======
#for(1..111) is a simple loop.we can still use $_ access the current element though.
#
#
####
die "Usage: ./courses.pl <coursename>\n" if (!$ARGV[0]);
$cprefix = $ARGV[0];
$url =  "http://www.timetable.unsw.edu.au/2015/$cprefix"."KENS.html";
open F, "wget -q -O- $url|" or die $!;

for(1..111){#skip 111 lines to jump to the content(Subject Area Listing).
	$line = <F>;
}

while ($line = <F>) {
	if ($line =~ /<td class="data"><a href="($cprefix[0-9]{4}).html">$cprefix[0-9]{4}<\/a><\/td>/) {
		print $1."\n";
		for(1..7){#skip 7 lines after course code is matched
			$line = <F>;
		}
	}
	
	
}
