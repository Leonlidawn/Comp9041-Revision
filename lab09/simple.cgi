#!/usr/bin/perl -w
use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
print <<eof;
<!DOCTYPE html>
<html lang="en">
<head>
    <title>simple html</title>
    <link href="s.css" rel="stylesheet">
</head>
<body>
<div class = "nav" > <h1> sha bi </h1>  
 try me ! 
   </div> 
</body>
</html>


print <<eof;
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Guess A Number</title>
    <link href="guess_number.css" rel="stylesheet">
</head>
<body>
<div class = "nav" > <h1> sha bi </h1>  </div> 
I've  thought of number 0..99
    <form method="POST" action="">
        <input type="textfield" name="guess">
        <input type="hidden" name="number_to_guess" value="94">
    </form>
</body>
</html>
eof
