#!/usr/bin/perl -w

 use strict;
#need file names
if($#ARGV+1 == 0){ die "<filename(s)> or -d <filename>"}

#check which mode to run
if( ($ARGV[0] eq "-d")){
	shift @ARGV;
	my $debugg =1;
}

#initialise the hash tlfreq by setting its keys and values.
#tlfreq is the total frequency.
foreach my $file (glob "poets/*.txt"){
	$file =~ m/([^\/]*).txt/g;
	$fname = $1;
	$fname =~ s/_/ /g;
	$poet = $fname;
	$tlfreq{"$poet"} = 0;
} 

foreach $poem (@ARGV){
	 #first put all different words found in the poem into an array.	
	$ref_dwords = collect("./$poem");
	
	%dwords = %{$ref_dwords};	
	 #sum the lp of them (add the results iteratively)
	foreach $dword (keys %dwords){
		# print "... " .$dwords{$dword}."\n";
		%slfreq = &lfreq($dword,$dword{$dword});
		
		foreach $poet (keys %tlfreq){
			$tlfreq{"$poet"} = $slfreq{"$poet"} + $tlfreq{"$poet"};  
		}
	}
	#printing results
	$poem =~ s/\.\///g;
	if($debugg){
		
		foreach (sort {$tlfreq{$b} <=> $tlfreq{$a}}keys %tlfreq){
			printf("%s: log-probability of %8.1f for %s\n",$poem,$tlfreq{$_},$_);
		}
	}
	
	foreach (sort {$tlfreq{$b} <=> $tlfreq{$a}} keys %tlfreq) {
   	 	printf("%s most resembles the word of %s (log-probability=%.1f)\n",$poem,$_,$tlfreq{$_});
    	
    	 last;
	}
		
}

#collects all different words 
sub collect{
	my ($file) = @_;

	open (P,"<$file");
	my %allwords = ();

 	while ($line = <P>){
		
		$line =~ s/^[^a-zA-Z]+//g;
		if($line){
			$line = lc ($line);
			@words = split /[^a-zA-Z]+/, $line;
				
			foreach my $word (@words){ 
				if($allwords{$word}){
					$allwords{$word}+=1;
					
				}else{
					$allwords{$word}=1;
				}
			}
		}
 	} 
 	close F;
 	return \%allwords;

}

#log probability
sub lfreq{

($match,$n) = (@_);


print"$n\n";
foreach $file (glob "poets/*.txt"){
	open(F,"<$file");
	my $total = 0;
	my $lfreq = 0;
	my $count = 0; 
	while($line =<F>){
	 chomp $line;
		if($line){
		$line =~ s/^[^a-zA-Z]+//g;
		@words = split /[^a-zA-Z]+/, $line; 
		$total +=  $#words+1;
			foreach $word (@words){
				if (lc($word) eq lc($match)){
					$count++;
				}

			}
	 	}
	}
	close F;
	$file =~ m/([^\/]*).txt/g;
	$fname = $1;
	$fname =~ s/_/ /g;
	if($n>1){
		$count = $count * $dwords{"$match"};
	}
	$lfreq = log(($count+1)/$total);
	$lfreqs{"$fname"}=$lfreq;

}	

return %lfreqs;
}

