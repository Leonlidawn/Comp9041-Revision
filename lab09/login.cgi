#!/usr/bin/perl -w
#
# order is super important
#	param 
#	start_form
#	promt for params
#	hidden
#	submit
#	endform 
#
#
#
####
use CGI qw/:all/;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;

print header, start_html('Login');
warningsToBrowser(1);

$username = param('username') ;
$password = param('password') ;

if(($username) && ($password)){
	
	if( open(my $file,'<',"accounts/$username/password") ){
		$pass = <$file>;
		chomp $pass;
		if ($pass eq $password){
			print "$username authenticated.\n" ;
		}else{
			print "Incorrect password!\n";
		}	
	}else{
		print "Unknow username!\n";
	}
	
}else{
	print start_form, "\n";
	print "Username :\n", textfield('username'), "\n" if(!$username);
	print "Password :\n", textfield('password'), "\n" if(!$password);
	print hidden('username'),"\n";
	print hidden('password'),"\n";
	print submit(value => Login), "\n";
	print end_form, "\n";

}

print end_html;
exit(0);

