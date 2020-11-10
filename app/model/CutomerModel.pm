package CustomerModel
{
    use Model;
    $model = Model->new;

    BEGIN {
        $model->setAttribute "id" {};
        $model->setAttribute "name";
        $model->setAttribute "mail";
        $model->setAttribute "excluded";
    }    
}