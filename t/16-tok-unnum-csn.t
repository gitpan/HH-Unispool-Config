use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Unnumbered::CSN;

my $orig = "L     SF10.STATEFARM.COM\n";
my $tok = HH::Unispool::Config::File::Token::Unnumbered::CSN->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

