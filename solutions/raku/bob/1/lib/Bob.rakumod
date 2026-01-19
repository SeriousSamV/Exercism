#`[
    Declare role 'Bob' and unit-scope the role
    i.e. everything in this file is part of 'Bob'.
]
unit role Bob;

method hey () {
    my $q = self.trim();
    if $q.uc eq $q && $q.ends-with("?") && $q.contains(/<:L>/) {
        return "Calm down, I know what I'm doing!";
    }
    if $q eq "" || $q.lc eq "silence." {
        return "Fine. Be that way!";
    }
    if $q.uc eq $q && $q.contains(/<:L>/) {
        return "Whoa, chill out!";
    }
    if $q.ends-with("?") {
        return "Sure.";
    }

    return "Whatever."
}
