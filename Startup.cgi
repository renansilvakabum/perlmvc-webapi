#!/usr/bin/perl

#autoload
BEGIN{    
    push @INC, "./app/Controller/";
    push @INC, "./app/Model/";
    push @INC, "./app/Service/";
    push @INC, "./app/Repository/";
    push @INC, "./lib/Data/";
    push @INC, "./lib/HTTP/";
    push @INC, "./lib/Service/";
    push @INC, "./lib/Validator/";
    push @INC, "./lib/System/";
    push @INC, "./lib/JSON/";
    push @INC, "./lib/JSON/WebToken/";
    push @INC, "./lib/JSON/WebToken/Crypt/";
    push @INC, "./app/Config/";
}
#--autoload

use Router;
use CGI;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
use Data::Dumper;
use CustomerModel;
use Url;
use ApplicationConfig;

$cgi = new CGI;
$router = Router->new;
$uri = Url::getRequestURI;
$verb = $cgi->request_method();
$route = $router->getRoute($uri, $verb);

if($route eq undef)
{
    use StatusCodeNotFound;
    StatusCodeNotFound::response "Route Not Found!";  
    exit;
}

if($route->{"Private"} == 1){
    #Implements middleware authenticate
    #$route->{"Role"} <<--- Get permission for access
}

$package = $route->{"Package"};
$sub = $route->{"Sub"};

require "./app/Controller/".$package.".pm";

eval "use $package;";
$instance = $package->new;
$instance->$sub;