use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem::8';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
        short_description => 'UNISPOOL type 8 remote system',
        abstract => 'UNISPOOL type 8 remote system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_RemoteSystem_8.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 8 remote systems
EOF
    },
    attr_opt => [
        {
             attribute_name => 'remote_node_name',
             allow_rx => [ qw(^[\w\.]+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
        },
        {
             attribute_name => 'os',
             allow_isa => [ qw(HH::Unispool::Config::OS) ],
             mandatory => 1,
             short_description => 'the operating system running on the remote node',
        },
        {
             attribute_name => 'transfer_size',
             allow_rx => [ qw(^\d*$) ],
             default_value => 4098,
             short_description => 'the size of the data blocks to be transfered',
        },
        {
             attribute_name => 'transfer_time_out',
             allow_rx => [ qw(^\d*$) ],
             default_value => 180,
             short_description => 'the time in which a transfer must be completed to be considered successful',
        },
        {
             attribute_name => 'block_delay',
             allow_rx => [ qw(^\d*$) ],
             default_value => 0,
             short_description => 'the time in seconds UNISPOOL should pause between sending two blocks',
        },
        {
             attribute_name => 'initially_open',
             type => 'BOOLEAN',
             default_value => 1,
             short_description => 'the communication link should be opened at the moment UNISPOOL is started',
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
