#!/usr/bin/perl -w
#=======remark==========
#
#
###
use Class::Struct;
struct (Fstruct => {poet => '$', t => '$', c =>'$',lf=>'$'});
@lfreqs=();
$match = $ARGV[0];
foreach $file (glob "poets/*.txt"){
	open(F,"<$file");
	$total = 0;
	$lfreq = 0;
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
	$lfreq = log(($count+1)/$total);
	$newF = Fstruct->new(poet=>$fname,c=>$count,t=>$total,lf=>$lfreq);
	
	push @lfreqs,$newF;
}	

@lfreqs = sort{$a->poet cmp $b->poet} @lfreqs;

foreach $e(@lfreqs){
	 printf ("log((%d+1)/%6d) = %8.4f %s\n",$e->c, $e->t, $e->lf,$e->poet);
}
