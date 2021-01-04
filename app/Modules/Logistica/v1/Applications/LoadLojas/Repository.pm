package Repository;
{

    use DB::MySQL;

    $mysql = DB::MySQL->new('write');

    sub loadAll {                                

        my $sql = qq~
            SELECT l.codigo, l.nome
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
}
1;