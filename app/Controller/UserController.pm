package UserController;
{    

    use StatusCodeOK;
    use StatusCodeNotFound;
    use StatusCodeBadRequest;
    use StatusCodeCreated;
    use JSON;
    use Try::Tiny;
    use UserService;

    sub new {
        my $self = {};
        return bless $self;
    }

    sub authenticate {        

        my $token = UserService::authenticate;
        
        StatusCodeOK::response $token;

    }

}
1;