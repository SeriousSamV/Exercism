unit module Luhn;

sub is-luhn-valid ($input) is export {
    my $clean = $input.subst(' ', '', :g);

    return False if $clean.chars < 2;
    return False unless $clean ~~ /^ <digit>+ $/;

    my @nums = $clean.comb.map: *.Int;
    my $s = @nums.reverse.kv.map: -> $k, $v {
        if $k !%% 2 { ($v * 2) % 9 || 9 }
        else { $v * 2 }
    }
    return $s %% 10
}
