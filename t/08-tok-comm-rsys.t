use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Comment::RSys;

my $orig = "* Remote system configuration for [_Network_]\n";
my $tok = HH::Unispool::Config::File::Token::Comment::RSys->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}
