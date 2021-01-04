package RequestDTO;
{
    use RequiredValidator;
    use MaxValidator;
    use MinValidator;
    use Model;
    use Data::Dumper;
    use JSON;    
        
    sub new {

        $model = Model->new;    
        $model->setAttribute("name", [RequiredValidator->new("Field 'name' is Required!"), 
                                        MinValidator->new("Minlength of 'name' is 4 caracters!", 4),
                                            MaxValidator->new("Maxlength of 'name' is 30 caracters!", 30)
                                        ]);
        $model->setAttribute("mail", [RequiredValidator->new("Field 'mail' is Required!"), 
                                MinValidator->new("Minlength of 'mail' is 5 caracters!", 5),
                                        MaxValidator->new("Maxlength of 'mail' is 30 caracters!", 30)]);

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