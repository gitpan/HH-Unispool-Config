use Test;
BEGIN { plan tests => 45 };


use HH::Unispool::Config::File::Token::Factory;

my @orig = (
    "* UNISPOOL <5.12> configuration dumped on host foo\n",
    "* End of configuration dumped on host foo\n",
    "* Dump date  : WED, JUL 17, 2002, 11:13 AM\n",
    "* Dump scope : _Server_, _Script_, _Network_, System=*\n",
    "* Configuration server info for [_Network_]\n",
    "* Filter file info for [_Network_]\n",
    "* Miscellaneous configuration items for [_Network_]\n",
    "* Remote system configuration for [_Network_]\n",
    "* Device configuration for [_Network_]\n",
    "* Group configuration for [_Network_]\n",
    "C     foor.bar.org.\n",
    "B     foor.bar.org.\n",
    "F     cexpand /home/unispool/cexpand default\n",
    "H     [Network]\n",
    "M     new             ;15 ;3/C  ;1;DD/MM/YY;0:00 ;0         ;0         ;LP\n",
    "L     SF10.STATEFARM.COM\n",
    "S 1   ;TYPE3           ;3;HOUSE   ;PASS1    ;PASS2    ;    ;180;   ;    ; I  ;CS\n",
    "S 2   ;TYPE6           ;6;        ;         ;         ;    ;   ;   ;0   ; I  ;CS\n",
    "S 3   ;TYPE7           ;7;        ;         ;         ;    ;   ;   ;0   ; I  ;CS\n",
    "S 4   ;TYPE8           ;8;        ;         ;         ;    ;   ;   ;0   ; I  ;CS\n",
    "I 2   ;DEV;A short description for this device\n",
    "I 4   ;SYS;A short description for this system\n",
    "D 1   ;DEVTYPE0        ;0 ;p1       ;   ;    ;   ;  ;                ;                ; IN U ;CS\n",
    "D 2   ;DEVTYPE1        ;1 ;p2       ;   ;2048;132;66;                ;                ;  N   ;DS\n",
    "D 3   ;DEVTYPE2        ;2 ;p3       ;   ;2048;132;66;                ;                ;  N   ;DS\n",
    "D 4   ;DEVTYPE3        ;3 ;         ;   ;    ;   ;  ;                ;                ; IN   ;DS\n",
    "D 5   ;DEVTYPE4        ;4 ;         ;   ;    ;   ;  ;                ;LP              ; IN   ;DS\n",
    "D 5   ;DEVTYPE5        ;5 ;         ;   ;    ;   ;  ;REMSYS          ;LP\n",
    "D 7   ;DEVTYPE6        ;6 ;         ;   ;0   ;0  ;  ;                ;                ; IN   ;CS\n",
    "D 8   ;DEVTYPE7        ;7 ;         ;   ;    ;   ;  ;                ;LP              ; IN   ;DS\n",
    "P 1   ;DEV;6\n",
    "G 4   ;PRT1             ;PRT2             ;PRT3             ;\n",
    "N 1   ;foo.bar.org.                                      ;Solaris ;4098;180\n",
    "N 1   ;TYPE3.STATEFARM.COM\n",
    "N 2   ;TYPE6.STATEFARM.COM                               ;MPE\n",
    "N 4   ;TYPE8.STATEFARM.COM                               ;MPE     ;4098;180\n",
    "N 7   ;PRINTER.STATEFARM.COM                             ;PJL;SERVER;9100\n",
    "X 1   ;                ;HEADER          ;TRAILER         ;cexpand\n",
    "X 2   ;PROFILE         ;HEADER          ;TRAILER         ;cexpand\n",
    "X 3   ;PROFILE         ;HEADER          ;TRAILER         ;cexpand\n",
    "X 4   ;                ;                ;                ;cexpand\n",
    "X 5   ;                ;HEADER          ;TRAILER         ;cexpand\n",
    "X 5   ;                ;HEADER          ;TRAILER         ;cexpand\n",
    "X 7   ;                ;                ;                ;cexpand\n",
    "X 8   ;                ;HEADER          ;TRAILER         ;cexpand\n",
);
my $i = 0;
my $fact = HH::Unispool::Config::File::Token::Factory->new();
foreach my $orig (@orig) {
    $i++;
    my $tok = $fact->create_token($orig, $i);
    if ( ! &UNIVERSAL::isa( $tok, 'HH::Unispool::Config::File::Token' ) ) {
        print STDERR "\n";
        print STDERR "orig: $orig";
        ok(0);
        next;
    }
    my $repl = $tok->write_string();
    ok($orig eq $repl);
    if (0 || $orig ne $repl) {
        print STDERR "\n";
        print STDERR "orig: $orig";
        print STDERR "repl: $repl";
    }
}

