package Application;
{
    
    use StatusCodeOK;
    use StatusCodeNotFound;
    use StatusCodeBadRequest;
    use StatusCodeCreated;
    use Repository;
    use RequestDTO;    
    use JSON;

    sub new {
        return bless {};
    }

    sub execute {

        my ($param) = @_;
        my $customer = CustomerPostDTO->new;
        
        try {                    

            $customer->setValues($param);
            $message = $customer->validate;
            
            if($message ne ""){
                StatusCodeBadRequest::response $message;
                exit;
            }

            StatusCodeCreated::response CustomerRepository::store;

        } catch {

            StatusCodeBadRequest::response $_;
            
        }

    }
}