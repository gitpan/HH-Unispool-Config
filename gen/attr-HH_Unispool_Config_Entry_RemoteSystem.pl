use strict;

my $pkg = 'HH::Unispool::Config::Entry::RemoteSystem';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Numbered) ],
        short_description => 'Abstract class to group UNISPOOL remote system entries',
        abstract => 'Abstract class for UNISPOOL remote system entries',
        synopsis => "None, this is an abstract class.\n",
        description => <<EOF,
C<${pkg}> is an abstract class to group UNISPOOL remote system entries.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'description',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the description for the remote system',
        },
        {
             attribute_name => 'execution_priority',
             allow_isa => [ qw(HH::Unispool::Config::ExecPri) ],
             default_value => 'HH::Unispool::Config::ExecPri->new( { execution_priority => \'\' } )',
             short_description => 'the execution priority of the driver process on MPE hosts',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            interface => 1,
        },
    ],
    meth_opt => [
        {
            method_name => 'diff',
            interface => 1,
        },
        {
            method_name => 'write',
            interface => 1,
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::ExecPri',
        },
    ],
} );
