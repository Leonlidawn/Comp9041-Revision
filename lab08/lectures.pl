#!/usr/bin/perl -w
#
#
#
#
#how to shorten the ini function while hashtable is used? the challenge: $hash{key}{subkey} = blah, can use hashref?
#
#
#
#
#
##



#ensure arguments are correctly used

die "Usage: ./courses.pl <COURSENAME>, optional flags: t or f.\n" if ($#ARGV+1 < 1);
@hours = ("09","10","11","12","13","14","15","16","17","18","19","20");
@days = ("Mon","Tue","Wed","Thu","Fri");
for(@ARGV){
	if($_ =~ /-t$/){
		$tf =1;
	}
	elsif($_ =~ /-d$/){
		$df =1;
	}
	elsif($_ =~ /[A-Z]{4}[0-9]{4}/){
		push @course, $_;
	} 
}
 #test of argument handling
if($tf){
	 #new hash table for new semester
	#it is assumed that S1,S2,X1 represents sems.
	for $h (@hours){
		for $d(@days){
			$S1{"$h:00"}{$d} = 0;
		}
	}
	 #print"first loop done\n";
	for $h (@hours){
		for $d(@days){
			$S2{"$h:00"}{$d} = 0;
		}
	}
	 #print"second loop done\n";
	for $h (@hours){
		for $d(@days){
			$X1{"$h:00"}{$d} = 0;
		}
	}

} 
#if($df){print"df is on\n";}
#foreach (@course){
#	print "$_\n";
#}

for $c (@course) {
	$url =  "http://www.timetable.unsw.edu.au/2015/$c.html";
	open $P, "wget -q -O- $url|" or die $!;		
	if(!($tf || $df)){	
		&ntable($url,$c,$P); 	
	}elsif($df){
		&dtable($url,$c,$P)
	}else{
		&ttable($url,$c,$P); 
	}
	
}

if($tf){
   if($s1){
   	print"S1       Mon   Tue   Wed   Thu   Fri\n";
   	for $h(@hours){
   		print("$h:00");
   		for $d("Mon","Tue","Wed","Thu","Fri"){
   			if($S1{"$h:00"}{$d} == 0){
   				print "      "; 
   			}
   			else{
   				print "     ".$S1{"$h:00"}{$d} ;
   			}
   		}
   		print"\n";
   	}
   }   
   if($s2){
   	print"S2       Mon   Tue   Wed   Thu   Fri\n";
  	for $h(@hours){
		print("$h:00");
		for $d("Mon","Tue","Wed","Thu","Fri"){
			if($S2{"$h:00"}{$d} == 0){
				print "      "; 
			}
			else{
				print "     ".$S2{"$h:00"}{$d} ;
			}
		}
		print"\n";
	}
   }
   if($x1){
	print"X1       Mon   Tue   Wed   Thu   Fri\n";
	for $h(@hours){
		print("$h:00");
		for $d("Mon","Tue","Wed","Thu","Fri"){
			if($X1{"$h:00"}{$d} == 0){
				print "      "; 
			}
			else{
				print "     ".$X1{"$h:00"}{$d} ;
			}
		}
		print"\n";
	}
   }  
}
#..------------------------------------------------------------------------------
#ccode:(sameline with ccode:)semester wday timeperiod (weeksperiod), samething...
sub ntable{#CHECKED
	(my $link, my $course, my $Page) = @_;
	while($line = <$Page>){
		 #irrelevant details 
		last if($line =~ /CLASSES - Detail/);
		if ($line =~ /<td class="data"><a href="#([SX][12])-[0-9]{4}">Lecture<\/a><\/td>/){
			
			my $sem = $1;
			 #$skip 5 lines and read the following line
			$line = <$Page> for(1..6) ;
			 #<td class="data">Mon 14:00 - 16:00 (Weeks:1-9,10-12), Wed 17:00 - 18:00 (Weeks:1-9,10-12)</td>
			$line =~ s/ *<td class="data">//; 
			$line =~ s/<\/td>//;
			chomp $line;
			 #if it is not web stream which has no info in this line. 
			if ($line){
				#don't print redundant line
				next if(($previousCourse)&&($previousCourse eq $course)&&($previousLine)&&($previousLine eq $line));
				$previousCourse = $course;
				$previousLine = $line;
				print("$course: $sem $line\n") ; 
			}
		}
		
	}
}
#------------------------------------------------------------------------------
#semester ccode wday timeinhr\nsamething
sub dtable{#checked
	(my $link, my $course, my $Page) = @_;
	while($line = <$Page>){
		 #irrelevant details 
		last if($line =~ /CLASSES - Detail/);
		if ($line =~ /<td class="data"><a href="#([SX][12])-[0-9]{4}">Lecture<\/a><\/td>/){
			my $sem = $1;
			 #$skip 5 lines and read the following line
			$line = <$Page> for(1..6) ;
			 #<td class="data">Mon 14:00 - 16:00 (Weeks:1-9,10-12), Wed 17:00 - 18:00 (Weeks:1-9,10-12)</td>
			$line =~ s/ *<td class="data">//;
			$line =~ s/<\/td>//;
			if (!($line)){
				next;
			} 
			#print $line."\n";
			$line =~ s/ \(Weeks:[^)]*\)//g;
			$line =~ s/:00//g;
			$line =~ s/- //g;
			chomp $line;
			#Mon 14 16, Wed 17 18
			next if(($previousCourse)&&($previousCourse eq $course)&&($previousLine)&&($previousLine eq $line));
			$previousLine = $line;	
			@data = split(", ",$line); 
			my @abbreviated =();
			#Mon 14 16
			for $schedule (@data){
				($day,$start,$end) = split(" ", $schedule);
				my $hr = scalar $start;
				
				
				
				while ($hr < scalar $end){
				$hr =~ s/^0//; 
					
					print("$sem $course $day $hr\n");
					$hr++;
				
				} 
			}
			$previousCourse = $course;
		}	
	}
	
}
#..------------------------------------------------------------------------------
#semester\t    Mon   Tue   Wed   Thu   Fri\n
#timehour     occurenceMon occurenceTue blablabla\n 
sub ttable{
	(my $link, my $course, my $Page) = @_;
	while($line = <$Page>){
		last if($line =~ /CLASSES - Detail/);
		if ($line =~ /<td class="data"><a href="#([SX][12])-[0-9]{4}">Lecture<\/a><\/td>/){
			
			$sem = $1;
			$line = <$Page> for(1..6) ;
			$line =~ s/ *<td class="data">//;
			$line =~ s/<\/td>//;
			if (!($line)){
				next;
			} 
			$line =~ s/ \(Weeks:[^)]*\)//g;
			
			next if(($previousCourse)&&($previousCourse eq $course)&&($previousLine)&&($previousLine eq $line));
			$previousCourse = $course;
			$previousLine = $line;
			$line =~ s/:00//g;
			$line =~ s/- //g;
			chomp $line;
			
			@data = split(", ",$line); 
			for $period (@data){
				
				if($period =~ /^[A-Z][a-z]{2}$/){
					push @abbreviated, $period;
					next;
				}
				($day,$start,$end) = split(" ", $period);
				
				if($end =~ /..:30/){
					$end =~ s/:00//g;
					$end++;
				}
				$hr = scalar $start;

				if(@abbreviated){
					for (@abbreviated){
						while ($hr < scalar $end){
							if($sem eq "S1"){$S1{"$hr:00"}{$day}++;}
							elsif($sem eq "S2"){$S2{"$hr:00"}{$day}++;}
							else{$X1{"$hr:00"}{$day}++;}
							$hr++;
						}
						$hr = scalar $start; 
					}
					@abbreviated = ();
				}
				
				while ($hr < scalar $end){
					if($sem eq "S1"){$S1{"$hr:00"}{$day}++; $s1 += 1;}
					elsif($sem eq "S2"){$S2{"$hr:00"}{$day}++; $s2 += 1;}
					else{$X1{"$hr:00"}{$day}++; $x1 += 1;}
					$hr++;
					#print($S1{"11:00"}{$day}."------\n");
					
				} 
				
			}#print($S1{"11:00"}{$day}."------\n");
		}	
	}
	 
}

