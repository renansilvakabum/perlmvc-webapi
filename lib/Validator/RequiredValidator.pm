package RequiredValidator;
{
    use Validator;
    my $_message;

    sub new {
        my ($self, $message) = @_;        

        $_message = $message;

        return bless {};
    }

    sub validate {
        my ($self, $value) = @_;
        return Validator->new->validate($value ne undef || $value > 0, $_message);
    }
    
}
1;