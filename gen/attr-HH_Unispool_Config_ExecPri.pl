use strict;

my $pkg = 'HH::Unispool::Config::ExecPri';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'UNISPOOL execution priority',
        abstract => 'UNISPOOL execution priority',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_ExecPri.pl', '.'),
        description => <<EOF,
C<${pkg}> holds information for UNISPOOL execution priorities.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'execution_priority',
             mandatory => 1,
             allow_value => [ '', qw( BS CS DS ES ) ],
             short_description => 'the UNISPOOL execution priority',
        },
    ],
    meth_opt => [
        {
            method_name => 'diff',
            parameter_description => 'TO',
            description => <<EOF,
Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.
EOF
        },
    ],
} );
