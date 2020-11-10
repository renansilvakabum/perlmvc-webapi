package CustomerController;
{    

    use StatusCodeOK;
    use StatusCodeNotFound;
    use JSON;
    use CustomerService;
    use CustomerModel;

    sub new {
        my $self = {};
        return bless $self;
    }

    sub GetCustomers {
        my $customer = CustomerModel->new;
        $customer->setValues({"name" => "", "mail" => ""});

        StatusCodeOK::response;
    }

    sub GetC2ustomers {        
        my $customers = CustomerService::loadCustomers;
        
        if(length $customers > 0){
            StatusCodeOK::response encode_json $customers;
        }else{
            StatusCodeNotFound::response;
        }

    }

}
1;