use strict;

my $pkg = 'HH::Unispool::Config::FilterType';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'UNISPOOL filter type',
        abstract => 'UNISPOOL filter type',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Filter.pl', '.'),
        description => <<EOF,
C<${pkg}> contains UNISPOOL filter type information.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'type',
             allow_rx => [ qw(^.+$) ],
             allow_empty => 0,
             allow_value => [ qw ( default lp lpr ) ],
             default_value => 'default',
             short_description => 'the type of the filter',
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
