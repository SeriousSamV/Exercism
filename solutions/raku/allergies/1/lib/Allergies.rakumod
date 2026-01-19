unit module Allergies;

enum Allergen is export <
    Eggs
    Peanuts
    Shellfish
    Strawberries
    Tomatoes
    Chocolate
    Pollen
    Cats
>;

sub allergic-to( :$item, :$score ) is export {
    for Allergen.enums.kv -> $k, $v {
        if $item eq $k and $score +& (0b1 +< $v) { return True }
    }
    return False;
}

sub list-allergies($score) is export {
    my Allergen @s;
    for Allergen.enums.kv -> $k, $v {
        if $score +& (0b1 +< $v) { @s.push(Allergen::{$k}) }
    }
    return @s;
}
