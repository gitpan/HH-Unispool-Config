use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem::3';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
        short_description => 'UNISPOOL type 3 remote system',
        abstract => 'UNISPOOL type 3 remote system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_RemoteSystem_3.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 3 remote systems
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'acct',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the remote login account (is not available on development system used)',
        },
        {
             method_factory_name => 'apass',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the account password (is not available on development system used)',
        },
        {
             method_factory_name => 'upass',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the user paccword (is not available on development system used)',
        },
        {
             method_factory_name => 'timeout',
             allow_rx => [ qw(^\d*$) ],
             default_value => 180,
             short_description => 'the delay before closing the link after transfering the last request (in seconds) (is not available on development system used)',
        },
        {
             method_factory_name => 'initially_open',
             type => 'BOOLEAN',
             short_description => 'the communication link should be opened at the moment UNISPOOL is started',
        },
        {
             method_factory_name => 'high_priority_login',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'the login must be high priotity (is not available on development system used)',
        },
        {
             method_factory_name => 'remote_node_name',
             allow_rx => [ qw(^[\w\.]+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            body => <<'EOF',
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::System::3
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::System::3') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::System::3'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number() if ( $s->get_number() );
    $opt{name} = $s->get_remote_system_name() if ( $s->get_remote_system_name() );
    $opt{acct} = $s->get_acct() if ( $s->get_acct() );
    $opt{apass} = $s->get_apass() if ( $s->get_apass() );
    $opt{upass} = $s->get_upass() if ( $s->get_upass() );
    $opt{timeout} = $s->get_timeout() if ( $s->get_timeout() );
    $opt{high_priority_login} = $s->is_high_priority_login() if ( $s->is_high_priority_login() );
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
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::System::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description() if ( $i->get_description() );
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Network') ) {
            defined ($n) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Network'.");
            $n = $tok;
            $opt{remote_node_name} = $n->get_remote_node_name() if ( $n->get_remote_node_name() );
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::System::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::RemoteSystem::3->new(\%opt) );
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
    require HH::Unispool::Config::File::Token::Numbered::System::3;
    my $s = HH::Unispool::Config::File::Token::Numbered::System::3->new( {
        number => $self->get_number(),
        remote_system_name => $self->get_name(),
        acct => $self->get_acct(),
        apass => $self->get_apass(),
        upass => $self->get_upass(),
        timeout => $self->get_timeout(),
        high_priority_login => $self->is_high_priority_login(),
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
