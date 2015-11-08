#!/usr/bin/perl -w
#=======remark==========
#perl is stupid! you'd better capitalize first letter when you declare a struct
#
###
use Class::Struct;
struct (Fstruct => {poet => '$', t => '$', c =>'$',f=>'$'});
@freqs=();
$match = $ARGV[0];
foreach $file (glob "poets/*.txt"){
	open(F,"<$file");
	$total = 0;
	$freq = 0;
	$count = 0; 
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
	$freq = $count/$total;
	$newF = Fstruct->new(poet=>$fname,c=>$count,t=>$total,f=>$freq);
	
	push @freqs,$newF;
}	

@freqs = sort{$a->poet cmp $b->poet} @freqs;

foreach $e(@freqs){
	 printf ("%4d/%6d = %.9f %s\n",$e->c, $e->t, $e->f, $e->poet);
}

