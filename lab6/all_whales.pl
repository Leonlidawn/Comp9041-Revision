#!/usr/bin/perl -w
#
#=====remarks=========
#  m// is the matching operator.
# $1 eql to the first match string in the last match operation.
# ===================
# for struct,
#	    struct Cat =>
#    [ #{ for hash ( for list [ for array
#        name     => '$',
#        kittens  => '@',
#        markings => '%',
#        breed    => 'Breed' ];
#
# $cat = Cat->new(blah=>blah);
# $cat->blah(assignValue);
#==================================
#sort comparison : <=> for numbers , cmp for strings
#
#
#
#
##
use Class::Struct;

struct (spCount => {name => '$',pod => '$',ind => '$'});

@sp=();

#$esc = "\e\n";
while($line = <STDIN>){
	chomp $line;
	$line =~ s/' /'s /g;
	if($line =~ m/\s?([0-9]+)\s+(.*)/gi){
		$num = scalar ($1); 
		$name = lc $2;
		$name =~ s/(.*)s$/$1/g;
		$name =~ s/\s+/ /g;
		$name =~ s/\s$//g;
		count();
		#print"$name $num\n"
	}

}
	
@sp = sort {$a->name cmp $b->name} @sp;
foreach $s (@sp){
	print $s->name," observations:  ",$s->pod," pods, ",$s->ind," individuals\n";
}
exit;

sub count{
	my $found = 0;
	foreach $s (@sp){
		if ($name eq $s->name){
			$found = 1;
			$s->pod(scalar($s->pod) + 1);
			$s->ind(scalar($s->ind) + scalar($num)); 
			last;	
		} 
	}

	if($found != 1){
		#print $name;
		$newSp = spCount->new(name => "$name",pod=>1,ind=>$num);
		push @sp,$newSp;
	}
	
}
