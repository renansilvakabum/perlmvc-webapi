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
    use CustomerPostDTO;

    sub new {
        my $self = {};
        return bless $self;
    }

    sub postCustomer {

        my ($self, $param) = @_;
        my $customer = CustomerPostDTO->new;
        
        try {                    

            $customer->setValues($param);
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