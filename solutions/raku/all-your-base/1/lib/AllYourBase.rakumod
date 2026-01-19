unit module AllYourBase;

constant @errors = (
  'input base must be >= 2',
  'output base must be >= 2',
  'all digits must satisfy 0 <= d < input base',
);

sub convert-base ( :%bases!, :@digits! ) is export {
    die "input base must be >= 2" if %bases<from> < 2;
    die "output base must be >= 2" if %bases<to> < 2;

    return (0,) if !@digits || @digits.all == 0;

    for @digits -> $digit {
        die "all digits must satisfy 0 <= d < input base"
            if $digit < 0 || $digit >= %bases<from>;
    }

    my $decimal = [+] @digits.kv.map: -> $i, $d {
        $d * %bases<from> ** (@digits - $i - 1)
    };
    return (0,) if $decimal == 0;

    my @result;
    my $num = $decimal;
    while $num > 0 {
        @result.unshift: $num % %bases<to>;
        $num div= %bases<to>;
    }
    return @result.List;
}
