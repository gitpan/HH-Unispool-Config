use strict;

my $pkg = 'HH::Unispool::Config::Entry::Device::5';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Device) ],
        short_description => 'UNISPOOL type 5 device',
        abstract => 'UNISPOOL type 5 device',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Device_5.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 5 device
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'remote_device_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the device on the remote system that will receive the output',
             mandatory => 1,
             allow_empty => 0,
        },
        {
             method_factory_name => 'remote_system_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the system to which the output for this device must be routed',
             mandatory => 1,
             allow_empty => 0,
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

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::5
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::Device::5') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::5'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number();
    $opt{name} = $s->get_device_name();
    $opt{remote_device_name} = $s->get_remote_device_name();
    $opt{remote_system_name} = $s->get_remote_system_name();

    # Allow X and I tokens
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{header_name} = $x->get_header_name();
            $opt{trailer_name} = $x->get_trailer_name();
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::5->new(\%opt) );
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
    require HH::Unispool::Config::File::Token::Numbered::Device::5;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::5->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        remote_device_name => $self->get_remote_device_name(),
        remote_system_name => $self->get_remote_system_name(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::X;
    my $x = HH::Unispool::Config::File::Token::Numbered::X->new( {
        number => $self->get_number(),
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
    $fh->print( $x->write_string() );
EOF
        },
    ],
} );
