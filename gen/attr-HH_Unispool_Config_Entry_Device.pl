use strict;

my $pkg = 'HH::Unispool::Config::Entry::Device';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry::Numbered) ],
        short_description => 'Abstract class to group UNISPOOL device entries',
        abstract => 'Abstract class for UNISPOOL device entries',
        synopsis => "None, this is an abstract class.\n",
        description => <<EOF,
C<${pkg}> is an abstract class to group UNISPOOL device entries.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'filter_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the filter file to be used when printfiles for this device are generated',
             mandatory => 1,
        },
        {
             method_factory_name => 'description',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the description for the device',
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
} );
