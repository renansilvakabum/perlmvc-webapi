package AuthenticateMiddleware;
{
    use UserService;
    use StatusCodeForbidden;
    use StatusCodeUnauthorized;
    use JSON;
    use Routes;

    sub new {
        my ($self, $route, $token, $params) = @_;   

        return bless {"_route" => $route, "_token" => $token, "_params" => $params};
    }

    sub execute {
        $self = $_[0];
        
        if($self->{_route}{"Private"} == 1){
            
            $userdata = UserService::tokenValidate($self->{_token});
            
            if($userdata eq undef){
                use StatusCodeForbidden;

                StatusCodeForbidden::response "Token is invalid!";
                die;
            }

            if(!Routes::hasPermission($self->{_route}, $userdata->{role})){

                use StatusCodeUnauthorized;
                
                StatusCodeUnauthorized::response "Permission is not valid!";
                die;

            }

            ${$self->{_params}}->{"_userdata"} = $userdata;

        }
    }
}
1;