use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::Device::5;

my $orig = "D 5   ;DEVTYPE5        ;5 ;         ;   ;    ;   ;  ;REMSYS          ;LP\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::Device::5->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

