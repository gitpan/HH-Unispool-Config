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
             attribute_name => 'remote_device_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the device on the remote system that will receive the output',
             mandatory => 1,
             allow_empty => 0,
        },
        {
             attribute_name => 'remote_system_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the system to which the output for this device must be routed',
             mandatory => 1,
             allow_empty => 0,
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
} );
