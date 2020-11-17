package UserRepository;
{
    use UserModel;    

    sub loadUser {        
        $user = UserModel->new;
        
        $user->setValues({"id"=>"1",
            "name"=>"Renan Alves", "user" => "renan","pass"=>"123", "mail" => "renan.silva\@kabum.com.br",
                "role"=>"Admin","excluded"=>"0"});
        
        return $user;
    }

}
1;