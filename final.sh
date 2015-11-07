#!/bin/sh
========shell evironment variables ==================
$0 the name of the command
$1 the first command-line argument
$2 the second command-line argument
$3 the third command-line argument
$# count of command-line arguments
$* all of the command-line arguments (together)
$@ all of the command-line arguments (separately)
$? exit status of the most recent command
$$ process ID of this shell
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


============reading input===================
< infile connect stdin to the file infile
> outfile connect stdout to the file outfile
>> outfile apppend stdout to the file outfile
2> outfile connect stderr to the file outfile
2>&1 > outfile connect stderr+stdout to outfile
- means stdin
eg. filter data1 - data2 means called program filter, pass in data1, stdin then data2  

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

====cut=========
-fN   n represents the nth column. print the nth columncolumn.
-cN   n represents the nth positions. print the nth position.
-dC   use the char c as the field separator.
eg.
# print the first column
cut -f1 data
# print the first three columns
cut -f1-3 data
# print the first and fourth columns
cut -f1,4 data
# print all columns after the third
cut -f4- data
# print the first three columns, if ’|’-separated
cut -d’|’ -f1-3 data
# print the first five chars on each line
cut -c1-5 data
=======paste=====
The paste command displays several text files ”in parallel” on
output.
If the inputs are files a, b, c
the first line of output is composed of the first lines of a, b, c
the second line of output is composed of the second lines of
a, b, c
Lines from each file are separated by a tab character or specified
delimiter(s).
-s effect:1	2	3a	b	c
-d  circularly use listed characters to replace the newline characters instead of the default tab. 
======sort=======
-r sort in descending order (reverse sort) eg. e d c b a
-n sort numerically rather than lexicographically eg. a2 b c d 2 3 4 5 6
-d dictionary order: ignore non-letters and non-digits 
-t’c’ use character c to separate columns (default: space)
-kn’ sort on column n
Note: the ’ ’ around the separator char are usually not necessary, but
are useful to prevent the shell from mis-interpreting shell meta-characters
such as ’|’.
Hint: to specify TAB as the field delimiter with an interactive shell like
bash, type CTRL-v before pressing the TAB key.
======join=======

=========sed===========
=====find======
find starts from the current directory by default
