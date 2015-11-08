#!/usr/bin/perl -w
use CGI qw/:all/;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;
print header, start_html("Credit Card Validation"),
#warningsToBrowser(1);
h2("Credit Card Validation");

warningsToBrowser(1);
$credit_card = param("credit_card") ;
$validity = param("validity") ;
#choose which to print
if(defined param("Close")){
	print"Thank you for using the Credit Card Validator. ";
}
else{

	print start_form, "\n";
	print p,"This page checks whether a potential credit card number satisfies the Luhn Formula." ;

	if (defined $credit_card){
		$credit_card =~ s/\</&lt/g;
		$credit_card =~ s/\>/&gt/g;
	    print p, &validate($credit_card);
	    if((defined $validity) && ($validity == 1)){#correct
			 print p,"Another card number: \n",textfield('credit_card'), "\n";
			
		}
	    else{
			    print p,"Try again: \n",textfield('credit_card',$credit_card), "\n";
		}
	}else{
	   
	    print p,"Enter credit card number: \n",textfield('credit_card'), "\n";
	}
	    print hidden('credit_card'),"\n";
	    print hidden('validity'),"\n";
	    print submit('Validate')," ",
	    reset('Reset')," ",
	    submit('Close'),
	    end_form;
}
print end_html;
exit 0;






sub validate(){
    $credit_card = $_[0];
	
	my $number = $credit_card;
    $number =~ s/[^0-9]//g;
    if ( length $number != 16){
	$validity = 0;
        return "<B><font color=red>".$credit_card." is invalid - does not contain exactly 16 digits.</font></B>";
    }
    elsif ((&luhn_checksum($number) % 10 )== 0){
	$validity = 1;
        return $credit_card." is valid\n";
    }
    else{
	$validity = 0;
        return  "<B><font color=red>".$credit_card." is invalid</font></B>";
    }
}


sub luhn_checksum(){
    my $number = $_[0];
    $checksum = 0;
    $digits = reverse($number);
    @ds = split //, $digits;
    $i = 0;
    foreach $digit (@ds){
        $multiplier = 1 + $i % 2;
        $d = int($digit) * $multiplier ;
        if ($d > 9){
            $d -= 9;
	}
        $checksum += $d;
	$i++;
	
    }
	
    return $checksum;
}
