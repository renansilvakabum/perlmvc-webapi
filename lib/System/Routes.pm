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

    sub hasPermission {
        
        my ($route, $role) = @_;

        if($route->{Role} == undef){            
            return 1;
        }               

        for(@{$route->{Role}}){            
            if($_ eq $role){
                return 1;
            }
        }        
        
        return 0;
    }
}
1;