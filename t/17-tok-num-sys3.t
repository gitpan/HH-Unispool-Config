use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::System::3;

my $orig = "S 1   ;TYPE3           ;3;HOUSE   ;PASS1    ;PASS2    ;    ;180;   ;    ; I  ;CS\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::System::3->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}

