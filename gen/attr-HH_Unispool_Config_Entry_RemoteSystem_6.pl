use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem::6';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
        short_description => 'UNISPOOL type 6 remote system',
        abstract => 'UNISPOOL type 6 remote system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_RemoteSystem_6.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 6 remote systems
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'remote_node_name',
             allow_rx => [ qw(^[\w\.]+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
        },
        {
             method_factory_name => 'os',
             allow_isa => [ qw(HH::Unispool::Config::OS) ],
             mandatory => 1,
             short_description => 'the operating system running on the remote node',
        },
        {
             method_factory_name => 'block_delay',
             allow_rx => [ qw(^\d*$) ],
             default_value => 0,
             short_description => 'the time in seconds UNISPOOL should pause between sending two blocks',
        },
        {
             method_factory_name => 'initially_open',
             type => 'BOOLEAN',
             default_value => 1,
             short_description => 'the communication link should be opened at the moment UNISPOOL is started',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            body => <<'EOF',
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::System::6
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::System::6') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::6::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::System::6'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number() if ( $s->get_number() );
    $opt{name} = $s->get_remote_system_name() if ( $s->get_remote_system_name() );
    $opt{block_delay} = $s->get_block_delay() if ( $s->get_block_delay() );
    $opt{initially_open} = $s->is_initially_open() if ( $s->is_initially_open() );
    $opt{execution_priority} = $s->get_execution_priority() if ( $s->get_execution_priority() );

    # Allow an I and N token
    my $i = undef;
    my $n = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::System::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::6::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::System::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description() if ( $i->get_description() );
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Network') ) {
            defined ($n) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::6::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Network'.");
            $n = $tok;
            $opt{remote_node_name} = $n->get_remote_node_name() if ( $n->get_remote_node_name() );
            $opt{os} = $n->get_os() if ( $n->get_os() );
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::6::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::System::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::RemoteSystem::6->new(\%opt) );
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
    require HH::Unispool::Config::File::Token::Numbered::System::6;
    my $s = HH::Unispool::Config::File::Token::Numbered::System::6->new( {
        number => $self->get_number(),
        remote_system_name => $self->get_name(),
        block_delay => $self->get_block_delay(),
        initially_open => $self->is_initially_open(),
        execution_priority => $self->get_execution_priority(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::System::Info;
    my $i = HH::Unispool::Config::File::Token::Numbered::System::Info->new( {
        number => $self->get_number(),
        description => $self->get_description(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::Network;
    my $n = HH::Unispool::Config::File::Token::Numbered::Network->new( {
        number => $self->get_number(),
        remote_node_name => $self->get_remote_node_name(),
        os => $self->get_os(),
        device_token => 0,
    } );

    # Print the tokens
    $fh->print( $s->write_string() );
    $fh->print( $i->write_string() );
    $fh->print( $n->write_string() );
EOF
        },
    ],
} );
