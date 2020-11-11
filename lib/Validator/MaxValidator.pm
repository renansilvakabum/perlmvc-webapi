package MaxValidator;
{
    use Validator;
    my $length;
    my $message;

    sub new {
        return bless {};
    }

    sub setParameters {
        my ($self, $message, $length) = @_;
        return $self;
    }

    sub validate {
        $value = $_[0];
        return Validator->new->validate((scalar $value <= $length), $message);
    }
    
}
1;