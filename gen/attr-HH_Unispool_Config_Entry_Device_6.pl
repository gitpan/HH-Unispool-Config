use strict;

my $pkg = 'HH::Unispool::Config::Entry::Device::6';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Device) ],
        short_description => 'UNISPOOL type 6 device',
        abstract => 'UNISPOOL type 6 device',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Device_6.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 6 device
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'device_password',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the password required to access the device',
        },
        {
             method_factory_name => 'block_delay',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the time in seconds UNISPOOL should pause between sending two blocks',
             default_value => 0,
        },
        {
             method_factory_name => 'connect_retry',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the number of seconds UNISPOOL should wait if the connection can not be established immediately',
        },
        {
             method_factory_name => 'initially_spooled',
             type => 'BOOLEAN',
             default_value => 1,
             short_description => 'an automatic STARTSPOOL must be performed when UNISPOOL is started',
        },
        {
             method_factory_name => 'networkwide',
             type => 'BOOLEAN',
             default_value => 1,
             short_description => 'the device must be made available from each node in the configuration cluster',
        },
        {
             method_factory_name => 'save_printfile',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'printfiles printed on this device should be saved',
        },
        {
             method_factory_name => 'execution_priority',
             allow_isa => [ qw(HH::Unispool::Config::ExecPri) ],
             short_description => 'the execution priority of the driver process on MPE hosts',
             default_value => 'HH::Unispool::Config::ExecPri->new( { execution_priority => \'\' } )',
        },
        {
             method_factory_name => 'remote_node_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
        },
        {
             method_factory_name => 'protocol',
             allow_value => [ qw( TCP LPD PJL XPP ) ],
             short_description => 'the protocol to be used for the device',
             default_value => 'TCP',
        },
        {
             method_factory_name => 'server_tcp_port',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the TCP port assigned on the print server',
             default_value => 9100,
        },
        {
             method_factory_name => 'profile_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the profile containing the device initialisation and status checking specification',
        },
        {
             method_factory_name => 'header_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the control procedure to be executed before printing the printfile',
        },
        {
             method_factory_name => 'trailer_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the control procedure to be executed after printing the printfile',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            body => <<'EOF',
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::6
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::Device::6') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::6'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number();
    $opt{name} = $s->get_device_name();
    $opt{device_password} = $s->get_device_password();
    $opt{block_delay} = $s->get_block_delay();
    $opt{connect_retry} = $s->get_connect_retry();
    $opt{initially_spooled} = $s->is_initially_spooled();
    $opt{networkwide} = $s->is_networkwide();
    $opt{save_printfile} = $s->is_save_printfile();
    $opt{execution_priority} = $s->get_execution_priority();

    # Allow N, X and I tokens
    my $n = undef;
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Network') ) {
            defined ($p) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::0::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Network'.");
            $n = $tok;
            $opt{remote_node_name} = $n->get_remote_node_name();
            $opt{protocol} = $n->get_protocol();
            $opt{server_tcp_port} = $n->get_server_tcp_port();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{profile_name} = $x->get_profile_name();
            $opt{header_name} = $x->get_header_name();
            $opt{trailer_name} = $x->get_trailer_name();
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::6->new(\%opt) );
EOF
        },
    ],
    meth_opt => [
        {
            method_name => 'diff',
        },
        {
            method_name => 'write',
            body => <<'EOF',
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::Device::6;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::6->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        device_password => $self->get_device_password(),
        block_delay => $self->get_block_delay(),
        connect_retry => $self->get_connect_retry(),
        initially_spooled => $self->is_initially_spooled(),
        networkwide => $self->is_networkwide(),
        save_printfile => $self->is_save_printfile(),
        execution_priority => $self->get_execution_priority(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::Network;
    my $n = HH::Unispool::Config::File::Token::Numbered::Network->new( {
        number => $self->get_number(),
        remote_node_name => $self->get_remote_node_name(),
        protocol => $self->get_protocol(),
        server_tcp_port => $self->get_server_tcp_port(),
        device_token => 1,
    } );

    require HH::Unispool::Config::File::Token::Numbered::X;
    my $x = HH::Unispool::Config::File::Token::Numbered::X->new( {
        number => $self->get_number(),
        profile_name => $self->get_profile_name(),
        header_name => $self->get_header_name(),
        trailer_name => $self->get_trailer_name(),
        filter_name => $self->get_filter_name(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::Device::Info;
    my $i = HH::Unispool::Config::File::Token::Numbered::Device::Info->new( {
        number => $self->get_number(),
        description => $self->get_description(),
    } );

    # Print the tokens
    $fh->print( $d->write_string() );
    $fh->print( $i->write_string() );
    $fh->print( $n->write_string() );
    $fh->print( $x->write_string() );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::ExecPri',
        },
    ],
} );
