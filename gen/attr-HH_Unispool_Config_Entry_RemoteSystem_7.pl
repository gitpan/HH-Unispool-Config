use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem::7';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
        short_description => 'UNISPOOL type 7 remote system',
        abstract => 'UNISPOOL type 7 remote system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_RemoteSystem_7.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 7 remote systems
EOF
    },
    attr_opt => [
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
