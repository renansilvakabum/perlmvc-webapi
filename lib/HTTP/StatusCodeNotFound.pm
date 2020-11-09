
package StatusCodeNotFound;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("404 Not Found", $message);
    }
}
1;