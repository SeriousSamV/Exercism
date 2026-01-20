unit class Robot;

my SetHash $used-names = SetHash.new;

has Str:D $.name is built = self!generate-name;

method !generate-name(--> Str:D) {
    die "All names used." if $used-names.elems >= 2600;

    my Str:D $new-name = '';
    repeat {
        my $letter = ('A'..'Z').pick;
        my $digits = (0..99).pick.fmt('%02d');
        $new-name = $letter ~ $digits;
    } until !$used-names{$new-name};

    $used-names{$new-name} = True;
    return $new-name;
}

method reset-name(--> Nil) {
    $!name = self!generate-name;
}
