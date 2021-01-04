package AuthenticateMiddleware;
{

    BEGIN{            
        push @INC, $ENV{'HTTP_BASEAPP'}."/GLOBAL/cgi-local/module/Services/";            
    }
    
    use StatusCodeForbidden;
    use JSON;
    use Routes;
    use CGI::Cookie;
    $cgi = new CGI;

    sub new {
        my ($self, $route, $token, $params, $config) = @_;   

        return bless {"_route" => $route};
    }

    sub execute {
        $self = $_[0];
        
        if($self->{_route}{"Private"} == 1){                        
            
            $manager_usuario = $cgi->cookie("manager_usuario");
            
            if($manager_usuario eq undef){
                
                use StatusCodeForbidden;

                StatusCodeForbidden::response "Session is invalid!";
                die;
                
            }

        }
    }
}
1;