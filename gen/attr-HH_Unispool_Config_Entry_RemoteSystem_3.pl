use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem::3';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::RemoteSystem) ],
        short_description => 'UNISPOOL type 3 remote system',
        abstract => 'UNISPOOL type 3 remote system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_RemoteSystem_3.pl', '.'),
        description => <<EOF,
Class C<${pkg}> holds information for UNISPOOL type 3 remote systems
EOF
    },
    attr_opt => [
        {
             attribute_name => 'acct',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the remote login account (is not available on development system used)',
        },
        {
             attribute_name => 'apass',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the account password (is not available on development system used)',
        },
        {
             attribute_name => 'upass',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the user paccword (is not available on development system used)',
        },
        {
             attribute_name => 'timeout',
             allow_rx => [ qw(^\d*$) ],
             default_value => 180,
             short_description => 'the delay before closing the link after transfering the last request (in seconds) (is not available on development system used)',
        },
        {
             attribute_name => 'initially_open',
             type => 'BOOLEAN',
             short_description => 'the communication link should be opened at the moment UNISPOOL is started',
        },
        {
             attribute_name => 'high_priority_login',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'the login must be high priotity (is not available on development system used)',
        },
        {
             attribute_name => 'remote_node_name',
             allow_rx => [ qw(^[\w\.]+$) ],
             mandatory => 1,
             short_description => 'the name of the system as it can be resolved by the network software',
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
