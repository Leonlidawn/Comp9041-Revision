#!/usr/bin/perl -w
#=======REMARKS====
# FOR FUNCTIONS 
#	&FUNCTION OR FUNCTION() WILL DO.
#
#
#
#################
$ccode = $ARGV[0];

@url = ("http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$ccode.html","http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ccode.html");


for $url(@url){
	findp();
}

sub findp{
	my $url = $url;
	open F, "wget -q -O- $url|" or die $!;
	while ($line = <F>) {
	
		if ($line =~ /.*Prerequisite.*/) {
			#print "$line\n";
			$line =~ s/<\/p><p><strong>Excluded:.*//;
			#fill every matched item in the array
			@preq = $line =~ /[A-Z]{4}[0-9]{4}/gi;
			for $preq (@preq) {
				print "$preq\n";
			}
		}	
	}

}
