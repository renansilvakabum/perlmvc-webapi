
package StatusCodeBadRequest;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("400 Bad Request", $message);
    }
}
1;