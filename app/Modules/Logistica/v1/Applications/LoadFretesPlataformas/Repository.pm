package Repository;
{

    use DB::MySQL;

    $mysql = DB::MySQL->new('write');

    sub loadAllPlataformas {                                

        my $sql = qq~
            SELECT l.codigo as plataforma_codigo, l.nome as plataforma_nome
            FROM gk_lojas l
            WHERE l.ativo = 1 order by l.nome asc
        ~;
        
        my $conexaor = $mysql->connect();

        try {
            my $query = $conexaor->prepare($sql);
            $query->execute();   

            my $result = $query->fetchall_arrayref({});     

            $query->finish();
            $mysql->disconnect();
                        
            return $result;

        } catch {        
            $conexaor->rollback;
            
            $mysql->disconnect();

            die "Error: $_";            
        };

    }

    sub loadAllFretesPlataformas {                                

        my ($IdPlataforma) = @_;

        my $sql = qq~
            SELECT DISTINCT f.codigo as frete_codigo, f.frete_nome, if(fl.codigo_loja > 0, 1, 0) as status
            FROM kb_frete f
            LEFT JOIN gk_lojas_has_kb_frete fl ON f.codigo = fl.codigo_frete and fl.codigo_loja = ?
            WHERE f.ativo = 1 order by f.frete_nome asc
        ~;
        
        my $conexaor = $mysql->connect();

        try {
            my $query = $conexaor->prepare($sql);
            $query->execute($IdPlataforma);   

            my $result = $query->fetchall_arrayref({});     

            $query->finish();
            $mysql->disconnect();
                        
            return $result;

        } catch {        
            $conexaor->rollback;
            
            $mysql->disconnect();

            die "Error: $_";            
        };

    }
}
1;