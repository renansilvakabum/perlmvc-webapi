package Url;
{
    use StringUtils;
    sub getRequestURI {
        my $URI = $ENV{REQUEST_URI};

        my @uriSplit = split /\?/, $URI;
        
        $URI = $uriSplit[0];

        my $lastcaracter = substr($URI, (scalar $URI) - 1, 1);

        if($lastcaracter eq "/"){
            $URI = substr($URI, 0, (scalar $URI) - 1 );
        }        

        return $URI;
    }
}
1;