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
    Allergen::.values.eager.grep: -> $a { $score +& (0b1 +< $a.value) }
}
