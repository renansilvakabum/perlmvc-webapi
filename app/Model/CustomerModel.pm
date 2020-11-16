package CustomerModel;
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
        $model->setAttribute("mail", [RequiredValidator->new("Field Mail is Required!"), 
                                        MaxValidator->new("Maxlength of Mail is 30 caracters!", 30)]);
        $model->setAttribute("excluded");

        return bless {"model" => $model};
    }

    sub setValues {
        my ($self, $values) = @_;       
        $self->{model}->setValues($values);
    }

    sub getValue {
        my ($self, $attribute) = @_;
        return $self->{model}->getValue($attribute);
    }

    sub validate {
        my ($self) = @_;
        return $self->{model}->validate();
    }

}
1;