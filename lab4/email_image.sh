#!/bin/sh
#========remarks======
#mutt does not check if the email address is correct
#
#========================
#
#
#

for f in $@ 
do
	display $f

	echo -n "Address to e-mail this image to? "
	read email

	echo -n "Message to accompany image? "
	read message
	
	 	
	subject=`basename $f`
	echo "$message" | mutt -s "$subject'!'" -a "$f" -- $email 
	echo "$f sent to $email" 
done
