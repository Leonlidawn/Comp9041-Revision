#!/usr/bin/perl -w


#handles the arguments 

if($#ARGV+1 == 0){ die "<filename(s)> or -d <filename>"}
if( ($ARGV[0] eq "-d")){
	#print"\n\n\n".$ARGV[1]."==================\n\n";
	shift @ARGV;
	$debugg =1;
}
foreach (@ARGV){$_ = "./$_"; }
@fpattern = @ARGV;	


foreach $file (glob "poets/*.txt"){
	$file = `basename $file`;
	$file =~ s/.txt//g;
	$file =~ s/_/ /g;
	$poet = $file;
	chomp $poet;
	$tlfreq{"$poet"} = 0;
} 

foreach $poem (@fpattern){
	my $poem = $poem;
	 #first put all different words found in the poem into an array.	
	@dwords = &collect($poem);
	 #sum the lp of them by each poot(add the results iteratively)
	foreach $dword(@dwords){
		%slfreq = &lfreq($dword);
		foreach $poet (keys %tlfreq){
			$tlfreq{"$poet"} = $slfreq{"$poet"} + $tlfreq{"$poet"};  
			#$hh= $tlfreq{"$poet"};
			#print "$hh\n";
		}
	}

	#printing results
	$poem =~ s/\.\///g;
	if($debugg){
		
		foreach (sort {$tlfreq{$b} <=> $tlfreq{$a}}keys %tlfreq){
			printf("%s: log-probability of %.1f for %s\n",$poem,$tlfreq{$_},$_);
		}
	}
	
	foreach (sort {$tlfreq{$b} <=> $tlfreq{$a}} keys %tlfreq) {
   	 	printf("%s most resembles the word of %s (log-probability=%.1f)\n",$poem,$_,$tlfreq{$_});
    	
    	 last;
	}
		
}

sub collect{
	open (P,"<@_");
	my @allwords=();
 	#print(",,,\n");
 	while ($line = <P>){
		$line =~ tr/A-Z/a-z/;
		#chomp $line;
		@words = split("[^a-zA-Z]", $line);
		OUTTER:	
		foreach my $word (@words){
			foreach $allword(@allwords){
				if($allword eq $word){next OUTTER;}
				
			}
		push  @allwords,$word;	
		}
	
 	} 
 	close F;
 	return @allwords;
}

sub lfreq{

	%frecord = ();
	$match = "@_";
	foreach my $file (glob "poets/*.txt") {
        	$tt = &ttotal_words($file)."\n";
		$ct = &count_word($file,$match);	
		if(!$ct){$ct = 0;}

	        $lfreq = log(($ct+1)/$tt);
		$file = `basename $file`;
		$file =~ s/.txt//g;
		$file =~ s/_/ /g;
		$poet = $file;
		chomp $poet;

		#$frecord{$poet}{"ct"}   = $ct;
		#$frecord{$poet}{"tt"}   = $tt;
		#$frecord{$poet}{"lfreq"}   = $lfreq;
		$frecord{$poet} = $lfreq;
	}
	return %frecord;

}




sub ttotal_words{
	my $total;
	open(F,"<@_");
	while ($line = <F>){
	
		chomp $line;
		if ($line){
			$line =~ s/^[^a-zA-Z]+//g;
			@words = split /[^a-zA-Z]+/, $line; 
			$total += $#words+1;
		}
	
	} 
	close F;
	return $total;	
}

sub count_word{
	my $count;
	($file, $match) = (@_);
	open(F,"<$file");
	while ($line = <F>){
	
		$line =~ s/^[^a-zA-Z]+//g;
		@words = split /[^a-zA-Z]+/, $line; 
		foreach $word (@words){
			if (lc($word) eq lc($match)){
				$count++;
			}
	
		}
	
	}
	close F;
	return $count;	

} 


