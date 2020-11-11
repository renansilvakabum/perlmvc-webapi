package Auth;
{
    require "./../../app/Config/ApplicationConfig.pm";
    use WebToken;
    use ApplicationConfig;

    sub generateToken {
        my ($user, $username, $userid, $usermail) = @_;

        my $claims = {
            userid   => $userid,
            user     => $user,
            username => $username,
            usermail => $usermail,
            exp => 1300819380            
        };
        my $secret = ApplicationConfig::get;

        return encode_jwt $claims, $secret;
    }

    sub decodeToken {
        my $token = $_[0];
        my $secret = ApplicationConfig::get;

        return $token, $secret;
    }
}