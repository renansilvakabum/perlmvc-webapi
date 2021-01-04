package IntegerValidator;
{
    use Validator;    
    use Try::Tiny;
    sub new {
        my ($self, $message) = @_;      

        return bless {"_message" => $message};
    }

    sub getMessage {
        my $self = shift;

        return $self->{message};
    }

    sub validate {
        my ($self, $value) = @_;

        try {
            my $test = $value * 1;
            return "";
        }catch{
            return $self->{_message};
        }
        
    }
    
}
1;