package Url;
{    
    sub getRequestURI {
        my $URI = $ENV{REQUEST_URI};

        my @uriSplit = split /\?/, $URI;
        
        $URI = $uriSplit[0];

        my $lastcaracter = substr($URI, (length $URI) - 1, 1);

        if($lastcaracter eq "/"){
            $URI = substr($URI, 0, (length $URI) - 1 );
        }        

        return $URI;
    }
}
1;