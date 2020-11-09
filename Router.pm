package Router;
{
    my %routes = (
        "GetCustomers" => {"Package" => "CustomerController", "Sub" => "GetCustomers"}
    );

    sub getRoutes{
        return %routes;
    }
}