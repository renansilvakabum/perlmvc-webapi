package Routes;
{
    my $POSTroutes = {};
    my $GETroutes = {};    
    my $PUTroutes = {};
    my $DELETEroutes = {};

    sub new {
        return bless {};
    }

    sub getRoutes {
        my ($self, $verb) = @_;
        return ${$verb."routes"};
    }

    sub registerRoute {
        my ($self, $verb, $uri, $package, $sub, $private, $role) = @_;
        ${$verb."routes"}->{$uri} = {"Package" => $package, "Sub" => $sub, "Private" => $private, "Role" => $role};
    }
}
1;