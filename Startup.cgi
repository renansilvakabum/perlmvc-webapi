#!/usr/bin/perl

#autoload
BEGIN{    
    push @INC, "./lib/Data/";
    push @INC, "./lib/HTTP/";
    push @INC, "./lib/Service/";
    push @INC, "./lib/Validator/";
    push @INC, "./lib/System/";    
    push @INC, "./lib/JSON/";
    push @INC, "./lib/Middleware/";
    push @INC, "./app/Configs/";
    push @INC, "./app/Configs/";
    push @INC, $ENV{'HTTP_BASEAPP'}."/GLOBAL/cgi-local/module/"; 
}
#--autoload

use Router;
use CGI;
use Url;
use ApplicationConfig;
use Request;
use AuthenticateMiddleware;
use Middlewares;
use Try::Tiny;

eval {    
        
    require "./Initialize.cgi";

    Middlewares::registerMiddleware(AuthenticateMiddleware->new($route));
    
    if($route eq undef)
    {
        use StatusCodeNotFound;
        StatusCodeNotFound::response "Route Not Found!";  
        exit;
    }

    Middlewares::executeMiddlewares;
    
    $version = $route->{"Version"};
    $application = $route->{"Application"};
    $module = $route->{"Module"};
    
    push @INC, "./app/Modules/$module/$version/Models/";
    push @INC, "./app/Modules/$module/$version/Applications/$application/";
        
    require "./app/Modules/$module/$version/Applications/$application/Application.pm";
    
    eval "use Application";
    $instance = Application->new;
    $instance->execute($params);    
    
} or do {

}