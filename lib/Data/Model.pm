package Model;
{    
    use JSON;
    my @_attributes = undef;
    my @_validates = undef;
    my %_values = undef;

    sub new {
        return bless {};
    }

    sub setAttribute {
        my ($self, $attribute, $validate) = @_;
        $_values{$attribute} = undef;
        $_validates{$attribute} = $validate;
    }

    sub setValues {
        my ($self, $values) = @_;        
        $messageValidators = "";        
        foreach my $key (keys $values){
            if(exists($_attributes[$key])){
                $messageValidator = $self->setValue($key, $values[$key], 0);
                $messageValidators .=  $messageValidator ne "" ? ", " : "";                
                print $messageValidator;
            }
        }    
        if($messageValidators ne ""){        
            $messageValidators = substr($messageValidators, 0, (scalar $messageValidators) - 2 );
            die $messageValidators;
        }
        
    }

    sub setValue {
        my ($self, $attribute, $value, $throwException) = @_;
        $_values{$attribute} = $value;
        
        $message = $self->validate($attribute);
        
        if($message ne "" && $throwException){
            die($message);
        }

        return $message;
    }

    sub set {
        my ($self, $attribute, $value) = @_;
        $_values{$attribute} = $value;
    }

    sub get {
        my ($self, $attribute) = @_;
        return $_values{$attribute};
    }

    sub getValues {
        return $_values;
    }

    sub validate {
        my ($self, $attribute) = @_;        
        if($_validates{$attribute} eq undef){
            return "";
        }      

        my $messageValidators = "";
        if($_validates{$attribute} != undef){

            for(@{$_validates{$attribute}}) {

                if($_validates{$attribute}->[$i] != undef){
                    my $messageValidator = $_->validate($_values{$attribute}, 0);
                    $messageValidators .=  $messageValidator ne "" ? ", " : "";      
                }

            }

        }                
        print "Content-Type: text/html \n\n";
        print $messageValidator;
        return $messageValidator;
    }
}
1;