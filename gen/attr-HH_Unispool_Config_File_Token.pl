use strict;

my $pkg = 'HH::Unispool::Config::File::Token';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'Abstract class for line string tokens from UNISPOOL config files',
        abstract => 'Abstract class for UNISPOOL config file tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for line string tokens from UNISPOOL config files.
It offers a standard implementation of the C<new_from_string()> constructor,
interface methods to read/write token information from/to a string
C<read_string()> and C<write_string()> and the C<input_line_number> attribute.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'input_line_number',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the line number from from which the token is read',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_string',
            parameter_description => 'LINE',
            description => <<EOF,
Creates a new object from the specified Unispool config file line string.
EOF
            body => <<EOF,
    my \$class = shift;

    my \$self = {};
    bless( \$self, ( ref(\$class) || \$class ) );
    \$self->read_string(\@_);
    return(\$self);
EOF
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            interface => 1,
            parameter_description => 'LINE',
            description => <<EOF,
Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.
EOF
        },
        {
            method_name => 'write_string',
            interface => 1,
            description => <<EOF,
Returns a Unispool config file token line string.
EOF
        },
    ],
    tag_opt => [
        {
            export_tag_name => 'rx',
            description => <<EOF,
This tag contains regular expressions usefull for parsing file tokens.
EOF
        },
        {
            export_tag_name => 'frm',
            description => <<EOF,
This tag contains C<printf()> formats usefull for writing file tokens.
EOF
        },
    ],
    sym_opt => [
        {
            symbol_name => '$USP_BCS_FRM',
            assignment => <<'EOF',
"B     %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<B> lines.
EOF
        },
        {
            symbol_name => '$USP_BCS_RX',
            assignment => <<'EOF',
'^\s*B\s+(\S+)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<B> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_DEV_FRM',
            assignment => <<'EOF',
"* Device configuration for [%s]\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Device configuration for>
EOF
        },
        {
            symbol_name => '$USP_CFG_DEV_RX',
            assignment => <<'EOF',
'^\s*\*\s*Device\s+configuration\s+for\s*\[(\S+)]\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Device configuration for> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_GRP_FRM',
            assignment => <<'EOF',
"* Group configuration for [%s]\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Group configuration for> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_GRP_RX',
            assignment => <<'EOF',
'^\s*\*\s*Group\s+configuration\s+for\s*\[(\S+)]\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Group configuration for> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_MISC_FRM',
            assignment => <<'EOF',
"* Miscellaneous configuration items for [%s]\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Miscellaneous configuration items for> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_MISC_RX',
            assignment => <<'EOF',
'^\s*\*\s*Miscellaneous\s+configuration\s+items\s+for\s*\[(\S+)]\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Miscellaneous configuration items for> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_RSYS_FRM',
            assignment => <<'EOF',
"* Remote system configuration for [%s]\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Remote system configuration for> lines.
EOF
        },
        {
            symbol_name => '$USP_CFG_RSYS_RX',
            assignment => <<'EOF',
'^\s*\*\s*Remote\s+system\s+configuration\s+for\s*\[(\S+)]\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Remote system configuration for> lines.
EOF
        },
        {
            symbol_name => '$USP_CS_FRM',
            assignment => <<'EOF',
"C     %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<C> lines.
EOF
        },
        {
            symbol_name => '$USP_CS_INFO_FRM',
            assignment => <<'EOF',
"* Configuration server info for [%s]\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Configuration server info for> lines.
EOF
        },
        {
            symbol_name => '$USP_CS_INFO_RX',
            assignment => <<'EOF',
'^\s*\*\s*Configuration\s+server\s+info\s+for\s*\[(\S+)\]\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Configuration server info for> lines.
EOF
        },
        {
            symbol_name => '$USP_CS_RX',
            assignment => <<'EOF',
'^\s*C\s+(\S+)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<C> lines.
EOF
        },
        {
            symbol_name => '$USP_D0_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;0 ;%-9s;   ;    ;   ;  ;                ;                ;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<0> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D0_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*0\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<0> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D1_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;1 ;%-9s;   ;%-4d;%-3d;%-2d;                ;                ;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<1> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D1_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*1\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<1> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D2_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;2 ;%-9s;   ;%-4d;%-3d;%-2d;                ;                ;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<2> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D2_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*2\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<2> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D3_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;3 ;         ;   ;    ;   ;  ;                ;                ;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<3> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D3_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*3\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<3> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D4_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;4 ;         ;   ;    ;   ;  ;                ;%-16s;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<4> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D4_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*4\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<4> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D5_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;5 ;         ;   ;    ;   ;  ;%-16s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<5> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D5_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*5\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<5> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D6_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;6 ;%-9s;   ;%-4d;%-3d;  ;                ;                ;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<6> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D6_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*6\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<6> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D7_FRM',
            assignment => <<'EOF',
"D %-4d;%-16s;7 ;         ;   ;    ;   ;  ;                ;%-16s;%-6s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<7> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_D7_RX',
            assignment => <<'EOF',
'^\s*D\s+(\d+)\s*;\s*([^;]+)\s*;\s*7\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<7> C<D> lines.
EOF
        },
        {
            symbol_name => '$USP_DATE_FRM',
            assignment => <<'EOF',
"* Dump date  : %s, %s %d, %d, %2d:%02d %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Dump date> lines.
EOF
        },
        {
            symbol_name => '$USP_DATE_RX',
            assignment => <<'EOF',
'^\s*\*\s+Dump\s+date\s*:\s*\S+\s*,\s*(\S+)\s+(\d+)\s*,\s*(\d+)\s*,\s*(\d+):\s*(\d+)\s*(\S+)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Dump date> lines.
EOF
        },
        {
            symbol_name => '$USP_FILTER_FRM',
            assignment => <<'EOF',
"F     %s %s %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<F> lines.
EOF
        },
        {
            symbol_name => '$USP_FILTER_INFO_FRM',
            assignment => <<'EOF',
"* Filter file info for [%s]\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Filter file info for> lines.
EOF
        },
        {
            symbol_name => '$USP_FILTER_INFO_RX',
            assignment => <<'EOF',
'^\s*\*\s*Filter\s+file\s+info\s+for\s*\[(\S+)\]\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Filter file info for> lines.
EOF
        },
        {
            symbol_name => '$USP_FILTER_RX',
            assignment => <<'EOF',
'^\s*F\s+(\S+)\s+(\S+)\s+(\S+)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<F> lines.
EOF
        },
        {
            symbol_name => '$USP_G_FRM',
            assignment => <<'EOF',
"G %-4d;%-17s;%-17s;%-17s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<G> lines.
EOF
        },
        {
            symbol_name => '$USP_G_RX',
            assignment => <<'EOF',
'^\s*G\s+(\d+)(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<G> lines.
EOF
        },
        {
            symbol_name => '$USP_H1_FRM',
            assignment => <<'EOF',
"H     %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<H> lines with only C<1> field.
EOF
        },
        {
            symbol_name => '$USP_H2_FRM',
            assignment => <<'EOF',
"H     %-50s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<H> lines with C<2> fields.
EOF
        },
        {
            symbol_name => '$USP_HEAD_FRM',
            assignment => <<'EOF',
"* UNISPOOL <%s> configuration dumped on host %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* UNISPOOL E<lt>...E<gt> configuration dumped on host> lines.
EOF
        },
        {
            symbol_name => '$USP_HEAD_RX',
            assignment => <<'EOF',
'^\s*\*\s+UNISPOOL\s+<(\S+)>\s+configuration\s+dumped\s+on\s+host\s+(\S+)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* UNISPOOL E<lt>...E<gt> configuration dumped on host> lines.
EOF
        },
        {
            symbol_name => '$USP_H_RX',
            assignment => <<'EOF',
'^\s*H\s+([^\s;]+)\s*(.*)',
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<H> lines.
EOF
        },
        {
            symbol_name => '$USP_ID_FRM',
            assignment => <<'EOF',
"I %-4d;DEV;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for device C<I> lines.
EOF
        },
        {
            symbol_name => '$USP_ID_RX',
            assignment => <<'EOF',
'^\s*I\s+(\d+)\s*;\s*DEV\b(.*)',
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse device C<I> lines.
EOF
        },
        {
            symbol_name => '$USP_IS_FRM',
            assignment => <<'EOF',
"I %-4d;SYS;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for system C<I> lines.
EOF
        },
        {
            symbol_name => '$USP_IS_RX',
            assignment => <<'EOF',
'^\s*I\s+(\d+)\s*;\s*SYS\b(.*)',
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse system C<I> lines.
EOF
        },
        {
            symbol_name => '$USP_L_FRM',
            assignment => <<'EOF',
"L     %-s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<L> lines.
EOF
        },
        {
            symbol_name => '$USP_L_RX',
            assignment => <<'EOF',
'^\s*L\s+(.+)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<L> lines.
EOF
        },
        {
            symbol_name => '$USP_M_FRM',
            assignment => <<'EOF',
"M     %-16s;%-3s;%-5s;%-1s;%s;%-5s;%-10d;%-10d;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<M> lines.
EOF
        },
        {
            symbol_name => '$USP_M_RX',
            assignment => <<'EOF',
'^\s*M\s+([^\s;]+)\s*(.*)',
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<M> lines.
EOF
        },
        {
            symbol_name => '$USP_N2_FRM',
            assignment => <<'EOF',
"N %-4d;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<N> lines with C<2> fields.
EOF
        },
        {
            symbol_name => '$USP_N3_FRM',
            assignment => <<'EOF',
"N %-4d;%-50s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<N> lines with C<3> fields.
EOF
        },
        {
            symbol_name => '$USP_N5_FRM',
            assignment => <<'EOF',
"N %-4d;%-50s;%-8s;%-4s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<N> lines with C<5> fields.
EOF
        },
        {
            symbol_name => '$USP_ND_FRM',
            assignment => <<'EOF',
"N %-4d;%-50s;%-3s;SERVER;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for device C<N> lines.
EOF
        },
        {
            symbol_name => '$USP_N_RX',
            assignment => <<'EOF',
'^\s*N\s+(\d+)\s*;\s*(\S+)(.*)',
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<N> lines.
EOF
        },
        {
            symbol_name => '$USP_PD_FRM',
            assignment => <<'EOF',
"P %-4d;DEV;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for device C<P> lines.
EOF
        },
        {
            symbol_name => '$USP_PD_RX',
            assignment => <<'EOF',
'^\s*P\s+(\d+)\s*;\s*DEV\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse device C<P> lines.
EOF
        },
        {
            symbol_name => '$USP_S3_FRM',
            assignment => <<'EOF',
"S %-4d;%-16s;3;%-8s;%-9s;%-9s;    ;%-3s;   ;    ;%-4s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<3> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S3_RX',
            assignment => <<'EOF',
'^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*3\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<3> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S6_FRM',
            assignment => <<'EOF',
"S %-4d;%-16s;6;        ;         ;         ;    ;   ;   ;%-4d;%-4s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<6> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S6_RX',
            assignment => <<'EOF',
'^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*6\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<6> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S7_FRM',
            assignment => <<'EOF',
"S %-4d;%-16s;7;        ;         ;         ;    ;   ;   ;%-4d;%-4s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<7> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S7_RX',
            assignment => <<'EOF',
'^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*7\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<7> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S8_FRM',
            assignment => <<'EOF',
"S %-4d;%-16s;8;        ;         ;         ;    ;   ;   ;%-4d;%-4s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for type C<8> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_S8_RX',
            assignment => <<'EOF',
'^\s*S\s+(\d+)\s*;\s*([^;]+)\s*;\s*8\b(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse type C<8> C<S> lines.
EOF
        },
        {
            symbol_name => '$USP_SCOPE_FRM',
            assignment => <<'EOF',
"* Dump scope : %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* Dump scope> lines.
EOF
        },
        {
            symbol_name => '$USP_SCOPE_RX',
            assignment => <<'EOF',
'^\s*\*\s*Dump\s+scope\s*:\s*(.*)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* Dump scope> lines.
EOF
        },
        {
            symbol_name => '$USP_TAIL_FRM',
            assignment => <<'EOF',
"* End of configuration dumped on host %s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<* End of configuration dumped on host> lines.
EOF
        },
        {
            symbol_name => '$USP_TAIL_RX',
            assignment => <<'EOF',
'^\s*\*\s*End\s+of\s+configuration\s+dumped\s+on\s+host\s*(\S+)\s*$';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<* End of configuration dumped on host> lines.
EOF
        },
        {
            symbol_name => '$USP_X_FRM',
            assignment => <<'EOF',
"X %-4d;%-16s;%-16s;%-16s;%s\n";
EOF
            export_tag => [ qw( frm ) ],
            description => <<EOF,
Format for C<X> lines.
EOF
        },
        {
            symbol_name => '$USP_X_RX',
            assignment => <<'EOF',
'^\s*X\s+(\d+)\s*(.*)';
EOF
            export_tag => [ qw( rx ) ],
            description => <<EOF,
Regular expression to parse C<X> lines.
EOF
        },
    ],
} );
