package Response;
{

    use CGI;
    use JSON;    
    use Comparator;

    my $cgi = new CGI;

    sub new{
        return bless {};
    }

    sub response {     
         
        my $code = $_[1];
        my $message = $_[2];
        my $contenttype = Comparator::isJson($message) ? "application/json" : "text/html";  

        print $cgi->header(
            -status => $code,
            -charset => 'utf-8',
            -type => $contenttype
        );          
        
        print $message;
    }
}
1;