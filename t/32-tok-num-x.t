use Test;
BEGIN { plan tests => 8 };

use HH::Unispool::Config::File::Token::Numbered::X;

foreach my $orig (
        "X 1   ;                ;HEADER          ;TRAILER         ;cexpand\n",
        "X 2   ;PROFILE         ;HEADER          ;TRAILER         ;cexpand\n",
        "X 3   ;PROFILE         ;HEADER          ;TRAILER         ;cexpand\n",
        "X 4   ;                ;                ;                ;cexpand\n",
        "X 5   ;                ;HEADER          ;TRAILER         ;cexpand\n",
        "X 5   ;                ;HEADER          ;TRAILER         ;cexpand\n",
        "X 7   ;                ;                ;                ;cexpand\n",
        "X 8   ;                ;HEADER          ;TRAILER         ;cexpand\n",
    ) {
    my $tok = HH::Unispool::Config::File::Token::Numbered::X->new_from_string($orig);
    my $repl = $tok->write_string();
    ok($orig eq $repl);
    if (0 || $orig ne $repl) {
        print STDERR "\n";
        print STDERR "orig: $orig";
        print STDERR "repl: $repl";
    }
}
