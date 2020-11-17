package Model;
{    
    use JSON::PP;
    use JSON;
    use StringUtils;
    use Data::Dumper;

    sub new {
        return bless {"_attributes" => undef, "_validates" => undef, "_values" => undef};
    }

    sub setAttribute {
        my ($self, $attribute, $validate) = @_;

        $self->{_attributes}{$attribute} = 1;
        $self->{_values}{$attribute} = undef;
        $self->{_validates}{$attribute} = $validate;
    }

    sub setValues {      
        my ($self, $values) = @_;           
        
        foreach my $key (keys $values){            
            if($self->{_attributes}{$key} == 1){
                $self->set($key, $values->{$key});                                                 
            }
        }             
    }

    sub set {
        my ($self, $attribute, $value) = @_;        
        $self->{_values}{$attribute} = $value;
    }

    sub get {
        my ($self, $attribute) = @_;
        return $self->{_values}{$attribute};
    }

    sub getValues {        
        my ($self) = @_;
        return $self->{_values};
    }

    sub validate {
        $self = $_[0];

        foreach my $key (keys $self->{_values}){
            if($self->{_attributes}{$key} == 1) {
                $messageValidator = $self->validateValue($key);
                if(StringUtils::trim($messageValidator) ne ""){                                    
                    $messageValidators = $messageValidators . $messageValidator . ", ";                       
                }                                 
            }
        }    

        if($messageValidators ne ""){        
            $messageValidators = substr($messageValidators, 0, (length $messageValidators) - 2 );

            @messageValidators = split /,/, $messageValidators;

            return JSON->new->allow_nonref->encode([@messageValidators]);            
        }        

    }

    sub validateValue {
        my ($self, $attribute) = @_;        

        if($self->{_validates}{$attribute} eq undef){
            return "";
        }      

        my $messageValidators = "";
        if($self->{_validates}{$attribute} != undef){
                
            for(@{$self->{_validates}{$attribute}}) {
                
                if($_ != undef){
                    
                    my $messageValidator = $_->validate($self->{_values}{$attribute});
                    
                    if(StringUtils::trim($messageValidator) ne ""){
                                        
                        $messageValidators = $messageValidators . $messageValidator . ", ";   
                     
                    }   
                }

            }
            $messageValidators = substr($messageValidators, 0, (length $messageValidators) - 2 );

        }                
                
        return $messageValidators;
    }
}
1;