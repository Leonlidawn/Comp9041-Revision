#!/usr/bin/perl -w
$i = 0;
# read all lines into an array
while ($line = <STDIN>) {
	$lines[$i] = $line;
	$randList[$i] = $i;
	$i++;
}

#shuffle the printing order.
$limit = $i;
for($count = 0; $count < $limit;$count++){
	$r1 = rand($i);
	$r2 = rand($i);
	$temp = $randList[$r2];
	$randList[$r2] = $randList[$r1];
	$randList[$r1] = $temp;
}

#print the lines according to shuffled order.
foreach $r (@randList){
	print $lines[$r];
}


