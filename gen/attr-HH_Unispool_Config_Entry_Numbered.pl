use strict;

my $pkg = 'HH::Unispool::Config::Entry::Numbered';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [ qw(HH::Unispool::Config::Entry) ],
        short_description => 'Abstract class to group numbered UNISPOOL config entries',
        abstract => 'Abstract class for UNISPOOL numbered config file entries',
        synopsis => "None, this is an abstract class.\n",
        description => <<EOF,
C<${pkg}> is an abstract class to group numbered UNISPOOL config entries.
Numbered entries are plain entries with a number which is not identifying in
this API.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'number',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the entry number',
        },
        {
             method_factory_name => 'diff_number',
             type => 'BOOLEAN',
             default_value => 0,
             short_description => 'L<diff()> should consider the C<number> attribtutes',
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
            parameter_description => 'TO [, DIFF_NUMBER]',
            description => <<EOF,
__SUPER_POD__ Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.
EOF
        },
        {
            method_name => 'write',
            interface => 1,
        },
        {
            method_name => 'write',
            interface => 1,
        },
    ],
} );
