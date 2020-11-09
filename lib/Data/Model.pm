package Model;

our @_attributes = undef;
our %_values = undef;

sub new{
    return bless {};
}

sub setAttribute{
    my ($attribute) = $_;
    $_values{$attribute} = undef;
}

sub setValues{
    my %_values = $_;

    foreach my $key (keys $_values){
        if(exists($_attributes[$key])){
            $_values{$key} = $_values[$key];
        }
    }

}

sub set{
    my ($attribute, $value) = $_;
    $_values{$attribute} = $value;
}

sub get {
    my ($attribute) = $_;
    return $_values{$attribute};
}