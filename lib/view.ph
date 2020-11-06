package view;

our $HTML = undef;

sub show {

    if($HTML == undef){
        die("Not implements! Please inform a HTML.");
    }

    print $HTML;
}

