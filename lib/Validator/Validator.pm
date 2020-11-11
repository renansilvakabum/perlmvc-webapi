package Validator;
{
    sub new {
        return bless {};
    }

    sub validate {
        my ($self, $condition, $message) = @_; 
        
        if(!$condition)
        {
            return $message;
        }
        
        return "";
    }
}
1;