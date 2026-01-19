unit module NucleotideCount;

sub nucleotide-count ($strand) is export {
    my %m =
        A => 0,
        C => 0,
        G => 0,
        T => 0,
    ;
    for $strand.comb -> $c {
       given $c.uc {
           when "A" {
               %m{"A"}++;
           }
           when "C" {
               %m{"C"}++;
           }
           when "G" {
               %m{"G"}++;
           }
           when "T" {
               %m{"T"}++;
           }
           default {
               die "Invalid nucleotide in strand";
           }
       }
    }
    return %m.Bag;
}
