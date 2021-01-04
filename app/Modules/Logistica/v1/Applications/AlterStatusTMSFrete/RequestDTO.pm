package RequestDTO;
{
    use RequiredValidator;
    use MaxValidator;
    use MinValidator;
    use IntegerValidator;
    use Model;
    use Data::Dumper;
    use JSON;    
        
    sub new {

        $model = Model->new;    
        $model->setAttribute("IdFrete", [RequiredValidator->new("Campo 'IdFrete' é obrigatório!"), 
                                                    IntegerValidator->new("Campo 'IdFrete' deve receber um valor do tipo inteiro!")
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