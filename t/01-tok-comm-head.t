use Test;
BEGIN { plan tests => 2 };

use HH::Unispool::Config::File::Token::Comment::Head;
ok(1);

my $orig = "* UNISPOOL <5.12> configuration dumped on host foo\n";
my $tok = HH::Unispool::Config::File::Token::Comment::Head->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}
