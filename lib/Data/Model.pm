package Model;
{
    our @_attributes = undef;
    our @_validates = undef;
    our %_values = undef;

    sub new {
        return bless {};
    }

    sub setAttribute {
        my ($attribute, $validate) = @_;
        $_values{$attribute} = undef;
        $_validates{$attribute} = $validate;
    }

    sub setValues {

        my %_values = $_;
        $messageValidators = "";

        foreach my $key (keys $_values){
            if(exists($_attributes[$key])){
                $messageValidators .= setValue($key, $_values[$key], 0) . ", ";
            }
        }    

        if($messageValidators ne ""){        
            $messageValidators = substr($messageValidators, 0, (scalar $messageValidators) - 2 );
            die($messageValidators);
        }

    }

    sub setValue {
        my ($attribute, $value, $throwException) = @_;
        $_values{$attribute} = $value;
        
        $message = _validate $attribute;

        if($message ne "" && $throwException){
            die($message);
        }

        return $message;
    }

    sub set {
        my ($attribute, $value) = @_;
        $_values{$attribute} = $value;
    }

    sub get {
        my ($attribute) = @_;
        return $_values{$attribute};
    }

    sub _validate {
        my ($attribute) = @_;
        return $_validates{$attribute}->validate();
    }
}