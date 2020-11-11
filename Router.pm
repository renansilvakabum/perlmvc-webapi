package Router;
{
    require "./lib/System/Routes.pm";
    use Routes;
    use JSON;
    my $_routes = Routes->new;

    sub new {
        return bless {};
    }

    $_routes->registerRoute("POST", "/v1/customer", "CustomerController", "postCustomer", 0, "");
    $_routes->registerRoute("GET", "/v1/customer", "CustomerController", "getCustomers", 0, "");
    $_routes->registerRoute("GET", "/v1/user/authenticate", "UserController", "authenticate", 0, "");

    sub getRoute {
        my ($self, $uri, $verb) = @_;           

        if($_routes->getRoutes($verb) eq undef){
            return undef;
        } 

        return $_routes->getRoutes($verb)->{$uri};
    }

}