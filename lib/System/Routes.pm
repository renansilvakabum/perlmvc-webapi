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
        my ($self, $verb, $uri, $module, $version, $application, $private) = @_;
        ${$verb."routes"}->{$uri} = {"Module" => $module, "Version" => $version, "Application" => $application, "Private" => $private};
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