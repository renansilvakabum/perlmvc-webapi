package MaxValidator;
{
    use Validator;

    sub new {
        my ($self, $message, $length) = @_;

        $_length = $length;
        $_message = $message;

        return bless {"_message" => $message, "_length" => $length};
    }

    sub validate {
        my ($self, $value) = @_;

        return Validator->new->validate((scalar $value <= $self->{_length}), $self->{_message});
    }
    
}
1;