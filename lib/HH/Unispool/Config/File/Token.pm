package HH::Unispool::Config::File::Token;

use 5.006;
use base qw( Exporter );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
require Exporter;

our $USP_BCS_FRM = "B     %s\n";

our $USP_BCS_RX = '^\s*B\s+(\S+)\s*$';

our $USP_CFG_DEV_FRM = "* Device configuration for [%s]\n";

our $USP_CFG_DEV_RX = '^\s*\*\s*Device\s+configuration\s+for\s*\[(\S+)]\s*$';

our $USP_CFG_GRP_FRM = "* Group configuration for [%s]\n";

our $USP_CFG_GRP_RX = '^\s*\*\s*Group\s+configuration\s+for\s*\[(\S+)]\s*$';

our $USP_CFG_MISC_FRM = "* Miscellaneous configuration items for [%s]\n";

our $USP_CFG_MISC_RX = '^\s*\*\s*Miscellaneous\s+configuration\s+items\s+for\s*\[(\S+)]\s*$';

our $USP_CFG_RSYS_FRM = "* Remote system configuration for [%s]\n";

our $USP_CFG_RSYS_RX = '^\s*\*\s*Remote\s+system\s+configuration\s+for\s*\[(\S+)]\s*$';

our $USP_CS_FRM = "C     %s\n";

our $USP_CS_INFO_FRM = "* Configuration server info for [%s]\n";

our $USP_CS_INFO_RX = '^\s*\*\s*Configuration\s+server\s+info\s+for\s*\[(\S+)\]\s*$';

our $USP_CS_RX = '^\s*C\s+(\S+)\s*$';

our $USP_D0_FRM = "D %-4d;%-16s;0 ;%-9s;   ;    ;   ;  ;                ;                ;%-6s;%s\n";

our $USP_D0_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*0\b(.*)';

our $USP_D1_FRM = "D %-4d;%-16s;1 ;%-9s;   ;%-4d;%-3d;%-2d;                ;                ;%-6s;%s\n";

our $USP_D1_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*1\b(.*)';

our $USP_D2_FRM = "D %-4d;%-16s;2 ;%-9s;   ;%-4d;%-3d;%-2d;                ;                ;%-6s;%s\n";

our $USP_D2_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*2\b(.*)';

our $USP_D3_FRM = "D %-4d;%-16s;3 ;         ;   ;    ;   ;  ;                ;                ;%-6s;%s\n";

our $USP_D3_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*3\b(.*)';

our $USP_D4_FRM = "D %-4d;%-16s;4 ;         ;   ;    ;   ;  ;                ;%-16s;%-6s;%s\n";

our $USP_D4_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*4\b(.*)';

our $USP_D5_FRM = "D %-4d;%-16s;5 ;         ;   ;    ;   ;  ;%-16s;%s\n";

our $USP_D5_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*5\b(.*)';

our $USP_D6_FRM = "D %-4d;%-16s;6 ;%-9s;   ;%-4d;%-3d;  ;                ;                ;%-6s;%s\n";

our $USP_D6_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*6\b(.*)';

our $USP_D7_FRM = "D %-4d;%-16s;7 ;         ;   ;    ;   ;  ;                ;%-16s;%-6s;%s\n";

our $USP_D7_RX = '^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*7\b(.*)';

our $USP_DATE_FRM = "* Dump date  : %s, %s %d, %d, %2d:%02d %s\n";

our $USP_DATE_RX = '^\s*\*\s+Dump\s+date\s*:\s*\S+\s*,\s*(\S+)\s+(\d+)\s*,\s*(\d+)\s*,\s*(\d+):\s*(\d+)\s*(\S+)\s*$';

our $USP_FILTER_FRM = "F     %s %s %s\n";

our $USP_FILTER_INFO_FRM = "* Filter file info for [%s]\n";

our $USP_FILTER_INFO_RX = '^\s*\*\s*Filter\s+file\s+info\s+for\s*\[(\S+)\]\s*$';

our $USP_FILTER_RX = '^\s*F\s+(\S+)\s+(\S+)\s+(\S+)\s*$';

our $USP_G_FRM = "G %-4d;%-17s;%-17s;%-17s;%s\n";

our $USP_G_RX = '^\s*G\s+(\d+)(.*)';

our $USP_H1_FRM = "H     %s\n";

our $USP_H2_FRM = "H     %-50s;%s\n";

our $USP_HEAD_FRM = "* UNISPOOL <%s> configuration dumped on host %s\n";

our $USP_HEAD_RX = '^\s*\*\s+UNISPOOL\s+<(\S+)>\s+configuration\s+dumped\s+on\s+host\s+(\S+)\s*$';

our $USP_H_RX = '^\s*H\s+([^\s;]+)\s*(.*)',

our $USP_ID_FRM = "I %-4d;DEV;%s\n";

our $USP_ID_RX = '^\s*I\s+(\d+)\s*;\s*DEV\b(.*)',

our $USP_IS_FRM = "I %-4d;SYS;%s\n";

our $USP_IS_RX = '^\s*I\s+(\d+)\s*;\s*SYS\b(.*)',

our $USP_L_FRM = "L     %-s\n";

our $USP_L_RX = '^\s*L\s+(.+)';

our $USP_M_FRM = "M     %-16s;%-3s;%-5s;%-1s;%s;%-5s;%-10d;%-10d;%s\n";

our $USP_M_RX = '^\s*M\s+([^\s;]+)\s*(.*)',

our $USP_N2_FRM = "N %-4d;%s\n";

our $USP_N3_FRM = "N %-4d;%-50s;%s\n";

our $USP_N5_FRM = "N %-4d;%-50s;%-8s;%-4s;%s\n";

our $USP_ND_FRM = "N %-4d;%-50s;%-3s;SERVER;%s\n";

our $USP_N_RX = '^\s*N\s+(\d+)\s*;\s*(\S+)(.*)',

our $USP_PD_FRM = "P %-4d;DEV;%s\n";

our $USP_PD_RX = '^\s*P\s+(\d+)\s*;\s*DEV\b(.*)';

our $USP_S3_FRM = "S %-4d;%-16s;3;%-8s;%-9s;%-9s;    ;%-3s;   ;    ;%-4s;%s\n";

our $USP_S3_RX = '^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*3\b(.*)';

our $USP_S6_FRM = "S %-4d;%-16s;6;        ;         ;         ;    ;   ;   ;%-4d;%-4s;%s\n";

our $USP_S6_RX = '^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*6\b(.*)';

our $USP_S7_FRM = "S %-4d;%-16s;7;        ;         ;         ;    ;   ;   ;%-4d;%-4s;%s\n";

our $USP_S7_RX = '^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*7\b(.*)';

our $USP_S8_FRM = "S %-4d;%-16s;8;        ;         ;         ;    ;   ;   ;%-4d;%-4s;%s\n";

our $USP_S8_RX = '^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*8\b(.*)';

our $USP_SCOPE_FRM = "* Dump scope : %s\n";

our $USP_SCOPE_RX = '^\s*\*\s*Dump\s+scope\s*:\s*(.*)\s*$';

our $USP_TAIL_FRM = "* End of configuration dumped on host %s\n";

our $USP_TAIL_RX = '^\s*\*\s*End\s+of\s+configuration\s+dumped\s+on\s+host\s*(\S+)\s*$';

our $USP_X_FRM = "X %-4d;%-16s;%-16s;%-16s;%s\n";

our $USP_X_RX = '^\s*X\s+(\d+)\s*(.*)';

# Used by _value_is_allowed
our %ALLOW_ISA = (
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'input_line_number' => [ '^\d*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
);

# Exporter variable
our %EXPORT_TAGS = (
    'frm' => [ qw(
        $USP_BCS_FRM
        $USP_CFG_DEV_FRM
        $USP_CFG_GRP_FRM
        $USP_CFG_MISC_FRM
        $USP_CFG_RSYS_FRM
        $USP_CS_FRM
        $USP_CS_INFO_FRM
        $USP_D0_FRM
        $USP_D1_FRM
        $USP_D2_FRM
        $USP_D3_FRM
        $USP_D4_FRM
        $USP_D5_FRM
        $USP_D6_FRM
        $USP_D7_FRM
        $USP_DATE_FRM
        $USP_FILTER_FRM
        $USP_FILTER_INFO_FRM
        $USP_G_FRM
        $USP_H1_FRM
        $USP_H2_FRM
        $USP_HEAD_FRM
        $USP_ID_FRM
        $USP_IS_FRM
        $USP_L_FRM
        $USP_M_FRM
        $USP_N2_FRM
        $USP_N3_FRM
        $USP_N5_FRM
        $USP_ND_FRM
        $USP_PD_FRM
        $USP_S3_FRM
        $USP_S6_FRM
        $USP_S7_FRM
        $USP_S8_FRM
        $USP_SCOPE_FRM
        $USP_TAIL_FRM
        $USP_X_FRM
    ) ],
    'rx' => [ qw(
        $USP_BCS_RX
        $USP_CFG_DEV_RX
        $USP_CFG_GRP_RX
        $USP_CFG_MISC_RX
        $USP_CFG_RSYS_RX
        $USP_CS_INFO_RX
        $USP_CS_RX
        $USP_D0_RX
        $USP_D1_RX
        $USP_D2_RX
        $USP_D3_RX
        $USP_D4_RX
        $USP_D5_RX
        $USP_D6_RX
        $USP_D7_RX
        $USP_DATE_RX
        $USP_FILTER_INFO_RX
        $USP_FILTER_RX
        $USP_G_RX
        $USP_HEAD_RX
        $USP_H_RX
        $USP_ID_RX
        $USP_IS_RX
        $USP_L_RX
        $USP_M_RX
        $USP_N_RX
        $USP_PD_RX
        $USP_S3_RX
        $USP_S6_RX
        $USP_S7_RX
        $USP_S8_RX
        $USP_SCOPE_RX
        $USP_TAIL_RX
        $USP_X_RX
    ) ],
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

# Exporter variable
our @EXPORT = qw(
);

# Exporter variable
our @EXPORT_OK = qw(
    $USP_BCS_FRM
    $USP_BCS_RX
    $USP_CFG_DEV_FRM
    $USP_CFG_DEV_RX
    $USP_CFG_GRP_FRM
    $USP_CFG_GRP_RX
    $USP_CFG_MISC_FRM
    $USP_CFG_MISC_RX
    $USP_CFG_RSYS_FRM
    $USP_CFG_RSYS_RX
    $USP_CS_FRM
    $USP_CS_INFO_FRM
    $USP_CS_INFO_RX
    $USP_CS_RX
    $USP_D0_FRM
    $USP_D0_RX
    $USP_D1_FRM
    $USP_D1_RX
    $USP_D2_FRM
    $USP_D2_RX
    $USP_D3_FRM
    $USP_D3_RX
    $USP_D4_FRM
    $USP_D4_RX
    $USP_D5_FRM
    $USP_D5_RX
    $USP_D6_FRM
    $USP_D6_RX
    $USP_D7_FRM
    $USP_D7_RX
    $USP_DATE_FRM
    $USP_DATE_RX
    $USP_FILTER_FRM
    $USP_FILTER_INFO_FRM
    $USP_FILTER_INFO_RX
    $USP_FILTER_RX
    $USP_G_FRM
    $USP_G_RX
    $USP_H1_FRM
    $USP_H2_FRM
    $USP_HEAD_FRM
    $USP_HEAD_RX
    $USP_H_RX
    $USP_ID_FRM
    $USP_ID_RX
    $USP_IS_FRM
    $USP_IS_RX
    $USP_L_FRM
    $USP_L_RX
    $USP_M_FRM
    $USP_M_RX
    $USP_N2_FRM
    $USP_N3_FRM
    $USP_N5_FRM
    $USP_ND_FRM
    $USP_N_RX
    $USP_PD_FRM
    $USP_PD_RX
    $USP_S3_FRM
    $USP_S3_RX
    $USP_S6_FRM
    $USP_S6_RX
    $USP_S7_FRM
    $USP_S7_RX
    $USP_S8_FRM
    $USP_S8_RX
    $USP_SCOPE_FRM
    $USP_SCOPE_RX
    $USP_TAIL_FRM
    $USP_TAIL_RX
    $USP_X_FRM
    $USP_X_RX
);

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token - Abstract class for line string tokens from UNISPOOL config files

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

Abstract class for UNISPOOL config file tokens

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token> is an abstract class for line string tokens from UNISPOOL config files.
It offers a standard implementation of the C<new_from_string()> constructor,
interface methods to read/write token information from/to a string
C<read_string()> and C<write_string()> and the C<input_line_number> attribute.

=head1 EXPORT

By default nothing is exported.

=head2 frm

This tag contains C<printf()> formats usefull for writing file tokens.

=over

=item $USP_BCS_FRM

Format for C<B> lines.

=item $USP_CFG_DEV_FRM

Format for C<* Device configuration for>

=item $USP_CFG_GRP_FRM

Format for C<* Group configuration for> lines.

=item $USP_CFG_MISC_FRM

Format for C<* Miscellaneous configuration items for> lines.

=item $USP_CFG_RSYS_FRM

Format for C<* Remote system configuration for> lines.

=item $USP_CS_FRM

Format for C<C> lines.

=item $USP_CS_INFO_FRM

Format for C<* Configuration server info for> lines.

=item $USP_D0_FRM

Format for type C<0> C<D> lines.

=item $USP_D1_FRM

Format for type C<1> C<D> lines.

=item $USP_D2_FRM

Format for type C<2> C<D> lines.

=item $USP_D3_FRM

Format for type C<3> C<D> lines.

=item $USP_D4_FRM

Format for type C<4> C<D> lines.

=item $USP_D5_FRM

Format for type C<5> C<D> lines.

=item $USP_D6_FRM

Format for type C<6> C<D> lines.

=item $USP_D7_FRM

Format for type C<7> C<D> lines.
=item $USP_DATE_FRM

Format for C<* Dump date> lines.

=item $USP_FILTER_FRM

Format for C<F> lines.

=item $USP_FILTER_INFO_FRM

Format for C<* Filter file info for> lines.

=item $USP_G_FRM

Format for C<G> lines.

=item $USP_H1_FRM

Format for C<H> lines with only C<1> field.

=item $USP_H2_FRM

Format for C<H> lines with C<2> fields.

=item $USP_HEAD_FRM

Format for C<* UNISPOOL E<lt>...E<gt> configuration dumped on host> lines.

=item $USP_ID_FRM

Format for device C<I> lines.

=item $USP_IS_FRM

Format for system C<I> lines.

=item $USP_L_FRM

Format for C<L> lines.

=item $USP_M_FRM

Format for C<M> lines.

=item $USP_N2_FRM

Format for C<N> lines with C<2> fields.

=item $USP_N3_FRM

Format for C<N> lines with C<3> fields.

=item $USP_N5_FRM

Format for C<N> lines with C<5> fields.

=item $USP_ND_FRM

Format for device C<N> lines.

=item $USP_PD_FRM

Format for device C<P> lines.

=item $USP_S3_FRM

Format for type C<3> C<S> lines.
=item $USP_S6_FRM

Format for type C<6> C<S> lines.

=item $USP_S7_FRM

Format for type C<7> C<S> lines.

=item $USP_S8_FRM

Format for type C<8> C<S> lines.

=item $USP_SCOPE_FRM

Format for C<* Dump scope> lines.

=item $USP_TAIL_FRM

Format for C<* End of configuration dumped on host> lines.

=item $USP_X_FRM

Format for C<X> lines.

=back

=head2 rx

This tag contains regular expressions usefull for parsing file tokens.

=over

=item $USP_BCS_RX

Regular expression to parse C<B> lines.

=item $USP_CFG_DEV_RX

Regular expression to parse C<* Device configuration for> lines.

=item $USP_CFG_GRP_RX

Regular expression to parse C<* Group configuration for> lines.

=item $USP_CFG_MISC_RX

Regular expression to parse C<* Miscellaneous configuration items for> lines.

=item $USP_CFG_RSYS_RX

Regular expression to parse C<* Remote system configuration for> lines.

=item $USP_CS_INFO_RX

Regular expression to parse C<* Configuration server info for> lines.

=item $USP_CS_RX

Regular expression to parse C<C> lines.

=item $USP_D0_RX

Regular expression to parse type C<0> C<D> lines.

=item $USP_D1_RX

Regular expression to parse type C<1> C<D> lines.

=item $USP_D2_RX

Regular expression to parse type C<2> C<D> lines.

=item $USP_D3_RX

Regular expression to parse type C<3> C<D> lines.

=item $USP_D4_RX

Regular expression to parse type C<4> C<D> lines.

=item $USP_D5_RX

Regular expression to parse type C<5> C<D> lines.

=item $USP_D6_RX

Regular expression to parse type C<6> C<D> lines.

=item $USP_D7_RX

Regular expression to parse type C<7> C<D> lines.

=item $USP_DATE_RX

Regular expression to parse C<* Dump date> lines.

=item $USP_FILTER_INFO_RX

Regular expression to parse C<* Filter file info for> lines.

=item $USP_FILTER_RX

Regular expression to parse C<F> lines.

=item $USP_G_RX

Regular expression to parse C<G> lines.

=item $USP_HEAD_RX

Regular expression to parse C<* UNISPOOL E<lt>...E<gt> configuration dumped on host> lines.

=item $USP_H_RX

Regular expression to parse C<H> lines.

=item $USP_ID_RX

Regular expression to parse device C<I> lines.

=item $USP_IS_RX

Regular expression to parse system C<I> lines.

=item $USP_L_RX

Regular expression to parse C<L> lines.

=item $USP_M_RX

Regular expression to parse C<M> lines.

=item $USP_N_RX

Regular expression to parse C<N> lines.

=item $USP_PD_RX

Regular expression to parse device C<P> lines.

=item $USP_S3_RX

Regular expression to parse type C<3> C<S> lines.

=item $USP_S6_RX

Regular expression to parse type C<6> C<S> lines.

=item $USP_S7_RX

Regular expression to parse type C<7> C<S> lines.

=item $USP_S8_RX

Regular expression to parse type C<8> C<S> lines.

=item $USP_SCOPE_RX

Regular expression to parse C<* Dump scope> lines.

=item $USP_TAIL_RX

Regular expression to parse C<* End of configuration dumped on host> lines.

=item $USP_X_RX

Regular expression to parse C<X> lines.

=back

=head1 CONSTRUCTOR

=over

=item new( [ OPT_HASH_REF ] )

Creates a new C<HH::Unispool::Config::File::Token> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<input_line_number>>

Passed to L<set_input_line_number()>.

=back

=item new_from_string(LINE)

Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item read_string(LINE)

This is an interface method. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item write_string()

This is an interface method. Returns a Unispool config file token line string.

=item set_input_line_number(VALUE)

Set the line number from from which the token is read. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_input_line_number()

Returns the line number from from which the token is read.

=back

=head1 SEE ALSO

L<HH::Unispool::Config>,
L<HH::Unispool::Config::DateFormat>,
L<HH::Unispool::Config::Entry>,
L<HH::Unispool::Config::Entry::Device>,
L<HH::Unispool::Config::Entry::Device::0>,
L<HH::Unispool::Config::Entry::Device::1>,
L<HH::Unispool::Config::Entry::Device::2>,
L<HH::Unispool::Config::Entry::Device::3>,
L<HH::Unispool::Config::Entry::Device::4>,
L<HH::Unispool::Config::Entry::Device::5>,
L<HH::Unispool::Config::Entry::Device::6>,
L<HH::Unispool::Config::Entry::Device::7>,
L<HH::Unispool::Config::Entry::Filter>,
L<HH::Unispool::Config::Entry::Numbered>,
L<HH::Unispool::Config::Entry::RemoteSystem>,
L<HH::Unispool::Config::Entry::RemoteSystem::3>,
L<HH::Unispool::Config::Entry::RemoteSystem::6>,
L<HH::Unispool::Config::Entry::RemoteSystem::7>,
L<HH::Unispool::Config::Entry::RemoteSystem::8>,
L<HH::Unispool::Config::Entry::System>,
L<HH::Unispool::Config::ExecPri>,
L<HH::Unispool::Config::File::Token::Comment>,
L<HH::Unispool::Config::File::Token::Comment::Cs>,
L<HH::Unispool::Config::File::Token::Comment::Date>,
L<HH::Unispool::Config::File::Token::Comment::Device>,
L<HH::Unispool::Config::File::Token::Comment::Filter>,
L<HH::Unispool::Config::File::Token::Comment::Group>,
L<HH::Unispool::Config::File::Token::Comment::Head>,
L<HH::Unispool::Config::File::Token::Comment::Misc>,
L<HH::Unispool::Config::File::Token::Comment::NetDesc>,
L<HH::Unispool::Config::File::Token::Comment::RSys>,
L<HH::Unispool::Config::File::Token::Comment::Scope>,
L<HH::Unispool::Config::File::Token::Comment::Tail>,
L<HH::Unispool::Config::File::Token::Factory>,
L<HH::Unispool::Config::File::Token::Numbered>,
L<HH::Unispool::Config::File::Token::Numbered::Device>,
L<HH::Unispool::Config::File::Token::Numbered::Device::0>,
L<HH::Unispool::Config::File::Token::Numbered::Device::1>,
L<HH::Unispool::Config::File::Token::Numbered::Device::2>,
L<HH::Unispool::Config::File::Token::Numbered::Device::3>,
L<HH::Unispool::Config::File::Token::Numbered::Device::4>,
L<HH::Unispool::Config::File::Token::Numbered::Device::5>,
L<HH::Unispool::Config::File::Token::Numbered::Device::6>,
L<HH::Unispool::Config::File::Token::Numbered::Device::7>,
L<HH::Unispool::Config::File::Token::Numbered::Device::Group>,
L<HH::Unispool::Config::File::Token::Numbered::Device::Info>,
L<HH::Unispool::Config::File::Token::Numbered::Device::P>,
L<HH::Unispool::Config::File::Token::Numbered::Network>,
L<HH::Unispool::Config::File::Token::Numbered::System>,
L<HH::Unispool::Config::File::Token::Numbered::System::3>,
L<HH::Unispool::Config::File::Token::Numbered::System::6>,
L<HH::Unispool::Config::File::Token::Numbered::System::7>,
L<HH::Unispool::Config::File::Token::Numbered::System::8>,
L<HH::Unispool::Config::File::Token::Numbered::System::Info>,
L<HH::Unispool::Config::File::Token::Numbered::X>,
L<HH::Unispool::Config::File::Token::Unnumbered>,
L<HH::Unispool::Config::File::Token::Unnumbered::Bcs>,
L<HH::Unispool::Config::File::Token::Unnumbered::CSN>,
L<HH::Unispool::Config::File::Token::Unnumbered::Cs>,
L<HH::Unispool::Config::File::Token::Unnumbered::CsBcs>,
L<HH::Unispool::Config::File::Token::Unnumbered::Filter>,
L<HH::Unispool::Config::File::Token::Unnumbered::Host>,
L<HH::Unispool::Config::File::Token::Unnumbered::Misc>,
L<HH::Unispool::Config::File::Tokenizer>,
L<HH::Unispool::Config::FilterType>,
L<HH::Unispool::Config::OS>,
L<HH::Unispool::Config::Scope>

=head1 BUGS

None known (yet.)

=head1 HISTORY

First development: January 2003

=head1 AUTHOR

Vincenzo Zocca

=head1 COPYRIGHT

Copyright 2003 by Vincenzo Zocca

=head1 LICENSE

This file is part of the C<HH::Unispool::Config> module hierarchy for Perl by
Vincenzo Zocca.

The HH::Unispool::Config module hierarchy is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2 of
the License, or (at your option) any later version.

The HH::Unispool::Config module hierarchy is distributed in the hope that it will
be useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the HH::Unispool::Config module hierarchy; if not, write to
the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
Boston, MA 02111-1307 USA


=cut

sub new {
    my $class = shift;

    my $self = {};
    bless( $self, ( ref($class) || $class ) );
    return( $self->_initialize(@_) );
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::_initialize, first argument must be 'HASH' reference.");

    # input_line_number, SINGLE
    exists( $opt->{input_line_number} ) && $self->set_input_line_number( $opt->{input_line_number} );

    # Return $self
    return($self);
}

sub new_from_string {
    my $class = shift;

    my $self = {};
    bless( $self, ( ref($class) || $class ) );
    $self->read_string(@_);
    return($self);
}

sub read_string {
    throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::read_string, call this method in a subclass that has implemented it.");
}

sub write_string {
    throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::write_string, call this method in a subclass that has implemented it.");
}

sub set_input_line_number {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'input_line_number', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::set_input_line_number, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token}{input_line_number} = $val;
}

sub get_input_line_number {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token}{input_line_number} );
}

sub _value_is_allowed {
    my $name = shift;

    # Value is allowed if no ALLOW clauses exist for the named attribute
    if ( ! exists( $ALLOW_ISA{$name} ) && ! exists( $ALLOW_REF{$name} ) && ! exists( $ALLOW_RX{$name} ) && ! exists( $ALLOW_VALUE{$name} ) ) {
        return(1);
    }

    # At this point, all values in @_ must to be allowed
    CHECK_VALUES:
    foreach my $val (@_) {
        # Check ALLOW_ISA
        if ( ref($val) && exists( $ALLOW_ISA{$name} ) ) {
            foreach my $class ( @{ $ALLOW_ISA{$name} } ) {
                &UNIVERSAL::isa( $val, $class ) && next CHECK_VALUES;
            }
        }

        # Check ALLOW_REF
        if ( ref($val) && exists( $ALLOW_REF{$name} ) ) {
            exists( $ALLOW_REF{$name}{ ref($val) } ) && next CHECK_VALUES;
        }

        # Check ALLOW_RX
        if ( defined($val) && ! ref($val) && exists( $ALLOW_RX{$name} ) ) {
            foreach my $rx ( @{ $ALLOW_RX{$name} } ) {
                $val =~ /$rx/ && next CHECK_VALUES;
            }
        }

        # Check ALLOW_VALUE
        if ( ! ref($val) && exists( $ALLOW_VALUE{$name} ) ) {
            exists( $ALLOW_VALUE{$name}{$val} ) && next CHECK_VALUES;
        }

        # We caught a not allowed value
        return(0);
    }

    # OK, all values are allowed
    return(1);
}

sub _split_tail {
    my $name = shift;
    my $tail = shift;

    $tail =~ s/^\s*;\s*//;
    $tail =~ s/\s*$//;
    return( split(/\s*;\s*/, $tail) );
}
