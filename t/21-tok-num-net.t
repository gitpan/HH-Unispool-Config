use Test;
BEGIN { plan tests => 5 };

use HH::Unispool::Config::File::Token::Numbered::Network;

foreach my $orig (
        "N 1   ;foo.bar.org.                                      ;Solaris ;4098;180\n",
        "N 1   ;TYPE3.STATEFARM.COM\n",
        "N 2   ;TYPE6.STATEFARM.COM                               ;MPE\n",
        "N 4   ;TYPE8.STATEFARM.COM                               ;MPE     ;4098;180\n",
        "N 7   ;PRINTER.STATEFARM.COM                             ;PJL;SERVER;9100\n"
    ) {
    my $tok = HH::Unispool::Config::File::Token::Numbered::Network->new_from_string($orig);
    my $repl = $tok->write_string();
    ok($orig eq $repl);
    if (0 || $orig ne $repl) {
        print STDERR "\n";
        print STDERR "orig: $orig";
        print STDERR "repl: $repl";
    }
}
