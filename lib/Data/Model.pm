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

        my $values = $_[1];
        $messageValidators = "";        
        foreach my $key (keys $values){
            if(exists($_attributes[$key])){
                $messageValidator = setValue($key, $values[$key], 0);
                $messageValidators .=  $messageValidator ne "" ? ", " : "";                
            }
        }    
        if($messageValidators ne ""){        
            $messageValidators = substr($messageValidators, 0, (scalar $messageValidators) - 2 );
            die $messageValidators;
        }

    }

    sub setValue {
        my ( $attribute, $value, $throwException) = @_;
        $_values{$attribute} = $value;
        print "Content-Type: text/html \n\n";
        print $attribute;
        $message = validate($attribute);

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
        print "Content-Type: text/html \n\n";
        print $attribute;
        print $_validates{$attribute};
        exit;
        if($_validates{$attribute} eq undef){
            return "";
        }
        die;
        return $_validates{$attribute}->validate($_values{$attribute});
    }
}
1;