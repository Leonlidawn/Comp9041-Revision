#!/usr/bin/perl -w

#==========practic exam==========
#=========a.out=============
foreach $a (@ARGV) {
	$hash{$a}+=1;
	if ($hash{$a}<=1) {
		$string.=$a." ";
	}
}
$string=~s/ $//g; #dele the end space 
print $string;
#=========a.out_2===========
$max_count=0;
$max_key="";
foreach $a (@ARGV) {
	$hash{$a}++;
	if ($hash{$a} >$max_count) {
		$max_count=$hash{$a};
		$max_key=$a;
	}
}
print $max_key;
#========四舍五入=======
while ($line=<>) {
	$line=~s/\d+\.\d+/int($&+0.5)/eg;
	print $line;
}


#========24H -> 12H ===============

#======替换指定行内容===========
@a =<>;
$i=0;
foreach $line (@a){
	if ($line=~/^#\d+/) {
		$line=~s/^#//;
		$a[$i]=$a[$line-1];
	}
	$i++;
}
print @a;
#======<!echo how>=====how========
while ($line=<>) {
	while ($line=~ /<!([^!><]+)>/) {
		$s = `$1`;
		$line =~ s/<!$1>/$s/;
	}
	print $line;
}


#===========change part string order==========
while ($line=<>) {
	chomp $line;
	@a=split /\|/,$line;
	$a[2]=~s/(.*), (.*)/$2 $1/;
	print join("|",@a),"\n";
}



#==========================
while ($ARGV[0]!=0) {
	print "$ARGV[1]\n";
	$ARGV[0]--;
}
#=====open file & file to array
open(F ,"<$f" ) or die "tail.pl: can't open $f \n";
my @Lines = <F>;



#=================
#===array=========
#=================
@a = (1,3,5);
$element=2;
push @a, $element;	#add to last
pop @a;	#dele last element
$last_element = pop @a;
@b = reverse(@a);	#reverse array
@b = sort(@a);	#sort array
shift @a;	#dele left first
unshift @a,7;	#add from left first
sdf



#===========
#split array
#===========
$split_string="e q r 2 3 4 r w r";
@split_array=split / /,$split_string;
foreach $a (@split_array){
	print $a."#";
}
#output:e#q#r#2#3#4#r#w#r#
my ($number, $whale) = split(/ /, $line, 2);
#===========
#join array
#===========
$new_split_string=join ",",@split_array;
print $new_split_string;
#output:e,q,r,2,3,4,r,w,r




#==============
#=======hash===
#==============
my %hash =(); #hash name
$hash{$key}=$value;
foreach $key (sort keys %hash){
	print "$hash{$key}\n";
}

