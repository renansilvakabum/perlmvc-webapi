package UserModel;
{
    use RequiredValidator;
    use MaxValidator;
    use Model;
    use Data::Dumper;
    use JSON;    
        
    sub new {

        $model = Model->new;
        $model->setAttribute("id");    
        $model->setAttribute("name", [RequiredValidator->new("Field Name is Required!"), 
                                        MaxValidator->new("Maxlength of name is 30 caracters!", 30)]);
        $model->setAttribute("user", [RequiredValidator->new("Field User is Required!"), 
                                        MaxValidator->new("Maxlength of name is 30 caracters!", 30)]);                                    
        $model->setAttribute("mail", [RequiredValidator->new("Field Mail is Required!")]);
        $model->setAttribute("pass", [RequiredValidator->new("Field Password is Required!"), 
                                        MaxValidator->new("Maxlength of Password is 10 caracters!", 10)]);
        $model->setAttribute("role", [RequiredValidator->new("Field Role is Required!"), 
                                        MaxValidator->new("Maxlength of Role is 30 caracters!", 10)]);                                    
        $model->setAttribute("excluded");

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

    sub getValues {
        my ($self) = @_;
        return $self->{model}->getValues();
    }

    sub validate {
        my ($self) = @_;
        return $self->{model}->validate();
    }

}
1;