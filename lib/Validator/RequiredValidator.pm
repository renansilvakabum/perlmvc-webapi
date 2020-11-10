package RequiredValidator;
{
    use Validator;
    my $message;

    sub new {
        return bless {};
    }

    sub setParameters {
        my ($message) = @_;
        
        return bless {};
    }

    sub validate {
        $value = $_[0];        
        print "Content-Type: text/html \n\n";
        print "111";
        return Validator::validate($value ne undef || $value > 0, $message);
    }
    
}
1;