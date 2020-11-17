package UserController;
{    

    use StatusCodeOK;
    use StatusCodeNotFound;
    use StatusCodeBadRequest;
    use StatusCodeCreated;
    use JSON;
    use Try::Tiny;
    use UserService;
    use UserAuthenticateDTO;

    sub new {
        my $self = {};
        return bless $self;
    }

    sub authenticate {        

        $param = @_[1];
        
        try {                    
            
            $userDTO = UserAuthenticateDTO->new;
            $userDTO->setValues($param);
            $message = $userDTO->validate;
            
            if($message ne ""){
                StatusCodeBadRequest::response $message;
                exit;
            }

            $user = UserService::loadUser($userDTO->getValue("user"), $userDTO->getValue("pass"));
            
            if($user eq undef){
                StatusCodeNotFound::response "User not found!";
                exit;
            }

            my $token = UserService::authenticate(
                $user->getValue("user"), $user->getValue("name"), $user->getValue("id"), 
                    $user->getValue("role"), $user->getValue("mail"));                                                        

            StatusCodeOK::response $token;


        } catch {

            StatusCodeBadRequest::response $_;
            
        }

    }

    sub tokenrefresh {        

        $param = @_[1];
        
        try {                                         

            my $token = UserService::authenticate(
                $param->{"_userdata"}{"user"}, $param->{"_userdata"}{"username"}, $param->{"_userdata"}{"userid"}, 
                    $param->{"_userdata"}{"role"}, $param->{"_userdata"}{"usermail"});                                            
        
            StatusCodeOK::response $token;


        } catch {

            StatusCodeBadRequest::response $_;
            
        }

    }

}
1;