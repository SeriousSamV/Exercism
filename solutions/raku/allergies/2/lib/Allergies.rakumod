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
    so $score +& (0b1 +< $item.value)
}

sub list-allergies($score) is export {
    my Allergen @s;
    for Allergen.enums.kv -> $k, $v {
        if $score +& (0b1 +< $v) { @s.push(Allergen::{$k}) }
    }
    return @s;
}
