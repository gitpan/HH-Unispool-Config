use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Numbered::System::Info;

my $orig = "I 4   ;SYS;A short description for this system\n";
my $tok = HH::Unispool::Config::File::Token::Numbered::System::Info->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}
