use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::Device::Group;

my $orig = "G 4   ;PRT1             ;PRT2             ;PRT3             ;\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Group->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}
