use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::Device::1;

my $orig = "D 2   ;DEVTYPE1        ;1 ;p2       ;   ;2048;132;66;                ;                ;  N   ;DS\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::Device::1->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

