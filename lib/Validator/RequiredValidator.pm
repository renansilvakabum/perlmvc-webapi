package RequiredValidator;
{
    use Validator;
    my $message;

    sub new {
        return bless {};
    }

    sub setParameters {
        my ($self, $message) = @_;
        
        return $self;
    }

    sub validate {
        my ($self, $value) = @_;
        return Validator->new->validate($value ne undef || $value > 0, $message);
    }
    
}
1;