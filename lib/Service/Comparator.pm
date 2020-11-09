package Comparator;
{
    use Try::Tiny;
    use JSON;
    
    sub new{
        return bless {};
    }

    sub isJson {
        
        $json = $_[0];      
          
        try {            
            decode_json $json;
            return 1;
        }   
        catch {
            return 0;
        };

    }
}
1;