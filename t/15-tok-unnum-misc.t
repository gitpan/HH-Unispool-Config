use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Unnumbered::Misc;

my $orig = "M     new             ;15 ;3/C  ;1;DD/MM/YY;0:00 ;0         ;0         ;LP\n";
my $tok = HH::Unispool::Config::File::Token::Unnumbered::Misc->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

