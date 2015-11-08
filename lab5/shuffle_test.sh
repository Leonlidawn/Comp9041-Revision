#!/bin/sh

#test 1
num=`i=0;while test $i -lt 5; do echo $i; i=$((i + 1)); done|./shuffle.pl|wc -l`
if test $num -ne 5  
then	
	echo "Your program output 5 lines but it outputs $num lines."
	exit 1
#test 2
else
	
	 
	string1=`i=0;while test $i -lt 5; do echo $i; i=$((i + 1)); done|./shuffle.pl`
	string2=`i=0;while test $i -lt 5; do echo $i; i=$((i + 1)); done|./shuffle.pl`
	
	echo "your first ouput is :" 
	echo "$string1"
	echo "your second output is:"
	echo "$string2"
	if [ "$string1" == "$string2" ]
	then
		echo "your program generated same output twice. The outputs are not so random!"
		exit 2
	fi

fi

echo 'Test passed! You are awesome!'

