package RequiredValidator;
{
    use Validator;
    my $message;

    sub setMessage {
        $message = $_[0];
    }

    sub validate {
        $value = $_[0];
        Validator::validate ($value ne undef || $value > 0) $message ;
    }
    
}