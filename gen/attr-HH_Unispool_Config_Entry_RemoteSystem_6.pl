use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem::6';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
        short_description => 'UNISPOOL type 6 remote system',
        abstract => 'UNISPOOL type 6 remote system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_RemoteSystem_6.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 6 remote systems
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
