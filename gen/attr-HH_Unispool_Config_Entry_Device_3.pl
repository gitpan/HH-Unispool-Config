use strict;

my $pkg = 'HH::Unispool::Config::Entry::Device::3';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Device) ],
        short_description => 'UNISPOOL type 3 device',
        abstract => 'UNISPOOL type 3 device',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Device_3.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 3 device
EOF
    },
    attr_opt => [
        {
            method_factory_name => 'networkwide',
            type => 'BOOLEAN',
            default_value => 1,
            short_description => 'the device must be made available from each node in the configuration cluster',
        },
        {
            method_factory_name => 'initially_spooled',
            type => 'BOOLEAN',
            default_value => 1,
            short_description => 'an automatic STARTSPOOL must be performed when UNISPOOL is started',
        },
        {
            method_factory_name => 'execution_priority',
            allow_isa => [ qw(HH::Unispool::Config::ExecPri) ],
            short_description => 'the execution priority of the driver process on MPE hosts',
            default_value => 'HH::Unispool::Config::ExecPri->new( { execution_priority => \'\' } )',
        },
        {
            method_factory_name => 'member_device_name',
            type => 'MULTI',
            unique => 1,
            allow_rx => [ qw(^\w+$) ],
            short_description => 'the list of names of the devices that can be accessed through the group device',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            body => <<'EOF',
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::3
    my $d = $tokenizer->get();
    $d->isa('HH::Unispool::Config::File::Token::Numbered::Device::3') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::3'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $d->get_number();
    $opt{name} = $d->get_device_name();
    $opt{networkwide} = $d->is_networkwide();
    $opt{initially_spooled} = $d->is_initially_spooled();
    $opt{execution_priority} = $d->get_execution_priority();

    # Allow X and I tokens
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $d->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::3->new(\%opt) );
EOF
        },
    ],
    meth_opt => [
        {
            method_name => 'add_members_from_tokenizer',
            parameter_description => 'TOKENIZER',
            short_description => 'write the C<G> lines for the device',
            description => <<EOF,
Adds group members to using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $self = shift;
    my $tokenizer = shift;

    # Allow G tokens
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::Group') ||
                $tok->get_number() != $self->get_number() ) {
            $tokenizer->unget();
            last;
        }

        # Add the members
        $self->add_member_device_name( $tok->values_member_device_name() );
    }
EOF
        },
        {
            method_name => 'diff',
        },
        {
            method_name => 'write_group',
            parameter_description => 'FILE_HANDLE',
            short_description => 'write the C<G> lines for the device',
            description => <<EOF,
Writes the group members of the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $self = shift;
    my $fh = shift;

    my @all_member = sort( $self->values_member_device_name() );
    while ( scalar(@all_member) ) {
        my @tok_member = ();

        for ( my $i = 0; $i < 4; $i ++ ) {
             my $member = shift(@all_member);
             defined ($member) || last;
             push(@tok_member, $member);
        }

        require HH::Unispool::Config::File::Token::Numbered::Device::Group;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Group->new( {
            number => $self->get_number(),
            member_device_name => [ @tok_member ],
        } );

        $fh->print( $tok->write_string() );
    }
EOF
        },
        {
            method_name => 'write',
            description => <<EOF,
Writes the entry to the specified file handle, omitting the group members (see L<write_group()>). C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::Device::3;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::3->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        networkwide => $self->is_networkwide(),
        initially_spooled => $self->is_initially_spooled(),
        execution_priority => $self->get_execution_priority(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::X;
    my $x = HH::Unispool::Config::File::Token::Numbered::X->new( {
        number => $self->get_number(),
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
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::ExecPri',
        },
    ],
} );
