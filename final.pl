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

#==========file 内e加(),(e)========
#% a.out file e
open F,"<$ARGV[0]" or die;
@a=<F>;
foreach $line (@a) {
	if ($line=~/$ARGV[1]/) {
		$line=~s/$ARGV[1]/($ARGV[1])/g;
		print $line;
	}
}

#========student fine==========
$max_nu=0;
$max_name="";

while (1) {
	print "Enter student name: ";
	$name=<>;
	chomp $name;
	if (!$name) {
		last;
	}else {
		print "Enter fine: ";
		$fine=<>;
		$total_fine{$name} += $fine;
	}
	if($total_fine{$name}>$max_nu){
		$max_nu=$total_fine{$name};
		$max_name=$name;
	}
}
print "\nExpel $max_name whose library fines total \$$max_nu\n";




#===========lab_5=============
# open file
# Escape Key is \e\n
#(scalar @files) length


print rand(1);#used as array index $array[rand(7)] will be int 
mark shuffing



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

@words;
$total +=  $#words+1;
array length increse


for (1..11) {
	print $_;
}



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

foreach $a (array) {
	print $a;
}
equal to
for (array) {
	print $_;
}

#==============
#=======hash===
#==============
my %hash =(); #hash name
$hash{$key}=$value;
foreach $key (sort keys %hash){
	print "$hash{$key}\n";
}





#===================
#========wget=======
#===================
pen F, "wget -q -O- http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html|" or die;





#========================
#========html frame======
#========================
#!/bin/sh
echo Content-type: text/html

echo

host_address=`host $REMOTE_ADDR 2>&1|grep Name|sed 's/.*: *//'`

cat <<eof
<!DOCTYPE html>


<html lang="en">
<head>
<title>Webserver IP, Host and Software</title>

</head>
<body>

Your browser is running at IP address:  <b>$SERVER_ADDR</b>
<p>
Your browser is running on hostname:  <b>$HTTP_HOST</b>
<p>
Your browser identifies as: <b>$HTTP_USER_AGENT</b>

</body>
</html>


eof