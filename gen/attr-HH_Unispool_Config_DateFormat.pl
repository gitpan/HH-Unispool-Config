use strict;

my $pkg = 'HH::Unispool::Config::DateFormat';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'UNISPOOL date format',
        abstract => 'UNISPOOL date format',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_DateFormat.pl', '.'),
        description => <<EOF,
C<${pkg}> contains UNISPOOL date format information.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'date_format',
             mandatory => 1,
             allow_value => [ qw( DD/MM/YY MM/DD/YY YY/MM/DD DD/MMM/YY ) ],
             default_value => 'DD/MM/YY',
             short_description => 'the format in which UNISPOOL will show and accept date information',
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
