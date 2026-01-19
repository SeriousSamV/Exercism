unit module Raindrops;

sub raindrop ($num) is export {
    my $res = "";
    $res ~= "Pling" if $num %% 3;
    $res ~= "Plang" if $num %% 5;
    $res ~= "Plong" if $num %% 7;
    $res eq "" ?? $num.Str !! $res
}
