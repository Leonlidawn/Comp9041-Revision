#!/bin/sh
#===========Remarks==================
#in unix, variable must be enclosed by "" to be resolved.
#In this case where you need "" inside "", you need to use #\" instead to avoid the vaiable being taken by draw as more #arguments.
#
#to get time stamp in numeric form, use stat
#to modify time stamp, use touch
#=================================
#
for f in $@
do

#capture the time
time=`ls -l "$f" | cut -d' ' -f6-8`

#challenge
#capture the last modification time in numeric format
tStamp=`stat -c %y "$f" | sed -r 's/[0-9]{4}-//' | sed -r 's/[- :]//g'| egrep -o ^[0-9]{8}`


if test -r "$f"
then
	#add the time lable
	convert -gravity south -pointsize 36 -draw "text 0,10\"$time\"" "$f" "$f"
fi
#challenge
#change the modification time stamp back.
#echo ===============$tStamp
touch -c -t $tStamp $f

done
