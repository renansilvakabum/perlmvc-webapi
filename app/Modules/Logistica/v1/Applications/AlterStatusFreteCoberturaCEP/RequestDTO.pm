package RequestDTO;
{
    use RequiredValidator;
    use MaxValidator;
    use MinValidator;
    use Model;
    use Data::Dumper;
    use IntegerValidator;
    use JSON;    
        
    sub new {

        $model = Model->new;    
        $model->setAttribute("IdFreteCobertura", [RequiredValidator->new("Campo 'IdFreteCobertura' é obrigatório!"), 
                                                    IntegerValidator->new("Campo 'IdFreteCobertura' deve receber um valor do tipo inteiro!")
                                        ]); 
        $model->setAttribute("Ativo", [RequiredValidator->new("Campo 'Ativo' é obrigatório!"), 
                                                    IntegerValidator->new("Campo 'Ativo' deve receber um valor do tipo inteiro!")
                                        ]);        

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