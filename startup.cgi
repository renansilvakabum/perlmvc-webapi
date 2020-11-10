#!/usr/bin/perl

#autoload
BEGIN{    
    push @INC, "./app/controller/";
    push @INC, "./app/model/";
    push @INC, "./app/service/";
    push @INC, "./app/repository/";
    push @INC, "./lib/Model/";
    push @INC, "./lib/HTTP/";
    push @INC, "./lib/Service/";
}
#--autoload

use Router;
use CGI;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);
use Data::Dumper;

$cgi = new CGI;
#print "Content-type: text/plain";
%router = Router::getRoutes;
$uri = $cgi->param("uri");

if($router{$uri} eq undef)
{
    use StatusCodeNotFound;
    StatusCodeNotFound::response "Route not found!";    
    exit;
}

$package = $router{$uri}{"Package"};
$sub = $router{$uri}{"Sub"};

require "./app/controller/".$package.".pm";

eval "use $package;";
$instance = $package->new;
$instance->$sub;