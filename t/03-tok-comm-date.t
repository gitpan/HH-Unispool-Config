use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Token::Comment::Date;

my $orig = "* Dump date  : WED, JUL 17, 2002, 11:13 AM\n";
my $tok = HH::Unispool::Config::File::Token::Comment::Date->new_from_string($orig);
my $repl = $tok->write_string();
ok($orig eq $repl);
if (0 || $orig ne $repl) {
    print STDERR "\n";
    print STDERR "orig: $orig";
    print STDERR "repl: $repl";
}
