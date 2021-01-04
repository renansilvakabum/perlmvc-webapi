package Repository;
{

    use DB::MySQL;

    $mysql = DB::MySQL->new('write');

    sub loadAll {                                

        my $sql = qq~
            SELECT codigo, frete_nome, ativo as status, tms as status_tms FROM kb_frete ORDER BY frete_nome
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