#!/bin/sh

==========================grep================== 
case-insensitive  (-i) 

inverted result  (-v)

recursive search, going into the subdir  (-r) 

also prints the filename  (-H)  

corresponding line number (-n). 

highlighted with different colours  (--color=auto)

ignore binery files -(-I)

supress "doesn't exist" and "can't read" messages (-s)

only match pattern if it makes a complete word (-w)


============ input / output ===================
< infile connect stdin to the file infile
> outfile connect stdout to the file outfile
>> outfile apppend stdout to the file outfile
2> outfile connect stderr to the file outfile
2>&1 > outfile connect stderr+stdout to outfile
==================filter options=================
- for short form, which can be combined
-- for long form
so --help or -? often gives a list of all command-line options

===============cat================
Catching the content of the given input
-n number output lines(starting form 1)
-s squeeze consecutive blank lines into single line
-v display control-characters in visible form (eg. ^C)

=============wc===============
counts what you want in the given input
-c counts the number of characters (including space)
-w counts the number of words (non-white space)
-l counts the number of lines
Some filters find counting so useful that they define their own options for
it (e.g. grep -c)

===============tr================
tranforming input char-by-char according to a mapping
eg. tr 'source' 'Chars' < dataFile

-c map all chars not occuring in sourceChars (complement)
-s squeeze adjacent repeated chars out (only copy the first, destChars may not required)
-d delete all char in sourceChars (no destChars in this case)

tr does not accept file name on command line, so you should type the mapping.
characters that are not in the sourceChar is unchange
if the destChars are less than sourceChar, the last destChar is mapped with the excessive sourceChars
	
=================head and tail====================
head -30 copies the output of the first 30 lines
tail -30 // // // the last 30 lines

head -10 | tail -2 copies the 3 to 10 lines

==========egrep,fgreg================
same as grep -E , egrep allows using of  +, ?, | and ().

grep -F ,Fgrep performs faster with an unique algorithm when only no wildcards used.
========shell==================
$0 the name of the command
$1 the first command-line argument
$2 the second command-line argument
$3 the third command-line argument
$# count of command-line arguments
$* all of the command-line arguments (together)
$@ all of the command-line arguments (separately)
$? exit status of the most recent command
$$ process ID of this shell
