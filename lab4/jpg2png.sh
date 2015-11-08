#!/bin/sh
#======remarks==============
#basename is used to determine the name of the file without
#suffix, given a directory.
#	eg. basename /usr/bin/sort   
#		gives "sort"
#it also removes the suffix if specified. 
#	eg.basename blah .jpg
#
#while using =~ , avoid putting regex in " " , sometimes it causes unexpected matches.
#===========================
#
#loop through evevry file from the argument.
for f in * # by default is "$@"
do	
	if [[ $f =~ .*'.jpg'$ ]]
	then
		echo $f
		#get name of jpg file without suffix
		basename=`basename "$f" .jpg`
		#echo =============$basename found
		pf="$basename.png"
		if test -e "$pf"
		then 
			echo "$pf already exists"
			exit 1
		fi 	
		convert "$f" "$pf"
		rm "$f"
	fi
done







