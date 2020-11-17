package MinValidator;
{
    use Validator;

    sub new {
        my ($self, $message, $length) = @_;

        return bless {"_message" => $message, "_length" => $length};
    }

    sub validate {
        my ($self, $value) = @_;

        return Validator->new->validate(((length $value) > $self->{_length}), $self->{_message});
    }
    
}
1;