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
             attribute_name => 'diff_number',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<number> attribtutes',
        },
        {
             attribute_name => 'network_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the network name of the system',
        },
        {
             attribute_name => 'type',
             allow_value => [ qw(cs bcs cc) ],
             short_description => 'the system type',
        },
        {
             attribute_name => 'os',
             allow_isa => [ qw(HH::Unispool::Config::OS) ],
             short_description => 'the operating system running on this system',
             mandatory => 1,
             allow_empty => 0,
        },
        {
             attribute_name => 'local_system_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the name of the system UNISPOOL is running on',
        },
        {
             attribute_name => 'maximum_delay_time',
             allow_rx => [ qw(^\d+$) ],
             default_value => 15,
             short_description => 'the number of seconds the UNISPOOL main process is allowed to sleep between consecutive scans for printfiles',
        },
        {
             attribute_name => 'date_format',
             allow_isa => [ qw(HH::Unispool::Config::DateFormat) ],
             default_value => 'HH::Unispool::Config::DateFormat->new( { date_format => \'DD/MM/YY\' } )',
             short_description => 'the format in which UNISPOOL will show and accept date information',
        },
        {
             attribute_name => 'save_time_in_days',
             allow_rx => [ qw(^\d+$) ],
             default_value => 3,
             short_description => 'the number of days saved printfiles will be kept on disk before they are automatically removed',
        },
        {
             attribute_name => 'clean_on_weekdays_only',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'saved printfiles are deleted on weekdays only',
        },
        {
             attribute_name => 'save_groups',
             allow_rx => [ qw(^\d*$) ],
             default_value => '',
             short_description => 'the number of savegroups (not found in UNISPOOL C<config -screen>)',
        },
        {
             attribute_name => 'start_time_clean_job_hour',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the hour part of the time that the clean job must be started on a 24-hour clock',
        },
        {
             attribute_name => 'start_time_clean_job_minute',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the minute part of the time that the clean job must be started on a 24-hour clock',
        },
        {
             attribute_name => 'maximum_print_file_space',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the maximum number of bytes available to store UNISPOOL printfiles',
        },
        {
             attribute_name => 'maximum_save_file_space',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the maximum number of bytes available to store saved printfiles',
        },
        {
             attribute_name => 'default_printer',
             allow_rx => [ qw(^.+$) ],
             default_value => 'lp',
             short_description => 'the printer to be used when no other one is specified',
        },
        {
             attribute_name => 'remote_system',
             type => 'MULTI',
             unique => 1,
             associative => 1,
             method_key => 1,
             id_method => 'get_name',
             allow_isa => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
             short_description => 'the list of remote systems for the system',
        },
        {
             attribute_name => 'device',
             type => 'MULTI',
             unique => 1,
             associative => 1,
             method_key => 1,
             id_method => 'get_name',
             allow_isa => [ qw(HH::Unispool::Config::Entry::Device) ],
             short_description => 'the list of devices for the system',
        },
        {
             attribute_name => 'central_console_node',
             allow_rx => [ qw(^.+$) ],
             short_description => 'the name of the system on which the console messages must be displayed',
             default_value => 'SYSLOG',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
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
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::DateFormat',
        },
    ],
} );
