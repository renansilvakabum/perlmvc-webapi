package Repository;
{

    use DB::MySQL;

    $mysql = DB::MySQL->new('write');
    
    sub store {
        my ($model) = @_;

        my $sql = qq~
            INSERT INTO gk_lojas_has_kb_frete (codigo_loja, codigo_frete) VALUES
            (?, ?)
        ~;
        
        my $conexaor = $mysql->connect();

        try {

            my $query = $conexaor->prepare($sql);
            $query->execute($model->getValue("IdPlataforma"), $model->getValue("IdFrete"));            

            $query->finish();
            $mysql->disconnect();

            return 1;

        } catch {        
            $conexaor->rollback;
            
            $mysql->disconnect();

            die "Error: $_";            
        };
    }

    sub delete {
        my ($model) = @_;

        my $sql = qq~
            DELETE FROM gk_lojas_has_kb_frete WHERE codigo_loja = ? AND codigo_frete = ?
        ~;
        
        my $conexaor = $mysql->connect();

        try {
            
            my $query = $conexaor->prepare($sql);
            $query->execute($model->getValue("IdPlataforma"), $model->getValue("IdFrete"));            

            $query->finish();
            $mysql->disconnect();

            return 1;

        } catch {        
            $conexaor->rollback;
            
            $mysql->disconnect();

            die "Error: $_";            
        };

    }

    sub freteExists {
        my ($id) = @_;

        my $sql = qq~
            SELECT COUNT(0) AS COUNT FROM kb_frete WHERE codigo = ?
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

    sub plataformaExists {
        my ($id) = @_;

        my $sql = qq~
            SELECT COUNT(0) AS COUNT FROM gk_lojas WHERE ativo = 1 AND codigo = ?
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