use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::Device::7';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered::Device)],
        short_description => 'device type C<7> device I<D> token',
        abstract => 'device type C<7> device I<D> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans device type C<7> device I<D> token information.
EOF
    },
    attr_opt => [
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$device_name, \$tail) = \$line =~ /\$USP_D7_RX/;
    defined(\$number) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    \$device_name =~ s/\\s*\$//;
    my \@tail = \$self->_split_tail(\$tail);
    my \$remote_device_name = \$tail[6];
    my \$flags = \$tail[7];
    my \$execution_priority = \$tail[8];
    defined(\$flags) && ( \$flags =~ /h/i ) && throw Error::Simple("ERROR: ${pkg}::read_string, flag 'H' is not allowed in the token's line string.");
    defined(\$flags) && ( \$flags =~ /u/i ) && throw Error::Simple("ERROR: ${pkg}::read_string, flag 'U' is not allowed in the token's line string.");

    # Set attributes
    \$self->set_number(\$number);
    \$self->set_device_name(\$device_name);
    \$self->set_remote_device_name(\$remote_device_name);
    require HH::Unispool::Config::ExecPri;
    \$self->set_execution_priority( HH::Unispool::Config::ExecPri->new( { execution_priority => \$execution_priority } ) );
    \$self->set_initially_spooled( \$flags =~ /i/i );
    \$self->set_networkwide( \$flags =~ /n/i );
    \$self->set_save_printfile( \$flags =~ /s/i );
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    my \$flags = '';
    \$flags .= ' ';
    \$flags .= \$self->is_initially_spooled() ? 'I' : ' ';
    \$flags .= \$self->is_networkwide() ? 'N' : ' ';
    \$flags .= \$self->is_save_printfile() ? 'S' : ' ';
    \$flags .= ' ';
    return(
        sprintf(
            \$USP_D7_FRM,
            \$self->get_number() || 0,
            \$self->get_device_name() || '',
            \$self->get_remote_device_name() || '',
            \$flags || '',
            \$self->get_execution_priority()->get_execution_priority() || '',
        )
    );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::File::Token',
            import_list => [ 'qw( :rx :frm )' ],
        },
    ],
} );
