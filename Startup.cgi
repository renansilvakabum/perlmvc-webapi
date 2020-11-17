#!/usr/bin/perl

#autoload
BEGIN{    
    push @INC, "./app/Controller/";
    push @INC, "./app/Model/";
    push @INC, "./app/DTO/";
    push @INC, "./app/Service/";
    push @INC, "./app/Repository/";
    push @INC, "./lib/Data/";
    push @INC, "./lib/HTTP/";
    push @INC, "./lib/Service/";
    push @INC, "./lib/Validator/";
    push @INC, "./lib/System/";    
    push @INC, "./lib/JSON/";
    push @INC, "./lib/Middleware/";
    push @INC, "./app/Config/";
}
#--autoload

use Router;
use CGI;
use CustomerModel;
use Url;
use ApplicationConfig;
use Request;
use AuthenticateMiddleware;
use Middlewares;
use Try::Tiny;

eval {    

    require "./Initialize.cgi";

    Middlewares::registerMiddleware(AuthenticateMiddleware->new($route, $token, \$params));

    if($route eq undef)
    {
        use StatusCodeNotFound;
        StatusCodeNotFound::response "Route Not Found!";  
        exit;
    }

    Middlewares::executeMiddlewares;

    $package = $route->{"Package"};
    $sub = $route->{"Sub"};

    require "./app/Controller/".$package.".pm";

    eval "use $package;";
    $instance = $package->new;
    $instance->$sub($params);    
    
} or do {

}