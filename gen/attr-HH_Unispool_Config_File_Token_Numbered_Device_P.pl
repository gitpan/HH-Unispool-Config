use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::Device::P';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'device I<P> token',
        abstract => 'device I<P> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans device I<P> token information.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'device_file',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the device file to which the device is connected',
        },
    ],
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$tail) = \$line =~ /\$USP_PD_RX/;
    defined(\$number) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my \@tail = \$self->_split_tail(\$tail);
    my \$device_file = \$tail[0];

    # Set attributes
    \$self->set_number(\$number);
    defined(\$device_file) && \$self->set_device_file(\$device_file);
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_PD_FRM,
            \$self->get_number() || 0,
            \$self->get_device_file() || '',
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
