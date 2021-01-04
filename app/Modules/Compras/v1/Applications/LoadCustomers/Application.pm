package Application;
{
    use Repository;
    use RequestDTO;
    use StatusCodeNotFound;
    use StatusCodeOK;
    use JSON;

    sub new {
        return bless {};
    }

    sub execute {

        my $customers = Repository::loadCustomers;
        
        if(length $customers > 0){

            StatusCodeOK::response encode_json $customers;

        }else{

            StatusCodeNotFound::response;
            
        }

    }
}
1;