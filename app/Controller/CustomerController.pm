package CustomerController;
{    

    use StatusCodeOK;
    use StatusCodeNotFound;
    use StatusCodeBadRequest;
    use StatusCodeCreated;
    use JSON;
    use Try::Tiny;
    use CustomerService;
    use CustomerModel;

    sub new {
        my $self = {};
        return bless $self;
    }

    sub postCustomer {
        try {
            my $customer = CustomerModel->new;
            $customer->setValues({"name" => "2f", "mail" => ""});
            $message = $customer->validate;
            
            if($message ne ""){
                StatusCodeBadRequest::response $message;
                exit;
            }

            StatusCodeCreated::response;

        } catch {
            StatusCodeBadRequest::response $_;
        }
    }

    sub getCustomers {        
        my $customers = CustomerService::loadCustomers;
        
        if(length $customers > 0){
            StatusCodeOK::response encode_json $customers;
        }else{
            StatusCodeNotFound::response;
        }

    }

}
1;