use strict;

my $pkg = 'HH::Unispool::Config::Entry::System';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'Class to group remote systems and devices',
        abstract => 'Class to group remote systems and devices',
        base => [ qw(HH::Unispool::Config::Entry) ],
        synopsis => &::read_synopsis('syn-HH_Unispool_Config.pl', '.'),
        description => <<EOF,
C<${pkg}> groups remote systems and devices from UNISPOOL configuration.
In different words, it groups from a configuration file anything between

 * Miscellaneous configuration items for [...]

line and the following

 * Miscellaneous configuration items for [...]

line or the following

 * End of configuration dumped on host ...

line.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'diff_number',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<number> attribtutes',
        },
        {
             method_factory_name => 'network_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the network name of the system',
        },
        {
             method_factory_name => 'type',
             allow_value => [ qw(cs bcs cc) ],
             default_value => 'cc',
             short_description => 'the system type',
        },
        {
             method_factory_name => 'os',
             allow_isa => [ qw(HH::Unispool::Config::OS) ],
             short_description => 'the operating system running on this system',
             mandatory => 1,
             allow_empty => 0,
        },
        {
             method_factory_name => 'local_system_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the name of the system UNISPOOL is running on',
        },
        {
             method_factory_name => 'maximum_delay_time',
             allow_rx => [ qw(^\d+$) ],
             default_value => 15,
             short_description => 'the number of seconds the UNISPOOL main process is allowed to sleep between consecutive scans for printfiles',
        },
        {
             method_factory_name => 'date_format',
             allow_isa => [ qw(HH::Unispool::Config::DateFormat) ],
             default_value => 'HH::Unispool::Config::DateFormat->new( { date_format => \'DD/MM/YY\' } )',
             short_description => 'the format in which UNISPOOL will show and accept date information',
        },
        {
             method_factory_name => 'save_time_in_days',
             allow_rx => [ qw(^\d+$) ],
             default_value => 3,
             short_description => 'the number of days saved printfiles will be kept on disk before they are automatically removed',
        },
        {
             method_factory_name => 'clean_on_weekdays_only',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'saved printfiles are deleted on weekdays only',
        },
        {
             method_factory_name => 'save_groups',
             allow_rx => [ qw(^\d*$) ],
             default_value => '',
             short_description => 'the number of savegroups (not found in UNISPOOL C<config -screen>)',
        },
        {
             method_factory_name => 'start_time_clean_job_hour',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the hour part of the time that the clean job must be started on a 24-hour clock',
        },
        {
             method_factory_name => 'start_time_clean_job_minute',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the minute part of the time that the clean job must be started on a 24-hour clock',
        },
        {
             method_factory_name => 'maximum_print_file_space',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the maximum number of bytes available to store UNISPOOL printfiles',
        },
        {
             method_factory_name => 'maximum_save_file_space',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the maximum number of bytes available to store saved printfiles',
        },
        {
             method_factory_name => 'default_printer',
             allow_rx => [ qw(^.+$) ],
             default_value => 'lp',
             short_description => 'the printer to be used when no other one is specified',
        },
        {
             method_factory_name => 'remote_system',
             type => 'MULTI',
             unique => 1,
             associative => 1,
             method_key => 1,
             id_method => 'get_name',
             allow_isa => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
             short_description => 'the list of remote systems for the system',
        },
        {
             method_factory_name => 'device',
             type => 'MULTI',
             unique => 1,
             associative => 1,
             method_key => 1,
             id_method => 'get_name',
             allow_isa => [ qw(HH::Unispool::Config::Entry::Device) ],
             short_description => 'the list of devices for the system',
        },
        {
             method_factory_name => 'central_console_node',
             allow_rx => [ qw(^.+$) ],
             short_description => 'the name of the system on which the console messages must be displayed',
             default_value => 'SYSLOG',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            body => <<'EOF',
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Comment::Misc
    my $cm = $tokenizer->get();
    my $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($cm, 'HH::Unispool::Config::File::Token::Comment::Misc') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Comment::Misc' on or directly after line '$line'.");

    # Second token must be a HH::Unispool::Config::File::Token::Unnumbered::Host
    my $h = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($h,
                'HH::Unispool::Config::File::Token::Unnumbered::Host') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a second token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::Host' on or directly after line '$line'.");

    # Prepare the initialization option hash
    my %opt = ();

    # Add the Misc comment related options
    $opt{name} = $cm->get_net_desc();

    # Add the 'H' related options
    $opt{network_name} = $h->get_name();
    if ( $h->get_os() ) {
        require HH::Unispool::Config::OS;
        $opt{os} = $h->get_os();
    }

    # Expect M and L tokens
    if ($opt{name} ne '_Network_') {
        my $m = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($m,
                    'HH::Unispool::Config::File::Token::Unnumbered::Misc') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a second token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::Misc' on or directly after line '$line'.");

        # Add the 'M' related options
        $opt{clean_on_weekdays_only} = $m->is_clean_on_weekdays_only()
            if ( defined( $m->is_clean_on_weekdays_only() ) );
        $opt{date_format} = $m->get_date_format()
            if ( defined( $m->get_date_format() ) );
        $opt{default_printer} = $m->get_default_printer()
            if ( $m->get_default_printer() );
        $opt{local_system_name} = $m->get_local_system_name();
        $opt{maximum_delay_time} = $m->get_maximum_delay_time()
            if ( defined( $m->get_maximum_delay_time() ) );
        $opt{maximum_print_file_space} = $m->get_maximum_print_file_space()
            if ( $m->get_maximum_print_file_space() );
        $opt{maximum_save_file_space} = $m->get_maximum_save_file_space()
            if ( $m->get_maximum_save_file_space() );
        $opt{save_groups} = $m->get_save_groups()
            if ( $m->get_save_groups() );
        $opt{save_time_in_days} = $m->get_save_time_in_days()
            if ( $m->get_save_time_in_days() );
        $opt{start_time_clean_job_hour} = $m->get_start_time_clean_job_hour()
            if ( $m->get_start_time_clean_job_hour() );
        $opt{start_time_clean_job_minute} =
            $m->get_start_time_clean_job_minute()
                if ( $m->get_start_time_clean_job_minute() );

        my $l = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($l,
                    'HH::Unispool::Config::File::Token::Unnumbered::CSN') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a second token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::CSN' on or directly after line '$line'.");

        # Add the 'L' related options
        $opt{central_console_node} = $l->get_central_console_node()
            if ( $l->get_central_console_node() );
    }

    # Construct a new object
    my $self = HH::Unispool::Config::Entry::System->new(\%opt);

    # Next token must be a HH::Unispool::Config::File::Token::Comment::RSys
    my $cr = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($cr,
                'HH::Unispool::Config::File::Token::Comment::RSys') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Comment::RSys' on or directly after line '$line'.");

    # The cm and cr net descriptors must be identical
    ( $cm->get_net_desc() eq $cr->get_net_desc() ) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, the network descriptor name in the comment 'Remote system' line differs from the name in the comment 'Miscellaneous' line on or directly after line '$line'.");

    # Read all remote systems
    while ( my $tok =  $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Unget the token as it is not processed inside this loop
        $tokenizer->unget();

        # Only process HH::Unispool::Config::File::Token::Numbered::System
        if (! $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System') ) {
            last;
        }

        # Make the remote system
        my $rsys = undef;
        if ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::3') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::3;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::3->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::6') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::6;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::6->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::7') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::7;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::7->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::8') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::8;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::8->
                         new_from_tokenizer($tokenizer);
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, unexpected 'HH::Unispool::Config::File::Token::Numbered::System'  subclass obtained from 'TOKENIZER' on or directly after line '$line'.");
        }

        # Add the remote system
        my $name =  $rsys->get_name();
        $self->exists_remote_system($name) &&
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, remote system named '$name' defined twice somewhere around '$line'.");
        $self->add_remote_system( $rsys );
    }

    # Expect a HH::Unispool::Config::File::Token::Comment::Device
    my $cd = $tokenizer->get();
    &UNIVERSAL::isa( $cd,
        'HH::Unispool::Config::File::Token::Comment::Device') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a 'HH::Unispool::Config::File::Token::Comment::Device' line on or directly after line '$line'.");

    # The cm and cd net descriptors must be identical
    ( $cm->get_net_desc() eq $cd->get_net_desc() ) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, the network descriptor name in the comment 'Device' line differs from the name in the comment 'Miscellaneous' line on or directly after line '$line'.");

    # Read all devices
    my %dev3 = ();
    while ( my $tok =  $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Unget the token as it is not processed inside this loop
        $tokenizer->unget();

        # Only process HH::Unispool::Config::File::Token::Numbered::Device
        if (! $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device') ) {
            last;
        }

        # Make the device
        my $dev = undef;
        if ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::0') ) {
            require HH::Unispool::Config::Entry::Device::0;
            $dev = HH::Unispool::Config::Entry::Device::0->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::1') ) {
            require HH::Unispool::Config::Entry::Device::1;
            $dev = HH::Unispool::Config::Entry::Device::1->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::2') ) {
            require HH::Unispool::Config::Entry::Device::2;
            $dev = HH::Unispool::Config::Entry::Device::2->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::3') ) {
            require HH::Unispool::Config::Entry::Device::3;
            $dev = HH::Unispool::Config::Entry::Device::3->
                         new_from_tokenizer($tokenizer);
            my $number = $dev->get_number();
            exists($dev3{$number}) &&
                throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, type 3 device with number '$number' defined twice somewhere around '$line'.");
            $dev3{$number} = [ $dev, $line ];
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::4') ) {
            require HH::Unispool::Config::Entry::Device::4;
            $dev = HH::Unispool::Config::Entry::Device::4->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::5') ) {
            require HH::Unispool::Config::Entry::Device::5;
            $dev = HH::Unispool::Config::Entry::Device::5->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::6') ) {
            require HH::Unispool::Config::Entry::Device::6;
            $dev = HH::Unispool::Config::Entry::Device::6->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::7') ) {
            require HH::Unispool::Config::Entry::Device::7;
            $dev = HH::Unispool::Config::Entry::Device::7->
                         new_from_tokenizer($tokenizer);
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, unexpected 'HH::Unispool::Config::File::Token::Numbered::Device'  subclass obtained from 'TOKENIZER' on or directly after line '$line'.");
        }

        # Add the device
        my $name =  $dev->get_name();
        $self->exists_device($name) &&
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, device named '$name' defined twice somewhere around '$line'.");
        $self->add_device($dev);
    }

    # Expect a HH::Unispool::Config::File::Token::Comment::Group
    my $cg = $tokenizer->get();
    &UNIVERSAL::isa( $cg,
        'HH::Unispool::Config::File::Token::Comment::Group') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a 'HH::Unispool::Config::File::Token::Comment::Group' line on or directly after line '$line'.");

    # The cm and cg net descriptors must be identical
    ( $cm->get_net_desc() eq $cg->get_net_desc() ) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, the network descriptor name in the comment 'Group' line differs from the name in the comment 'Miscellaneous' line on or directly after line '$line'.");

    # Read all groups
    while ( my $tok =  $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Unget the token as it is not processed inside this loop
        $tokenizer->unget();

        # Process untile there are still
        # tokens HH::Unispool::Config::File::Token::Numbered::Device::Group
        $tok->isa(
            'HH::Unispool::Config::File::Token::Numbered::Device::Group') ||
                last;

        # Check if the group token has a corresponding device
        my $number = $tok->get_number();
        exists( $dev3{$number} ) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, no device defined for 'Group' token with number '$number' before line '$line'.");

        # Check if the group token is already processed for the device
        defined( $dev3{$number} ) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, 'Group' token with number '$number' was processed before line '$line'.");

        # Add the group tokens to the device
        $dev3{$number}[0]->add_members_from_tokenizer($tokenizer);

        # Mark group device as processed
        $dev3{$number} = undef;
    }

    # Check if all group devices were processed
    foreach my $number (sort (keys (%dev3) ) ) {
        # Next if group device was processed
        defined( $dev3{$number} ) || next;

        # Throw exception
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, 'Group' device with number '$number' did not have any group tokens attached to it see line '$dev3{$number}[1]'.");
    }

    # Return self
    return($self);
EOF
        },
    ],
    meth_opt => [
        {
            method_name => 'diff',
            parameter_description => 'TO [, DIFF_NUMBER]',
            description => <<EOF,
__SUPER_POD__ Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.
EOF
        },
        {
            method_name => 'write',
            body => <<'EOF',
    my $self = shift;
    my $fh = shift;

    # Make and write the Misc comment token
    require HH::Unispool::Config::File::Token::Comment::Misc;
    my $tok = HH::Unispool::Config::File::Token::Comment::Misc->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Make and write the H token
    my %opt = ( name => $self->get_network_name() );
    $opt{os} = $self->get_os() if ( $self->get_name() ne '_Network_' );
    require HH::Unispool::Config::File::Token::Unnumbered::Host;
    $tok = HH::Unispool::Config::File::Token::Unnumbered::Host->new(\%opt);
    $fh->print( $tok->write_string() );

    # Make and write the M and L tokens
    if ($self->get_name() ne '_Network_') {
        %opt = (
            clean_on_weekdays_only => $self->is_clean_on_weekdays_only(),
            date_format => $self->get_date_format(),
            default_printer => $self->get_default_printer(),
            local_system_name => $self->get_local_system_name(),
            maximum_delay_time => $self->get_maximum_delay_time(),
            maximum_print_file_space => $self->get_maximum_print_file_space(),
            maximum_save_file_space => $self->get_maximum_save_file_space(),
            save_groups => $self->get_save_groups(),
            save_time_in_days => $self->get_save_time_in_days(),
            start_time_clean_job_hour => $self->get_start_time_clean_job_hour(),
            start_time_clean_job_minute =>
                                    $self->get_start_time_clean_job_minute(),
        );
        require HH::Unispool::Config::File::Token::Unnumbered::Misc;
        $tok = HH::Unispool::Config::File::Token::Unnumbered::Misc->new(\%opt);
        $fh->print( $tok->write_string() );

        %opt = (
            central_console_node => $self->get_central_console_node(),
        );
        require HH::Unispool::Config::File::Token::Unnumbered::CSN;
        $tok = HH::Unispool::Config::File::Token::Unnumbered::CSN->new(\%opt);
        $fh->print( $tok->write_string() );
    }

    # Empty line
    $fh->print( "\n" );

    # Make and write the Remote system comment token
    require HH::Unispool::Config::File::Token::Comment::RSys;
    $tok = HH::Unispool::Config::File::Token::Comment::RSys->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Write the remote systems
    my $i = 0;
    foreach my $name ( sort( $self->keys_remote_system() ) ) {
        $i ++;
        my $rsys = ($self->values_remote_system($name))[0];
        $rsys->set_number($i);
        $rsys->write($fh);
    }

    # Empty line
    $fh->print( "\n" );

    # Make and write the Device comment token
    require HH::Unispool::Config::File::Token::Comment::Device;
    $tok = HH::Unispool::Config::File::Token::Comment::Device->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Write the devices
    $i = 0;
    foreach my $name ( sort( $self->keys_device() ) ) {
        $i ++;
        my $dev = ($self->values_device($name))[0];
        $dev->set_number($i);
        $dev->write($fh);
    }

    # Empty line
    $fh->print( "\n" );

    # Make and write the Group comment token
    require HH::Unispool::Config::File::Token::Comment::Group;
    $tok = HH::Unispool::Config::File::Token::Comment::Group->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Write the group devices tokens
    foreach my $name ( sort( $self->keys_device() ) ) {
        my $dev = ($self->values_device($name))[0];
        $dev->isa('HH::Unispool::Config::Entry::Device::3') || next;
        $dev->write_group($fh);
    }

    # Empty lines
    $fh->print( "\n" );
    $fh->print( "\n" );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::DateFormat',
        },
    ],
} );
