package CustomerService;
{
    use CustomerRepository;
    use Auth;

    sub authenticate {        
        return Auth::generateToken("user","pass","1","user\@kabum.com.br");
    }

1;