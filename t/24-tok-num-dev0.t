use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::Device::0;

my $orig = "D 1   ;DEVTYPE0        ;0 ;p1       ;   ;    ;   ;  ;                ;                ; IN U ;CS\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::Device::0->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

