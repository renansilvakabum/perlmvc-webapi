package Router;
{
    my %routes = (
        "GetCustomers" => {"Package" => "CustomerController", "Sub" => "GetCustomers"},
        "PostCustomers" => {"Package" => "CustomerController", "Sub" => "PostCustomers"}
    );

    sub getRoutes{
        return %routes;
    }
}