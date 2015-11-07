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
-r #sort in descending order (reverse sort) eg. e d c b a
-n #sort numerically rather than lexicographically eg. a2 b c d 2 3 4 5 6
-d #dictionary order: ignore non-letters and non-digits 
-t’c’ #use character c to separate columns (default: space)
-kn #sort on column n
#Note: the ’ ’ around the separator char are usually not necessary, but
#are useful to prevent the shell from mis-interpreting shell meta-characters
#such as ’|’.
#Hint: to specify TAB as the field delimiter with an interactive shell like
#bash, type CTRL-v before pressing the TAB key.
======join=======
-a file_number
             In addition to the default output, produce a line for each unpairable line in file file_number.
-e string
             Replace empty output fields with string.
-t char
             Use character char as a field delimiter for both input and output.  Every occurrence of char in a line is significant.

-v file_number
             Do not display the default output, but display a line for each unpairable line in file file_number.  
             The options -v 1 and -v 2 may be specified at the same time.

-1 field
             Join on the field'th field of file 1.

-2 field
             Join on the field'th field of file 2.

     When the default field delimiter characters are used, the files to be joined should be ordered
     in the collating sequence of sort(1), using the -b option, on the fields on which they are to
     be joined, otherwise join may not report all field matches.  When the field delimiter charac-
     ters are specified by the -t option, the collating sequence should be the same as sort(1)
     without the -b option.
=========sed===========

sed -r 's/^[ \t]*//g'   # -r for extended regex 
backslash          \\
carriage-return    \r
tab                \t

==========uniq=========
     -c      Precede each output line with the count of the number of times
             the line occurred in the input, followed by a single space.

     -d      Only output lines that are repeated in the input.

     -f num  Ignore the first num fields in each input line when doing compar-
             isons.  A field is a string of non-blank characters separated
             from adjacent fields by blanks.  Field numbers are one based,
             i.e., the first field is field one.

     -s chars
             Ignore the first chars characters in each input line when doing
             comparisons.  If specified in conjunction with the -f option, the
             first chars characters after the first num fields will be
             ignored.  Character numbers are one based, i.e., the first char-
             acter is character one.

     -u      Only output lines that are not repeated in the input.

     -i      Case insensitive comparison of lines.
=====find======
find starts from the current directory by default
==================assigning variables=============
variable on the left-hand side of = is 'naked'/without $.
no space before and after =, otherwise use of =`blah` will go wrong
count=0
b=$count
=====read======
read var #takes input from keyboard then assign it to the variable.
========Execution flow =============
if testList{1}
then
commandList{1}
elif testList{2}
then
commandList{2}
else
commandList{n}
fi

while testList
do
commandList
done
for loops set a variable to successive words from a list:
for var in wordList
do
commandList # ... generally involving var
don

for file in * #loop 当前目录的文件名
for file in `ls * | sort -n` #loop 命令行output, ls * 会额外显示当前目录folders里面的文件，比 ls 深入一层。
========echo========
echo -n means not print "\n" at the end of the line.
===========test=============
'expr blah' makes it to be an expression
string comparison ( = != )
numeric comparison ( -eq -ne -lt -gt )
checks on files ( -f -x -r )
boolean operators ( -a -o ! )
Examples:
‘expr $sum + "$n"‘ 
# does the variable msg have the value "Hello"?
test "$msg" = "Hello"
# does x contain a numeric value larger than y?
test "$x" -gt "$y"
# is the value of x in range 10..20?
test "$x" -ge 10 -a "$x" -le 20
# is the file xyz a readable directory?
test -r xyz -a -d xyz
# alternative syntax; requires closing ]
[ -r xyz -a -d xyz ]
Note: use of quotes, spaces around values/operators
 ! expression  True if expression is false.

     expression1 -a expression2
                   True if both expression1 and expression2 are true.

     expression1 -o expression2
                   True if either expression1 or expression2 are true.

     (expression)  True if expression is true.

     The -a operator has higher precedence than the -o operator.
=========================================
Commands can be grouped using ( ... ) or { ... }
(cmd1 ; ... cmdn) are executed in a new sub-shell.
{cmd1 ; ... cmdn } are executed in the current shell.
===============renaming a file/directory ===================
#Rename A File Called /tmp/foo To /tmp/bar
# create /tmp/foo 这个可以更改文件夹名字
touch /tmp/foo
ls -l /tmp/foo
mv /tmp/foo /tmp/bar

Task: Rename multiple files
Use rename command renames multiple files. For example rename all *.perl file as *.pl, enter:
rename .perl .pl *.perl
#rename 原值 新值 
