package Router;
{
    require "./lib/System/Routes.pm";
    use Routes;
    use JSON;
    my $_routes = Routes->new;

    #register the routes here
    $_routes->registerRoute("POST", "/v1/customer", "CustomerController", "postCustomer", 1, ["Admin", "Customer"]);
    $_routes->registerRoute("GET", "/v1/customer", "CustomerController", "getCustomers", 0, undef);
    $_routes->registerRoute("GET", "/v1/user/authenticate", "UserController", "authenticate", 0, undef);
    $_routes->registerRoute("GET", "/v1/user/tokenrefresh", "UserController", "tokenrefresh", 1, undef);
    #####
    
    sub new {
        return bless {};
    }    

    sub getRoute {
        my ($self, $uri, $verb) = @_;           

        if($_routes->getRoutes($verb) eq undef){
            return undef;
        } 

        return $_routes->getRoutes($verb)->{$uri};
    }

}