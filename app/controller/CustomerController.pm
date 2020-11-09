package CustomerController;
{    
    use StatusCodeOK;
    use StatusCodeNotFound;
    use JSON;

    sub new{
        my $self = {};
        return bless $self;
    }

    sub GetCustomers{
        StatusCodeNotFound::response '{"error":"Class not found!"}';
    }
}
1;