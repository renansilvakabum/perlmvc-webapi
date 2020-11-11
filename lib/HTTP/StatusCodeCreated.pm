
package StatusCodeCreated;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("201 Created", $message);
    }
}
1;