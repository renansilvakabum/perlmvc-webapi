package CustomerModel
{
    use Model;
    $model = Model->new;

    BEGIN {
        $model->setAttribute "id";
        $model->setAttribute "name" {RequiredValidator->new->setParameters("Field Name is Required!"), 
                                        MaxValidator->new->setParameters("Maxlength of name is 30 caracters!", 30)};
        $model->setAttribute "mail" {RequiredValidator->new->setParameters("Field Mail is Required!"), 
                                        MaxValidator->new->setParameters("Maxlength of Mail is 30 caracters!", 30)};
        $model->setAttribute "excluded";
    }    
}