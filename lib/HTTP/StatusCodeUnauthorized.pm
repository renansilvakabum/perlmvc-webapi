
package StatusCodeUnauthorized;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("401 Unauthorized", $message);
    }
}
1;