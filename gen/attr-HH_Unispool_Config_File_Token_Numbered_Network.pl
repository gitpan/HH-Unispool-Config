use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::Network';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'network I<N> token',
        abstract => 'network I<N> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans network I<N> token information.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'remote_node_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
        },
        {
             method_factory_name => 'os',
             allow_isa => [ qw(HH::Unispool::Config::OS) ],
             short_description => 'the operating system running on this system',
        },
        {
             method_factory_name => 'transfer_size',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the size of the data blocks to be transfered',
        },
        {
             method_factory_name => 'transfer_time_out',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the time in which a transfer must be completed to be considered successful',
        },
        {
             method_factory_name => 'protocol',
             allow_value => [ qw( TCP LPD PJL XPP ) ],
             short_description => 'the protocol to be used for the device',
        },
        {
             method_factory_name => 'server_tcp_port',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the TCP port assigned on the print server',
        },
        {
             method_factory_name => 'device_token',
             type => 'BOOLEAN',
             short_description => 'this is a device token',
        },
    ],
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$remote_node_name, \$tail) = \$line =~ /\$USP_N_RX/;
    defined(\$number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    \$remote_node_name =~ s/\\s*\$//;
    my \@tail = \$self->_split_tail(\$tail);
    ( scalar(\@tail) > 3 ) && throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::read_string, parameter 'LINE' contains too many ';' separated entries after the remote node name '\$remote_node_name'.");

    # Set attributes
    \$self->set_number(\$number);
    defined(\$remote_node_name) && \$self->set_remote_node_name(\$remote_node_name);

    if (defined ( \$tail[1] ) && \$tail[1] eq 'SERVER') {
        \$self->set_device_token(1);
        defined( \$tail[0] ) && \$self->set_protocol( \$tail[0] );
        defined( \$tail[2] ) && \$self->set_server_tcp_port( \$tail[2] );
    }
    else {
        \$self->set_device_token(0);
        if ( defined( \$tail[0] ) && \$tail[0] ) {
            require HH::Unispool::Config::OS;
            \$self->set_os( HH::Unispool::Config::OS->new( { os => \$tail[0] } ) );
        }
        defined( \$tail[1] ) && \$self->set_transfer_size( \$tail[1] );
        defined( \$tail[2] ) && \$self->set_transfer_time_out( \$tail[2] );
    }
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    \$self->is_device_token() && return(
        sprintf(
            \$USP_ND_FRM,
            \$self->get_number() || 0,
            \$self->get_remote_node_name() || '',
            \$self->get_protocol() || '',
            \$self->get_server_tcp_port() || '',
        )
    );

    if ( defined( \$self->get_os() ) && defined( \$self->get_transfer_size() ) && \$self->get_transfer_size() || defined( \$self->get_transfer_time_out() ) && \$self->get_transfer_time_out() ) {
        return(
            sprintf(
                \$USP_N5_FRM,
                \$self->get_number() || 0,
                \$self->get_remote_node_name() || '',
                \$self->get_os()->get_os() || '',
                \$self->get_transfer_size() || 0,
                \$self->get_transfer_time_out() || 0,
            )
        );
    }
    if ( defined( \$self->get_os() ) ) {
        return(
            sprintf(
                \$USP_N3_FRM,
                \$self->get_number() || 0,
                \$self->get_remote_node_name() || '',
                \$self->get_os()->get_os() || '',
            )
        );
    }
    return(
        sprintf(
            \$USP_N2_FRM,
            \$self->get_number() || 0,
            \$self->get_remote_node_name() || '',
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
