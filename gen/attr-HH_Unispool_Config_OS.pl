use strict;

my $pkg = 'HH::Unispool::Config::OS';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'UNISPOOL operating system',
        abstract => 'UNISPOOL operating system',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config.pl', '.'),
        description => <<EOF,
C<${pkg}> contains UNISPOOL operating system information.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'os',
             mandatory => 1,
             allow_value => [ qw( AIX DigUnix HP-UX MPE NTSERVER SCO
                     SINIX LINUX Solaris ULTRIX VMS ) ],
             short_description => 'the operating system where the UNISPOOL instance is running on',
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
