package CustomerService;
{
    use CustomerRepository;

    sub loadCustomers {
        return CustomerRepository::loadCustomers;
    }
}
1;