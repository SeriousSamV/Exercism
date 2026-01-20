unit module Luhn;

sub is-luhn-valid ($input) is export {
    my $clean = $input.subst(' ', '', :g);

    return False if $clean.chars < 2;
    return False unless $clean ~~ /^<digit>+$/;

    $clean.comb.map(*.Int).reverse.kv.map(-> $k, $v {
        if $k !%% 2 {
            my $doubled = $v * 2;
            $doubled > 9 ?? $doubled - 9 !! $doubled
        }
        else { $v }
    }).sum %% 10
}
