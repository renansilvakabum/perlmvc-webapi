#!/usr/bin/perl

our $BASEAPP = $ENV{'HTTP_BASEAPP'};
require $BASEAPP."/GLOBAL/cgi-local/modulos/kernel/000.cgi";

$cgi = new CGI;
$router = Router->new;
$uri = Url::getRequestURI;
$verb = $cgi->request_method();
$route = $router->getRoute($uri, $verb);
$params = Request::getParams;
$params->{"_userdata"} = undef;

1;