use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::System::8;

my $orig = "S 4   ;TYPE8           ;8;        ;         ;         ;    ;   ;   ;0   ; I  ;CS\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::System::8->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

