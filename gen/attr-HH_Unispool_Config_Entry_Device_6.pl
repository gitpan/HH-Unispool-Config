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
             attribute_name => 'device_password',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the password required to access the device',
        },
        {
             attribute_name => 'block_delay',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the time in seconds UNISPOOL should pause between sending two blocks',
             default_value => 0,
        },
        {
             attribute_name => 'connect_retry',
             allow_rx => [ qw(^\d+$) ],
             default_value => 0,
             short_description => 'the number of seconds UNISPOOL should wait if the connection can not be established immediately',
        },
        {
             attribute_name => 'initially_spooled',
             type => 'BOOLEAN',
             default_value => 1,
             short_description => 'an automatic STARTSPOOL must be performed when UNISPOOL is started',
        },
        {
             attribute_name => 'networkwide',
             type => 'BOOLEAN',
             default_value => 1,
             short_description => 'the device must be made available from each node in the configuration cluster',
        },
        {
             attribute_name => 'save_printfile',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'printfiles printed on this device should be saved',
        },
        {
             attribute_name => 'execution_priority',
             allow_isa => [ qw(HH::Unispool::Config::ExecPri) ],
             short_description => 'the execution priority of the driver process on MPE hosts',
             default_value => 'HH::Unispool::Config::ExecPri->new( { execution_priority => \'\' } )',
        },
        {
             attribute_name => 'remote_node_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
        },
        {
             attribute_name => 'protocol',
             allow_value => [ qw( TCP LPD PJL XPP ) ],
             short_description => 'the protocol to be used for the device',
             default_value => 'TCP',
        },
        {
             attribute_name => 'server_tcp_port',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the TCP port assigned on the print server',
             default_value => 9100,
        },
        {
             attribute_name => 'profile_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the profile containing the device initialisation and status checking specification',
        },
        {
             attribute_name => 'header_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the control procedure to be executed before printing the printfile',
        },
        {
             attribute_name => 'trailer_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the control procedure to be executed after printing the printfile',
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
        },  
        {
            method_name => 'write',
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::ExecPri',
        },
    ],
} );
