use strict;

my $pkg = 'HH::Unispool::Config::Entry';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'Abstract class to group UNISPOOL config entries',
        abstract => 'Abstract class for UNISPOOL config file entries',
        synopsis => "None, this is an abstract class.\n",
        description => <<EOF,
C<${pkg}> is an abstract class to group UNISPOOL config entries. UNISPOOL
config file entries are "repeating" elements in UNISPOOL config files such as
devices, remote systems and system descriptions. All entries are identified
by their 'name'.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the entry name',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            parameter_description => 'TOKENIZER',
            description => <<EOF,
Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.
EOF
            interface => 1,
        },
    ],
    meth_opt => [
        {
            method_name => 'write',
            parameter_description => 'FILE_HANDLE',
            description => <<EOF,
Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.
EOF
            interface => 1,
        },
        {
            method_name => 'diff',
            parameter_description => 'TO',
            description => <<EOF,
Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.
EOF
        },
    ],
} );
