
package StatusCodeOK;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("200 OK", $message);
    }
}
1;