
package StatusCodeForbidden;
{
    require "Response.pm";    
    use Response;

    sub response{
        $message = $_[0];
        $instance = Response->new;
        $instance->response("403 Forbidden", $message);
    }
}
1;