use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::Device::5';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered::Device)],
        short_description => 'device type C<5> device I<D> token',
        abstract => 'device type C<5> device I<D> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans device type C<5> device I<D> token information.
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
    my (\$number, \$device_name, \$tail) = \$line =~ /\$USP_D5_RX/;
    defined(\$number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::5::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    \$device_name =~ s/\\s*\$//;
    my \@tail = \$self->_split_tail(\$tail);
    my \$remote_system_name = \$tail[5];
    my \$remote_device_name = \$tail[6];

    # Set attributes
    \$self->set_number(\$number);
    defined(\$device_name) && \$self->set_device_name(\$device_name);
    defined(\$remote_system_name) && \$self->set_remote_system_name(\$remote_system_name);
    defined(\$remote_device_name) && \$self->set_remote_device_name(\$remote_device_name);
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_D5_FRM,
            \$self->get_number() || 0,
            \$self->get_device_name() || '',
            \$self->get_remote_system_name() || '',
            \$self->get_remote_device_name() || '',
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
