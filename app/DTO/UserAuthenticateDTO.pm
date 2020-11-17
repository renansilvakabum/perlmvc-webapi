package UserAuthenticateDTO;
{
    use RequiredValidator;
    use MaxValidator;
    use Model;
    use Data::Dumper;
    use JSON;    
        
    sub new {        

        $model = Model->new;          
        $model->setAttribute("user", [RequiredValidator->new("Field 'user' is Required!"), 
                                        MaxValidator->new("Maxlength of 'user' is 30 caracters!", 30)]);
        $model->setAttribute("pass", [RequiredValidator->new("Field 'pass' is Required!"), 
                                        MaxValidator->new("Maxlength of 'pass' is 10 caracters!", 10)]);     
        return bless {"model" => $model};
    }

    sub setValues {
        my ($self, $values) = @_;       
        $self->{model}->setValues($values);
    }

    sub getValue {
        my ($self, $attribute) = @_;
        return $self->{model}->get($attribute);
    }

    sub validate {
        my ($self) = @_;
        return $self->{model}->validate();
    }

}
1;