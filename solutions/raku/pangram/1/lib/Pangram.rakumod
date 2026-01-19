unit module Pangram;

sub is-pangram ($sentence) is export {
    for 'a'..'z' -> $alpha {
        if !$sentence.lc.contains($alpha) {
            return False;
        }
    }
    return True;
}
