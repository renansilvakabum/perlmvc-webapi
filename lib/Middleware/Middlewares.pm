package Middlewares;
{
    my @_middlewares = ();

    sub registerMiddleware {
        my ($middleware) = @_;

        push @_middlewares, $middleware;
    }

    sub executeMiddlewares {
        for(@_middlewares){
            $_->execute();
        }
    }
}
1;