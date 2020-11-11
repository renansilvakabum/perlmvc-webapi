package Model;
{    
    use JSON::PP;
    use JSON;
    use StringUtils;
    use Data::Dumper;

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
        foreach my $key (keys $values){
            if(exists($_attributes[$key])){
                $self->set($key, $values->{$key});                                                 
            }
        }                     
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
        $self = $_[0];

        foreach my $key (keys %_values){
            if(exists($_attributes[$key])) {
                $messageValidator = $self->validateValue($key);
                if(StringUtils::trim($messageValidator) ne ""){                                    
                    $messageValidators = $messageValidators . $messageValidator . ", ";                       
                }                                 
            }
        }    

        if($messageValidators ne ""){        
            $messageValidators = substr($messageValidators, 0, (scalar $messageValidators) - 2 );

            @messageValidators = split /,/, $messageValidators;

            return JSON->new->allow_nonref->encode([@messageValidators]);            
        }        

    }

    sub validateValue {
        my ($self, $attribute) = @_;        
        
        if($_validates{$attribute} eq undef){
            return "";
        }      

        my $messageValidators = "";
        if($_validates{$attribute} != undef){
                
            for(@{$_validates{$attribute}}) {
                
                if($_validates{$attribute}->[$i] != undef){
                    
                    my $messageValidator = $_->validate($_values{$attribute});
                    
                    if(StringUtils::trim($messageValidator) ne ""){
                                        
                        $messageValidators = $messageValidators . $messageValidator . ", ";   
                     
                    }   
                }

            }
            $messageValidators = substr($messageValidators, 0, (scalar $messageValidators) - 2 );

        }                
                
        return $messageValidators;
    }
}
1;