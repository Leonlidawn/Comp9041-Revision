#!/usr/bin/perl -w

use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);

print header, start_html('A Guessing Game Player');
warningsToBrowser(1);

if (defined param("x")){
	$x = param("x");
}else{
  $x = 50;
}

if (defined param("x")){
	$l = param("l");
}else{
  $l = 0;
}
if (defined param("x")){
	$h = param("h");
}else{
  $h = 100;
}



print   start_form, "\n";
if (defined param("Correct?")) {
	print "I win!!!! ",
	submit('Play Again')," ";
}
else{
	if(($l != $h)){
		if (defined param("Higher?")) {
			$l = $x;
			$x = ($l+$h)/2 ;
			$x = int ($x);
			if ($x == $l ){
				$x = $h; 
				$l = $h;
			}
		}elsif (defined param("Lower?")) {
				$h = $x;
				$x = ($l+$h)/2  ;
				$x = int ($x);
		}
	}
	param('x', $x);
	param('l', $l);
	param('h', $h);
	print" My guess is: $x \n";
	#"h:$h l:$l \n",
      	
      	    print hidden('x'),"\n";
      	    print hidden('h'),"\n";
	    print hidden('l'),"\n";
	    print submit('Higher?')," ",
	    submit('Correct?')," ",
	    submit('Lower?')," ",
	    end_form;
}
print end_html;
