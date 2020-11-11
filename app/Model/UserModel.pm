package UserModel;
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
    $model->setAttribute("login", [RequiredValidator->new("Field Login is Required!"), 
                                    MaxValidator->new("Maxlength of Login is 30 caracters!", 30)]);  
    $model->setAttribute("pass", [RequiredValidator->new("Field Pass is Required!"), 
                                    MaxValidator->new("Maxlength of Pass is 30 caracters!", 30)]);                                    
    $model->setAttribute("excluded");
        
    sub new {
        return bless {};
    }

    sub setValues {
        $values = $_[1];       
        $model->setValues($values);
    }

    sub getValue {
        $attribute = $_[1];
        return $model->getValue($attribute);
    }

    sub validate {
        $model->validate();
    }

}
1;