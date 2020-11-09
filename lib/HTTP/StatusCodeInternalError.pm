
package StatusCodeInternalError;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("500 Internal Server Error", $message);
    }
}
1;