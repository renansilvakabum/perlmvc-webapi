package Validator;
{
    sub validate {
        my ($condition, $message) = @_; 

        if(!$condition)
        {
            return $message;
        }
    }
}