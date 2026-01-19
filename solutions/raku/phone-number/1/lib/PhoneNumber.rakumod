unit module PhoneNumber;

constant @errors = (
   '11 digits must start with 1',
   'must not be greater than 11 digits',
   'must not be fewer than 10 digits',
   'letters not permitted',
   'punctuations not permitted',
   'area code cannot start with zero',
   'area code cannot start with one',
   'exchange code cannot start with zero',
   'exchange code cannot start with one',
);

sub clean-number ($number) is export {
    my @s;
    constant DIGITS = set('0' .. '9');
    constant ALLOWED-SYMBOLS = set(<( ) + - .>, ' ');
    constant ALLOWED-CHARS = DIGITS ∪ ALLOWED-SYMBOLS;
    constant ERR-LETTERS = set('a'..'z', 'A'..'Z');
    constant ERR-PUNCT = set(<, ; : { [ | ] }>);

    for $number.comb -> $c {
        given $c {
            when * (elem) DIGITS { @s.push: $c }
            when * (elem) ALLOWED-SYMBOLS { }
            when * (elem) ERR-LETTERS { die 'letters not permitted' }
            default { die 'punctuations not permitted' }
        }
    }
    @s = @s[1..*] if @s.elems == 11 && @s[0] eq '1';
    if @s.elems == 11 && @s[0] ne '1' { die '11 digits must start with 1' }
    if @s.elems > 11 { die 'must not be greater than 11 digits' }
    if @s.elems < 10 { die 'must not be fewer than 10 digits' }
    if @s[0] eq '0' { die 'area code cannot start with zero' }
    if @s[0] eq '1' { die 'area code cannot start with one' }
    if @s[3] eq '0' { die 'exchange code cannot start with zero' }
    if @s[3] eq '1' { die 'exchange code cannot start with one' }

    return @s.join("");
}
