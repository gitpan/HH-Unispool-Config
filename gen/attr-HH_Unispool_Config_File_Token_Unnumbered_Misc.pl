use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered::Misc';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Unnumbered)],
        short_description => 'class for miscellaneous I<M> tokens',
        abstract => 'class for miscellaneous I<M> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is a class for miscellaneous I<M> tokens.
EOF
    },
    attr_opt => [
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
             short_description => 'the printer to be used when no other one is specified',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$name, \$tail) = \$line =~ /\$USP_M_RX/;
    defined(\$name) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Parse line for other entries
    my \@tail = \$self->_split_tail(\$tail);
    ( scalar(\@tail) > 8 ) && throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' contains too many ';' separated entries after the local system name '\$name'.");
    my \$mdt = shift(\@tail);
    my \$st_str = shift(\@tail);
    my (\$stid, \$cowo) = split(/\\//, \$st_str);
    \$cowo = ( lc(\$cowo) eq 'w' ) if ( defined(\$cowo) );
    my \$sg = shift(\@tail);
    my \$df = shift(\@tail);
    my \$stcj_str = shift(\@tail);
    my ( \$stcj_h, \$stcj_m ) = split( /:/, \$stcj_str);
    my \$mpfs = shift(\@tail);
    my \$msfs = shift(\@tail);
    my \$dp = shift(\@tail);

    # Set attributes
    \$self->set_local_system_name(\$name);
    defined(\$mdt) && \$self->set_maximum_delay_time(\$mdt);
    defined(\$stid) && \$self->set_save_time_in_days(\$stid);
    defined(\$cowo) && \$self->set_clean_on_weekdays_only(\$cowo);
    defined(\$sg) && \$self->set_save_groups(\$sg);
    if (\$df) {
        require HH::Unispool::Config::DateFormat;
        \$self->set_date_format( HH::Unispool::Config::DateFormat->new( { date_format => \$df } ) );
    }
    defined(\$stcj_h) && \$self->set_start_time_clean_job_hour(\$stcj_h);
    defined(\$stcj_m) && \$self->set_start_time_clean_job_minute(\$stcj_m);
    defined(\$mpfs) && \$self->set_maximum_print_file_space(\$mpfs);
    defined(\$msfs) && \$self->set_maximum_save_file_space(\$msfs);
    defined(\$dp) && \$self->set_default_printer(\$dp);
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    my \$wc = \$self->is_clean_on_weekdays_only() ? 'W' : 'C';
    return(
        sprintf(
            \$USP_M_FRM,
            \$self->get_local_system_name() || '',
            \$self->get_maximum_delay_time() || 0,
            \$self->get_save_time_in_days() . "/\$wc",
            \$self->get_save_groups() || '',
            \$self->get_date_format()->get_date_format() || '',
            sprintf("%d:%02d",
                \$self->get_start_time_clean_job_hour() || 0,
                \$self->get_start_time_clean_job_minute() || 0,
            ),
            \$self->get_maximum_print_file_space() || 0,
            \$self->get_maximum_save_file_space() || 0,
            \$self->get_default_printer() || '',
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
