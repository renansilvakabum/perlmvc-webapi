package MinValidator;
{
    use Validator;
    my $_length;
    my $_message;

    sub new {
        my ( $self, $message, $length) = @_;

        $_length = $length;
        $_message = $message;

        return bless {};
    }

    sub validate {
        my ($self, $value) = @_;
        return Validator->new->validatevalidate((scalar $value >= $_length), $_message) ;
    }
    
}