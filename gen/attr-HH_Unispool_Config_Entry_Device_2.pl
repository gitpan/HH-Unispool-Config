use strict;

my $pkg = 'HH::Unispool::Config::Entry::Device::2';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Device) ],
        short_description => 'UNISPOOL type 2 device',
        abstract => 'UNISPOOL type 2 device',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Device_2.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 2 device
EOF
    },
    attr_opt => [
        {
             attribute_name => 'device_password',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the password required to access the device',
        },
        {
             attribute_name => 'page_width',
             allow_rx => [ qw(^\d+$) ],
             default_value => 132,
             short_description => 'the page width (bytes) for determining the size of UNISPOOL banners',
        },
        {
             attribute_name => 'page_length',
             allow_rx => [ qw(^\d+$) ],
             default_value => 66,
             short_description => 'the page length (lines) for determining the size of UNISPOOL banners',
        },
        {
             attribute_name => 'buffer_size',
             allow_rx => [ qw(^\d+$) ],
             default_value => 2048,
             short_description => 'the number of bytes sent to the printer in one write operation',
        },
        {
             attribute_name => 'unispool_header',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'standard UNISPOOL banners pages are printed initially',
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
             attribute_name => 'device_file',
             allow_rx => [ qw(^.+$) ],
             short_description => 'the device file to which the device is connected',
             mandatory => 1,
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
