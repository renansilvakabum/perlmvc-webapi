#!/usr/bin/perl

$cgi = new CGI;
$router = Router->new;
$uri = Url::getRequestURI;
$verb = $cgi->request_method();
$route = $router->getRoute($uri, $verb);
$params = Request::getParams;
$params->{"_userdata"} = undef;
$token = $ENV{HTTP_TOKEN};
1;