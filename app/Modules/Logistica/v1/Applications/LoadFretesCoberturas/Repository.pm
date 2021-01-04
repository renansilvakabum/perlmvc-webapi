package Repository;
{

    use DB::MySQL;

    $mysql = DB::MySQL->new('write');

    sub loadAll {                                

        my $sql = qq~
            SELECT f.codigo as frete_codigo, fc.ativo as status, f.frete_nome, fc.codigo as frete_cobertura_codigo, fc.estado, 
            fc.cep_inicio, fc.cep_fim, fc.prazo_min, fc.prazo_max 
            FROM kb_frete_cobertura fc
            INNER JOIN kb_frete f ON f.codigo = fc.frete_codigo
            WHERE f.ativo = 1 order by fc.cep_inicio, fc.cep_fim asc
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