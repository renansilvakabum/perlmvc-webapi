package UserService;
{
    use UserRepository;
    use Auth;
    use StatusCodeOK;

    sub authenticate {     
        my ($user, $username, $userid, $role, $usermail) = @_; 
        
        return Auth::generateToken($user, $username,$userid, $role,$usermail);
    }

    sub tokenValidate {
        my ($token) = @_;

        $claims = Auth::decodeToken($token);

        if($claims eq undef){
            return undef;
        }

        if($claims->{"exp"} <= time){
            return undef;
        }
        
        return $claims;
    }

    sub loadUser {
        my ($user, $pass) = @_; 

        return UserRepository::loadUser($user, $pass);
    }
}
1;