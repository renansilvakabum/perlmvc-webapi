package Application;
{
    
    use StatusCodeOK;
    use StatusCodeNotFound;
    use StatusCodeBadRequest;
    use Repository;    
    use RequestDTO;
    use Try::Tiny;

    sub new {
        return bless {};
    }

    sub execute {
        my ($self, $param) = @_;
        my $request = RequestDTO->new;
        
        try {                    
            
            $request->setValues($param);
            my $message = $request->validate;
            
            if($message ne ""){
                StatusCodeBadRequest::response($message);
                exit;
            }

            if(!($request->getValue("Ativo") eq "1" || $request->getValue("Ativo") eq "0")){
                StatusCodeBadRequest::response("Campo 'Ativo' deve conter 1 ou 0!");
                exit;
            }

            if(!Repository::freteExists($request->getValue("IdFrete"))){
                StatusCodeNotFound::response("Frete n�o encontrado!");
                exit;
            } 

            if(!Repository::plataformaExists($request->getValue("IdPlataforma"))){
                StatusCodeNotFound::response("Plataforma n�o encontrada!");
                exit;
            }            
            
            Repository::delete($request);

            if($request->getValue("Ativo"))
            {
                Repository::store($request);
            }

            StatusCodeOK::response;

        } catch {

            StatusCodeBadRequest::response $_;
            
        }
        

    }
}
1;