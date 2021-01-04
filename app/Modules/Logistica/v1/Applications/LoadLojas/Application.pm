package Application;
{
    
    use StatusCodeOK;
    use StatusCodeBadRequest;
    use Repository;    
    use Try::Tiny;
    use JSON;

    sub new {
        return bless {};
    }

    sub execute {
        
        try {                                         

            StatusCodeOK::response encode_json Repository::loadAll;


        } catch {

            StatusCodeBadRequest::response $_;
            
        }

    }
}
1;