use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::Device';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'abstract class for device I<D> tokens',
        abstract => 'abstract class for device I<D> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for device I<D> tokens.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'device_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             short_description => 'the unique name for the device',
        },
        {
             attribute_name => 'device_password',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the password required to access the device',
        },
        {
             attribute_name => 'buffer_size',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the number of bytes sent to the printer in one write operation',
        },
        {
             attribute_name => 'block_delay',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the time in seconds UNISPOOL should pause between sending two blocks',
        },
        {
             attribute_name => 'connect_retry',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the number of seconds UNISPOOL should wait if the connection can not be established immediately',
        },
        {
             attribute_name => 'page_width',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the page width (bytes) for determining the size of UNISPOOL banners',
        },
        {
             attribute_name => 'page_length',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the page length (lines) for determining the size of UNISPOOL banners',
        },
        {
             attribute_name => 'remote_system_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the system to which the output for this device must be routed',
        },
        {
             attribute_name => 'remote_device_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the device on the remote system that will receive the output',
        },
        {
             attribute_name => 'initially_spooled',
             type => 'BOOLEAN',
             short_description => 'an automatic STARTSPOOL must be performed when UNISPOOL is started',
        },
        {
             attribute_name => 'save_printfile',
             type => 'BOOLEAN',
             short_description => 'printfiles printed on this device should be saved',
        },
        {
             attribute_name => 'networkwide',
             type => 'BOOLEAN',
             short_description => 'the device must be made available from each node in the configuration cluster',
        },
        {
             attribute_name => 'unispool_header',
             type => 'BOOLEAN',
             short_description => 'standard UNISPOOL banners pages are printed initially',
        },
        {
             attribute_name => 'unispool_control',
             type => 'BOOLEAN',
             short_description => 'the UNISPOOL control is on (is not available on development system used)',
        },
        {
             attribute_name => 'execution_priority',
             allow_isa => [ qw(HH::Unispool::Config::ExecPri) ],
             short_description => 'the execution priority of the driver process on MPE hosts',
        },
    ],
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;

    \$self->SUPER::read_string(\@_);
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    \$self->SUPER::read_string(\@_);
EOF
        },
    ],
} );
