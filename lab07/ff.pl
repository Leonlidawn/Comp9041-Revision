#!/usr/bin/perl -w
#=======remark==========
#perl is stupid! you'd better use capital letter when you declare a struct
#
#
#
#
###
use Class::Struct;
struct (Fstruct => {poet => '$', t => '$', c =>'$',f=>'$'});
@freqs=();
$match = $ARGV[0]
foreach $file (glob "poets/*.txt"){
	open(F,"<$file");
	while($line =<F>){
	 chomp $line;
		if($line){
		$line =~ s/^[^a-zA-Z]+//g;
		@words = split /[^a-zA-Z]+/, $line; 
		$total +=  $#words+1;
		foreach $word (@words){
			if (lc($word) eq $match){
				$count++;
			}

		}
	 }
	}
	close F;
	$file =~ m/([^\/]*).txt/g;
	$freq = $count/$total;
	$newF = Fstruct->new(poet=>$file,c=>$count,t=>$total,f=>$freq);
	$total = 0;
	$freq = 0;
	$count = 0; 
	push @freqs,$newF;
}	

foreach $e(@freqs){
	 printf ("%4d/%6d = %.9f %s\n",$i->c, $i->t, $frq, $i->poet);
}

