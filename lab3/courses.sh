#!/bin/bash
#================Remarks=====================
#wget for geting 
#
#
# sed -r 's/^[ \t]*//g'
#
#============================================
if test $# -lt 1
then
	echo "Usage: ./courses.sh <course prefix>"
	exit
fi

for prefix in $@
do

postgrad=`wget -q -O- "http://www.handbook.unsw.edu.au/vbook2015/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=ALL"`
postgrad=`echo "$postgrad" | egrep "<TD class=""".*"</TD>" | egrep -v \>[0-9][0-9]?"</TD>"$ | egrep -io ">"[^=\".]+" "*["</A>"]?"</TD>"$ | sed -r 's/<.*>//g'|sed 's/>//g'|sed -r 's/([A-Z]{4}[0-9]{4})/\n\1/g'| tr '\n' ' '| sed 's/  /\n/g' | sed -r 's/^\s//g' | grep ^$prefix`

undergrad=`wget -q -O- "http://www.handbook.unsw.edu.au/vbook2015/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=ALL"`
undergrad=`echo "$undergrad" | egrep "<TD class=""".*"</TD>" | egrep -v \>[0-9][0-9]?"</TD>"$ | egrep -io ">"[^=\".]+" "*["</A>"]?"</TD>"$ | sed -r 's/<.*>//g'|sed 's/>//g'|sed -r 's/([A-Z]{4}[0-9]{4})/\n\1/g'| tr '\n' ' '| sed 's/  /\n/g' | sed -r 's/^\s//g' | grep ^$prefix`

#question: how to delete the last line break?
nline=`echo -e "$postgrad""\n$undergrad" | sort -u | wc -l`
nline =`expr $nline-1`
echo -e "$postgrad""\n$undergrad" |sort -u |head -$nline
#echo -e "$postgrad""\n$undergrad" |sort -u |tail -1 |sed 's/\n//'


done
