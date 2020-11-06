package model;

our @attributes = undef;
our %values = undef;

sub setAttribute{
    my ($attribute) = $_;
    $values{$attribute} = undef;
}

sub setValues{
    my %values = $_;

    foreach my $key (keys $values){
        if(exists($attributes[$key])){
            $values{$key} = $values[$key];
        }
    }

}

sub set{
    my ($attribute, $value) = $_;
    $values{$attribute} = $value;
}

sub get {
    my ($attribute) = $_;
    return $values{$attribute};
}