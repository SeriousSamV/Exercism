unit class Clock;

has Int $.hour;
has Int $.minute;

method time {
    sprintf "%02d:%02d", $!hour, $!minute
}

method add (:$minutes --> Clock) {
    self.new: :hour($.hour), :minute($.minute + $minutes)
}

method subtract (:$minutes --> Clock) {
    self.new: :hour($.hour), :minute($.minute - $minutes)
}

submethod TWEAK {
    my $remaining-minutes = $!hour * 60 + $!minute;
    $!hour = ($remaining-minutes div 60) % 24;
    $!minute = $remaining-minutes % 60;
}
