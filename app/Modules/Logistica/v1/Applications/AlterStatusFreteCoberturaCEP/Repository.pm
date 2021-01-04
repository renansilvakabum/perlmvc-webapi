package Repository;
{

    use DB::MySQL;

    $mysql = DB::MySQL->new('write');
    
    sub store {
        my ($model) = @_;

        my $sql = qq~
            UPDATE kb_frete_cobertura SET ativo = ? where codigo = ?
        ~;
        
        my $conexaor = $mysql->connect();

        try {
            my $query = $conexaor->prepare($sql);
            $query->execute($model->getValue("Ativo"), $model->getValue("IdFreteCobertura"));            

            $query->finish();
            $mysql->disconnect();

            return 1;

        } catch {        
            $conexaor->rollback;
            
            $mysql->disconnect();

            die "Error: $_";            
        };
    }

    sub freteCoberturaExists {
        my ($id) = @_;

        my $sql = qq~
            SELECT COUNT(0) AS COUNT FROM kb_frete_cobertura WHERE codigo = ?
        ~;
        
        my $conexaor = $mysql->connect();

        try {
            my $query = $conexaor->prepare($sql);
            $query->execute($id);   

            my $result = $query->fetchrow_hashref();     

            $query->finish();
            $mysql->disconnect();
                        
            return $result->{"COUNT"};

        } catch {        
            $conexaor->rollback;
            
            $mysql->disconnect();

            die "Error: $_";            
        };
    }

}
1;