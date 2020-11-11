package CustomerService;
{
    use CustomerRepository;

    sub loadCustomers {
        return CustomerRepository::loadCustomers;
    }

    sub store {
        CustomerRepository::store;
    }
}
1;