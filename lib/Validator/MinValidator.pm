package MinValidator;
{
    use Validator;

    sub new {
        my ( $self, $message, $length) = @_;

        return bless {"_length" => $length, "_message" => $message};
    }

    sub validate {
        my ($self, $value) = @_;
        return Validator->new->validatevalidate((scalar $value >= $self->{_length}), $self->{_message}) ;
    }
    
}