unit module Luhn;

sub is-luhn-valid ($input) is export {
    my $clean = $input.subst(' ', '', :g);

    return False if $clean.chars < 2;
    return False unless $clean ~~ /^ <digit>+ $/;

    my @nums = $clean.comb.map: *.Int;
    my $s = 0;
    for @nums.reverse.kv -> $k, $v {
        if $k !%% 2 {
            my $v2 = $v * 2;
            $s += $v2 > 9 ?? $v2 - 9 !! $v2
        } else {
            $s += $v;
        }
    }

    return $s %% 10
}
