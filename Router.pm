package Router;
{
    require "./lib/System/Routes.pm";
    use Routes;
    use JSON;
    my $_routes = Routes->new;

    #register the routes here
   
    #Comecial
    $_routes->registerRoute("GET", "/api/v1/Comercial/Customer", "Comercial", "v1", "LoadCustomers", 1);
    $_routes->registerRoute("POST", "/api/v1/Comercial/Customer", "Comercial", "v1", "CreateCustomer", 1);
  
    #Compras
    $_routes->registerRoute("GET", "/api/v1/Compras/Customer", "Compras", "v1", "LoadCustomers", 1);
    $_routes->registerRoute("POST", "/api/v1/Compras/Customer", "Compras", "v1", "CreateCustomer", 1);
 
    #Financeiro
    $_routes->registerRoute("GET", "/api/v1/Financeiro/Customer", "Financeiro", "v1", "LoadCustomers", 1);
    $_routes->registerRoute("POST", "/api/v1/Financeiro/Customer", "Financeiro", "v1", "CreateCustomer", 1);
  
    #Fiscal
    $_routes->registerRoute("GET", "/api/v1/Fiscal/Customer", "Fiscal", "v1", "LoadCustomers", 1);
    $_routes->registerRoute("POST", "/api/v1/Fiscal/Customer", "Fiscal", "v1", "CreateCustomer", 1);
 
    #Logistica
    $_routes->registerRoute("PUT", "/api/v1/Logistica/StatusFrete", "Logistica", "v1", "AlterStatusFrete", 1);
    $_routes->registerRoute("PUT", "/api/v1/Logistica/StatusTMSFrete", "Logistica", "v1", "AlterStatusTMSFrete", 1);
    $_routes->registerRoute("PUT", "/api/v1/Logistica/StatusFreteCoberturaCEP", "Logistica", "v1", "AlterStatusFreteCoberturaCEP", 1);
    $_routes->registerRoute("PUT", "/api/v1/Logistica/StatusFretePlataforma", "Logistica", "v1", "AlterStatusFretePlataforma", 1);
    $_routes->registerRoute("GET", "/api/v1/Logistica/Fretes", "Logistica", "v1", "LoadFretes", 1);
    $_routes->registerRoute("GET", "/api/v1/Logistica/FretesCoberturas", "Logistica", "v1", "LoadFretesCoberturas", 1);
    $_routes->registerRoute("GET", "/api/v1/Logistica/FretesPlataformas", "Logistica", "v1", "LoadFretesPlataformas", 1);    
 
    #Marketing
    $_routes->registerRoute("GET", "/api/v1/Marketing/Customer", "Marketing", "v1", "LoadCustomers", 1);
    $_routes->registerRoute("POST", "/api/v1/Marketing/Customer", "Marketing", "v1", "CreateCustomer", 1);
  
    #Marketplace
    $_routes->registerRoute("GET", "/api/v1/Makertplace/Customer", "Marketplace", "v1", "LoadCustomers", 1);
    $_routes->registerRoute("POST", "/api/v1/Marketplace/Customer", "Marketplace", "v1", "CreateCustomer", 1);

    #####
    
    sub new {
        return bless {};
    }    

    sub getRoute {
        my ($self, $uri, $verb) = @_;           

        if($_routes->getRoutes($verb) eq undef){
            return undef;
        } 

        return $_routes->getRoutes($verb)->{$uri};
    }

}