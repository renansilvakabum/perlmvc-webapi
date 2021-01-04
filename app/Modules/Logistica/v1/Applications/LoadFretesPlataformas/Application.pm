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

            my $payload = Repository::loadAllPlataformas;

            foreach my $key (keys $payload) {

                $payload->[$key]->{"plataforma_fretes"} = Repository::loadAllFretesPlataformas($payload->[$key]->{"plataforma_codigo"});
                
            }

            StatusCodeOK::response encode_json $payload;

        } catch {

            StatusCodeBadRequest::response $_;
            
        }

    }
}
1;