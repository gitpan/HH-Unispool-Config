use strict;

my $pkg = 'HH::Unispool::Config';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'HollandHouse\' UNISPOOL configuration',
        abstract => 'HollandHouse\' UNISPOOL configuration',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config.pl', '.'),
        description => <<EOF,
C<${pkg}> manages HollandHouse\' UNISPOOL configuration files. Files can be read, written, generated from scratch and C<diff>-ed.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'version',
             allow_rx => [ qw(^.+$) ],
             default_value => 'the version number of the installed UNISPOOL instance or C<0>',
             allow_empty => 0,
             short_description => 'the version in the comment',
        },
        {
             method_factory_name => 'diff_time',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<time> attribtute',
        },
        {
             method_factory_name => 'diff_host',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<host> attribtute',
        },
        {
             method_factory_name => 'diff_number',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<number> attribtutes of devices and remote systems',
        },
        {
             method_factory_name => 'diff_version',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<version> attribtute',
        },
        {
             method_factory_name => 'host',
             allow_rx => [ qw(^.+$) ],
             default_value => 'the first part of C<&Sys::Hostname::hostname()>',
             allow_empty => 0,
             short_description => 'the host in the comment',
        },
        {
             method_factory_name => 'time',
             allow_rx => [ qw(^\d+$) ],
             default_value => 'time()',
             allow_empty => 0,
             short_description => 'the date in the comment in Unix time',
        },
        {
             method_factory_name => 'scope',
             allow_isa => [ qw(HH::Unispool::Config::Scope) ],
             default_value => 'HH::Unispool::Config::Scope->new()',
             allow_empty => 0,

        },
        {
             method_factory_name => 'filter',
             type => 'MULTI',
             unique => 1,
             associative => 1,
             method_key => 1,
             id_method => 'get_name',
             allow_isa => [ qw(HH::Unispool::Config::Entry::Filter) ],
             short_description => 'the list of filters',
        },
        {
             method_factory_name => 'system',
             type => 'MULTI',
             unique => 1,
             associative => 1,
             method_key => 1,
             id_method => 'get_name',
             allow_isa => [ qw(HH::Unispool::Config::Entry::System) ],
             short_description => 'the list of systems',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_file',
            parameter_description => 'FILE',
            description => <<EOF,
Constructs a new C<HH::Unispool::Config> object using a file. C<FILE> is either a file name or an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<EOF,
    my \$class = shift;
    my \$file = shift;

    # The file handle
    my \$fh;

    # Check if we already have a file handle
    if ( ref(\$file) ) {
        \$file->isa('IO::Handle') ||
            throw Error::Simple("ERROR: ${pkg}::new_from_file, specified 'FILE' parameter is not an 'IO::Handle' object.");
        \$fh = \$file;
    } else {
        require IO::File;
        \$fh = IO::File->new("< \$file");
        defined(\$fh) ||
            throw Error::Simple("ERROR: ${pkg}::new_from_file, failed to open file '\$file' for reading.");
    }

    # The option hash to eventually create the object
    my \%opt = ();

    # Make a tokenizer
    require HH::Unispool::Config::File::Tokenizer;
    my \$tokenizer = HH::Unispool::Config::File::Tokenizer->new( { file => \$fh } );

    # Expect a comment header
    my \$ch = \$tokenizer->get();
    my \$line = \$tokenizer->input_line_number();
    &UNIVERSAL::isa(\$ch, 'HH::Unispool::Config::File::Token::Comment::Head') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Head' on or directly after line '\$line'.");

    # Options 'host' and 'version'
    \$opt{host} = \$ch->get_host();
    \$opt{version} = \$ch->get_version();

    # Expect a comment date
    my \$cd = \$tokenizer->get();
    \$line = \$tokenizer->input_line_number();
    &UNIVERSAL::isa(\$cd, 'HH::Unispool::Config::File::Token::Comment::Date') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Date' on or directly after line '\$line'.");

    # Option 'time'
    \$opt{time} = \$cd->get_time();

    # Expect a comment scope
    my \$tcs = \$tokenizer->get();
    \$line = \$tokenizer->input_line_number();
    &UNIVERSAL::isa(\$tcs,
                        'HH::Unispool::Config::File::Token::Comment::Scope') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Scope' on or directly after line '\$line'.");

    # Option 'scope'
    \$opt{scope} = \$tcs->get_scope();

    # Check for configuration server info comment
    my \$cs = undef;
    my \%bcs = ();
    if ( \$tcs->get_scope()->exists_scope('_Server_') ) {
        # Expect HH::Unispool::Config::File::Token::Comment::Cs token
        my \$csc = \$tokenizer->get();
        \$line = \$tokenizer->input_line_number();
        &UNIVERSAL::isa(\$csc,
                    'HH::Unispool::Config::File::Token::Comment::Cs') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Cs' on or directly after line '\$line'.");

        # Expect ONE HH::Unispool::Config::File::Token::Unnumbered::Cs token
        my \$csrv = \$tokenizer->get();
        \$line = \$tokenizer->input_line_number();
        &UNIVERSAL::isa(\$csrv,
                    'HH::Unispool::Config::File::Token::Unnumbered::Cs') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Unnumbered::Cs' on or directly after line '\$line'.");
        \$cs = \$csrv->get_hostname();

        # Expect 0 or more HH::Unispool::Config::File::Token::Unnumbered::Bcs
        # tokens
        while ( my \$bsrv = \$tokenizer->get() ) {
            # Break on different token
            if (! \$bsrv->isa(
                    'HH::Unispool::Config::File::Token::Unnumbered::Bcs') ) {
                \$tokenizer->unget();
                last;
            }

            # Check if this hostname is defined as CS
            ( \$bsrv->get_hostname() eq \$cs ) &&
                throw Error::Simple("ERROR: ${pkg}::new_from_file, token of class 'HH::Unispool::Config::File::Token::Unnumbered::Bcs' contains the value of the HH::Unispool::Config::File::Token::Unnumbered::Cs token on or directly after line '\$line'.");

            # Check if this hostname is defined as BCS
            exists( \$bcs{ \$bsrv->get_hostname() } ) &&
                throw Error::Simple("ERROR: ${pkg}::new_from_file, token of class 'HH::Unispool::Config::File::Token::Unnumbered::Bcs' defined twice with same host name on or directly after line '\$line'.");

            # Remember the BCS
            \$bcs{ \$bsrv->get_hostname() } = 1;
        }

        # Check if more than 7 bcs-es are defined
        if ( scalar( keys(\%bcs) ) > 7 ) {
            my \$bcs = join( '\\', \\'', sort( keys(\%bcs) ) );
            throw Error::Simple("ERROR: ${pkg}::new_from_file, too many backup configuration servers declared '\$bcs' on or directly after line '\$line'.");
        }
    }

    # Check for filter file info comment
    my \%filter = ();
    if ( \$tcs->get_scope()->exists_scope('_Script_') ) {
        # Expect HH::Unispool::Config::File::Token::Comment::Filter token
        my \$csc = \$tokenizer->get();
        \$line = \$tokenizer->input_line_number();
        &UNIVERSAL::isa(\$csc,
                    'HH::Unispool::Config::File::Token::Comment::Filter') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Filter' on or directly after line '\$line'.");

        # Expect 1 or more HH::Unispool::Config::File::Token::Unnumbered::Filter
        # tokens
        while ( my \$tok = \$tokenizer->get() ) {
            # Get the last read line number
            \$line = \$tokenizer->input_line_number();

            # Unget the token as it is not processed inside this loop
            \$tokenizer->unget();

            # Only process HH::Unispool::Config::File::Token::Unnumbered::Filter
            if (! \$tok->isa(
                    'HH::Unispool::Config::File::Token::Unnumbered::Filter') ) {
                last;
            }

            # Read the filter
            require HH::Unispool::Config::Entry::Filter;
            my \$filter = HH::Unispool::Config::Entry::Filter->
                                                new_from_tokenizer(\$tokenizer);

            # Check if this filter is already defined
            my \$name = \$filter->get_name();
            exists( \$filter{\$name} ) &&
                throw Error::Simple("ERROR: ${pkg}::new_from_file, token of class 'HH::Unispool::Config::File::Token::Unnumbered::Filter' defined twice with same name '\$name' on or directly after line '\$line'.");

            # Remember the filter
            \$filter{\$name} = \$filter;
        }

        # Check for at least 1 filter
        scalar(\%filter) ||
                throw Error::Simple("ERROR: ${pkg}::new_from_file, expected at least one token of class 'HH::Unispool::Config::File::Token::Unnumbered::Filter' on or directly after line '\$line'.");

        # Option 'filter'
        \$opt{filter} = [ values(\%filter) ];
    }

    # Read all systems
    if ( \$tcs->get_scope()->exists_scope('_Network_') ||
         \$tcs->get_scope()->exists_scope('_Local_') ||
         \$tcs->get_scope()->exists_scope('System=*') ) {

        my \%system = ();
        while(my \$tok = \$tokenizer->get() ) {
            # Get the last read line number
            \$line = \$tokenizer->input_line_number();

            # Unget the token as it is not processed inside this loop
            \$tokenizer->unget();

            # Only process HH::Unispool::Config::File::Token::Comment::Misc
            if ( ! \$tok->isa(
                        'HH::Unispool::Config::File::Token::Comment::Misc') ) {
                last;
            }

            # Read the system
            require HH::Unispool::Config::Entry::System;
            my \$system = HH::Unispool::Config::Entry::System->
                                                new_from_tokenizer(\$tokenizer);

            # Check if the system is expected
            my \$name = \$system->get_name();
            if ( \$name eq '_Network_' ) {
                \$tcs->get_scope()->exists_scope('_Network_') ||
                    throw Error::Simple("ERROR: ${pkg}::new_from_file, found system named '_Network_' without '_Network_' scope on or directly after line '\$line'.");
            }
            elsif ( \$name eq '_Local_' ) {
                \$tcs->get_scope()->exists_scope('_Local_') ||
                    throw Error::Simple("ERROR: ${pkg}::new_from_file, found system named '_Local_' without '_Local_' scope on or directly after line '\$line'.");
            }
            elsif ( ! \$tcs->get_scope()->exists_scope('System=*') ) {
                throw Error::Simple("ERROR: ${pkg}::new_from_file, found system named '\$name' without 'System=*' scope on or directly after line '\$line'.");
            }
            elsif ( exists(\$system{\$name} ) ) {
                throw Error::Simple("ERROR: ${pkg}::new_from_file, multiple declarations of system named '\$name' on or directly after line '\$line'.");
            }

            # Remember system
            \$system{\$name} = \$system;
        }

        # Check if the CS/BCS entries made sense. Also set the system types.
        if ( \$tcs->get_scope()->exists_scope('_Server_') ) {
            # Check CS
            exists( \$system{\$cs} ) ||
                throw Error::Simple("ERROR: ${pkg}::new_from_file, system named '\$cs' defined as configuration server but no system entry found further on.");

            # Check BCSes
            foreach my \$bcs ( sort( keys(\%bcs) ) ) {
                exists( \$system{\$bcs} ) ||
                    throw Error::Simple("ERROR: ${pkg}::new_from_file, system named '\$bcs' defined as backup configuration server but no system entry found further on.");
            }

            # Set the system types
            foreach my \$system ( keys(\%system) ) {
                if ( (\$system{\$system})->get_name() eq \$cs ) {
                    \$system{\$system}->set_type('cs');
                }
                elsif ( exists( \$bcs{ \$system{\$system}->get_name() } ) ) {
                    \$system{\$system}->set_type('bcs');
                }
                else {
                    \$system{\$system}->set_type('cc');
                }
            }
        }

        # Option 'system'
        \$opt{system} = [ values(\%system) ];
    }

    # Expect a comment tail
    my \$ct = \$tokenizer->get();
    \$line = \$tokenizer->input_line_number();
    &UNIVERSAL::isa(\$ct, 'HH::Unispool::Config::File::Token::Comment::Tail') ||
        throw Error::Simple("ERROR: ${pkg}::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Tail' on or directly after line '\$line'.");

    # Check if host name in head and tail is identical
    if ( \$ch->get_host() ne \$ct->get_host() ) {
        my \$hh = \$ch->get_host();
        my \$ht = \$ct->get_host();
        throw Error::Simple("ERROR: ${pkg}::new_from_file, host names in head ('\$hh') and tail ('\$ht') comment differ on or directly after line '\$line'.");
    }

    # Create object and return it
    return( HH::Unispool::Config->new(\\\%opt) );
EOF
        },
        {
            method_name => 'new_from_unispool',
            description => <<EOF,
Dumps the configuration of the UNISPOOL instance running on this machine into a temporary file, creates a new C<HH::Unispool::Config> object using the temporary file and cleans up the temporary file. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $class = shift;

    # Throw an exception if no unispool user on system
    my @pw = getpwnam('unispool');
    scalar(@pw) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_unispool, you don't have a 'unisppol' user on this system.");

    # Make a temporary file
    use IO::File;
    use POSIX qw (tmpnam);
    my $fn = '';
    my $fh = undef;
    while (!defined ($fh)) {
        $fn = tmpnam();
        $fh = IO::File->new ($fn, O_RDWR|O_CREAT|O_EXCL);
        $fh->close();
    }

    # Issue a utility command and try to dump the configuration
    my $cmd = "echo y | $pw[7]/bin/utility 'config -dump $fn' -1 1>/dev/null 2>&1";
    system($cmd);
    my $ex = $?>>8;
    if ($ex) {
        unlink($fn);
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_unispool, command '$cmd' exited with code '$ex'.");
    }

    # Create a config file using new_from_file()
    my $cfg;
    try {
        $cfg = HH::Unispool::Config->new_from_file( $fn );
    }
    catch Error::Simple with {
        my $e = shift;
        unlink($fn);
        throw Error::Simple($e->{-text});
    };
    return($cfg);
EOF
        },
    ],
    meth_opt => [
        {
            method_name => '_mk_default_version',
            documented => 0,
            body => <<'EOF',
    # Return 0 if no unispool user on system
    my @pw = getpwnam('unispool');
    scalar(@pw) || return(0);

    # Issue an operator command and try to obtain the version number from its
    # output
    my $cmd = "$pw[7]/bin/operator -1 2>/dev/null < /dev/null";
    use IO::File;
    my $fh = IO::File->new("$cmd |");
    my $line = $fh->getline();
    my ($vers) = $line =~ /UNISPOOL\s*<(\S+)>/;

    # Return the version
    return($vers || 0);
EOF
        },
        {
            method_name => 'diff',
            parameter_description => 'TO',
            description => <<EOF,
Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.
EOF
        },
        {
            method_name => 'write_to_unispool',
            description => <<EOF,
Writes the object to file and loads the file into UNISPOOL using C<config -load>. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $self = shift;

    # Throw an exception if no unispool user on system
    my @pw = getpwnam('unispool');
    scalar(@pw) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::write_to_unispool, you don't have a 'unisppol' user on this system.");

    # Make a temporary file
    use IO::File;
    use POSIX qw (tmpnam);
    my $fn = '';
    my $fh = undef;
    while (!defined ($fh)) {
        $fn = tmpnam();
        $fh = IO::File->new ($fn, O_RDWR|O_CREAT|O_EXCL);
        $fh->close();
    }

    # Write the configuration to the temporary file
    try {
        $self->write( $fn );
    }
    catch Error::Simple with {
        my $e = shift;
        unlink($fn);
        throw Error::Simple($e->{-text});
    };

    # Issue a utility command and try to load the configuration
    my $cmd = "$pw[7]/bin/utility 'config -load -s $fn' -1 1>/dev/null 2>&1";
    system($cmd);
    my $ex = $?>>8;
    unlink($fn);
    ($ex) &&
        throw Error::Simple("ERROR: HH::Unispool::Config::write_to_unispool, command '$cmd' exited with code '$ex'.");
EOF
        },
        {
            method_name => 'write',
            parameter_description => 'FILE',
            description => <<EOF,
Writes the object to file. C<FILE> is either a file name or an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
            body => <<'EOF',
    my $self = shift;
    my $file = shift;

    # The file handle
    my $fh;

    # Check if we already have a file handle
    if ( ref($file) ) {
        $file->isa('IO::Handle') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, specified 'FILE' parameter is not an 'IO::Handle' object.");
        $fh = $file;
    } else {
        require IO::File;
        $fh = IO::File->new("> $file");
        defined($fh) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, failed to open file '$file' for writing.");
    }

    # Write a HH::Unispool::Config::File::Token::Comment::Head
    require HH::Unispool::Config::File::Token::Comment::Head;
    my $tok = HH::Unispool::Config::File::Token::Comment::Head->new( {
        host => $self->get_host(),
        version => $self->get_version(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print("\n");

    # Write a HH::Unispool::Config::File::Token::Comment::Date
    require HH::Unispool::Config::File::Token::Comment::Date;
    $tok = HH::Unispool::Config::File::Token::Comment::Date->new( {
        time => $self->get_time(),
    } );
    $fh->print( $tok->write_string() );

    # Write a HH::Unispool::Config::File::Token::Comment::Scope
    require HH::Unispool::Config::File::Token::Comment::Scope;
    $tok = HH::Unispool::Config::File::Token::Comment::Scope->new( {
        scope => $self->get_scope(),
    } );
    $fh->print( $tok->write_string() );

    # Empty lines
    $fh->print("\n");
    $fh->print("\n");

    # Write configuration server info comment
    if ( $self->get_scope()->exists_scope('_Server_') ) {
        my $cs = undef;
        my %bcs = ();

        # Search the config server and the backup config server(s)
        foreach my $system ( $self->values_system() ) {
            if ( defined( $system->get_type() ) && $system->get_type() eq 'cs' ) {
                if ( defined($cs) ) {
                    my $cs1 = $cs->get_name();
                    my $cs2 = $system->get_name();
                    throw Error::Simple("ERROR: HH::Unispool::Config::write, multiple configuration servers declared like '$cs1' and '$cs2'.");
                }
                $cs = $system;
            }
            elsif ( $system->get_type() eq 'bcs' ) {
                $bcs{ $system->get_name() } = $system;
            }
        }

        # Check if the cs is defined
        if ( ! defined($cs) ) {
            throw Error::Simple("ERROR: HH::Unispool::Config::write, scope '_Server_' set but no configuration server declared.");
        }

        # Check if more than 7 bcs-es are defined
        if ( scalar( keys(%bcs) ) > 7 ) {
            my $bcs = join( '\', \'', sort( keys(%bcs) ) );
            throw Error::Simple("ERROR: HH::Unispool::Config::write, too many backup configuration servers declared '$bcs'.");
        }

        # Write configuration server comment token
        require HH::Unispool::Config::File::Token::Comment::Cs;
        $tok = HH::Unispool::Config::File::Token::Comment::Cs->new( {
            net_desc => '_Network_',
        } );
        $fh->print( $tok->write_string() );

        # Empty line
        $fh->print("\n");

        # Write configuration server token
        require HH::Unispool::Config::File::Token::Unnumbered::Cs;
        $tok = HH::Unispool::Config::File::Token::Unnumbered::Cs->new( {
            hostname => $cs->get_name(),
        } );
        $fh->print( $tok->write_string() );

        # Write backup configuration server token(s)
        foreach my $bcs (sort (keys (%bcs) ) ) {
            require HH::Unispool::Config::File::Token::Unnumbered::Bcs;
            $tok = HH::Unispool::Config::File::Token::Unnumbered::Bcs->new( {
                hostname => $bcs{$bcs}->get_name(),
            } );
            $fh->print( $tok->write_string() );

        }

        # Empty line
        $fh->print("\n");
    }

    # Write filter file info comment
    if ( $self->get_scope()->exists_scope('_Script_') ) {
        # Write filter file info comment token
        require HH::Unispool::Config::File::Token::Comment::Filter;
        $tok = HH::Unispool::Config::File::Token::Comment::Filter->new( {
            net_desc => '_Network_',
        } );
        $fh->print( $tok->write_string() );

        # Empty line
        $fh->print("\n");

        # Write filter entries
        foreach my $name (sort ( $self->keys_filter() ) ) {
            ( $self->values_filter($name) )[0]->write($fh);
        }

        # Empty line
        $fh->print("\n");
    }

    # Empty line
    $fh->print("\n");

    # Check if the _Network_ system is desired and write it
    if ( $self->get_scope()->exists_scope('_Network_') ) {
        $self->exists_system('_Network_') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Network_' defined in scope but no '_Network_' system defined in the configuration.");

        ( $self->values_system('_Network_') )[0]->write($fh);
    }
    else {
        $self->exists_system('_Network_') &&
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Network_' not defined in scope but a '_Network_' system is defined in the configuration.");
    }

    # Check if the _Local_ system is desired and write it
    if ( $self->get_scope()->exists_scope('_Local_') ) {
        $self->exists_system('_Local_') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Local_' defined in scope but no '_Local_' system defined in the configuration.");

        ( $self->values_system('_Local_') )[0]->write($fh);
    }
    else {
        $self->exists_system('_Local_') &&
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Local_' not defined in scope but a '_Local_' system is defined in the configuration.");
    }

    # Write the system entries
    if ( $self->get_scope()->exists_scope('System=*') ) {
        my $count = 0;
        foreach my $name ( sort( $self->keys_system() ) ) {
            # Skip _Network_ and _Local_
            ( $name eq '_Network_' ) && next;
            ( $name eq '_Local_' ) && next;

            # Count one up
            $count ++ ;

            # Write the system
            ( $self->values_system($name) )[0]->write($fh);
        }

        # Check if at least one system was written
        ( $count ) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, 'System=*' is defined in scope not a single 'System=*' system is defined in the configuration.");
    }

    # Empty line
    $fh->print("\n");

    # Write a HH::Unispool::Config::File::Token::Comment::Tail
    require HH::Unispool::Config::File::Token::Comment::Tail;
    $tok = HH::Unispool::Config::File::Token::Comment::Tail->new( {
        host => $self->get_host(),
    } );
    $fh->print( $tok->write_string() );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::Scope',
        },
    ],
} );
