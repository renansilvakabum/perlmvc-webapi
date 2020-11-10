package MaxValidator;
{
    use Validator;
    my $length;
    my $message;

    sub new {
        return bless {};
    }

    sub setParameters {
        my ($message, $length) = @_;
    }

    sub validate {
        $value = $_[0];
        Validator::validate((scalar $value <= $length), $message);
    }
    
}
1;