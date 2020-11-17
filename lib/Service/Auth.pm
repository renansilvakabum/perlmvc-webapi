package Auth;
{
    #autoload
    BEGIN{    
        push @INC, "./../JSON/";
    }
    #--autoload
    use Encode qw(decode encode);
    use JSON::WebToken;
    use ApplicationConfig;
    use Try::Tiny;
    use JSON;

    sub generateToken {
        my ($user, $username, $userid, $role, $usermail) = @_;

        my $claims = {
            userid   => $userid,
            role => $role,
            user     => $user,
            username => $username,
            usermail => $usermail,
            exp => time + (3*3600)             
        };

        my $secret = ApplicationConfig::get;

        return encode_jwt $claims, $secret;
    }

    sub decodeToken {
        my $token = $_[0];
        my $secret = ApplicationConfig::get;
        
        eval {
            my $decoded = decode_jwt $token, $secret;
            return  $decoded;
        } or do {
            my $e = $@;
            return undef;
        }        
    }
}
1;