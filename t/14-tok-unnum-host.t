use Test;
BEGIN { plan tests => 2 };

use HH::Unispool::Config::File::Token::Unnumbered::Host;

my $orig = "H     [Network]\n";
my $tok = HH::Unispool::Config::File::Token::Unnumbered::Host->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

$orig = "H     SF1.STATEFARM.COM                                 ;MPE\n";
$tok = HH::Unispool::Config::File::Token::Unnumbered::Host->new_from_string($orig);
$repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}
