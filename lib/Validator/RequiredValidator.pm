package RequiredValidator;
{
    use Validator;
    my $message;

    sub new {
        return bless {};
    }

    sub setParameters {
        my ($message) = @_;
    }

    sub validate {
        $value = $_[0];
        Validator::validate ($value ne undef || $value > 0) $message ;
    }
    
}