use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::System';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'abstract class for system I<S> tokens',
        abstract => 'abstract class for system I<S> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for system I<S> tokens.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'remote_system_name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             short_description => 'the unique name for the remote system',
        },
        {
             method_factory_name => 'acct',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the remote login account (is not available on development system used)',
        },
        {
             method_factory_name => 'apass',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the account password (is not available on development system used)',
        },
        {
             method_factory_name => 'upass',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the user paccword (is not available on development system used)',
        },
        {
             method_factory_name => 'timeout',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the delay before closing the link after transfering the last request (in seconds) (is not available on development system used)',
        },
        {
             method_factory_name => 'block_delay',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the time in seconds UNISPOOL should pause between sending two blocks',
        },
        {
             method_factory_name => 'initially_open',
             type => 'BOOLEAN',
             short_description => 'the communication link should be opened at the moment UNISPOOL is started',
        },
        {
             method_factory_name => 'high_priority_login',
             type => 'BOOLEAN',
             short_description => 'the login must be high priotity (is not available on development system used)',
        },
        {
             method_factory_name => 'execution_priority',
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
