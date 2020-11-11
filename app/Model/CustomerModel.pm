package CustomerModel;
{
    use RequiredValidator;
    use MaxValidator;
    use Model;
    use Data::Dumper;
    use JSON;
    
    $model = Model->new;    

    $model->setAttribute("id");
    $model->setAttribute("name", [RequiredValidator->new("Field Name is Required!"), 
                                    MaxValidator->new("Maxlength of name is 30 caracters!", 30)]);
    $model->setAttribute("mail", [RequiredValidator->new("Field Mail is Required!"), 
                                    MaxValidator->new("Maxlength of Mail is 30 caracters!", 30)]);
    $model->setAttribute("excluded");
        
    sub new {
        return bless {};
    }

    sub setValues {
        $values = $_[1];       
        $model->setValues($values);
    }

    sub validate {
        $model->validate();
    }

}
1;