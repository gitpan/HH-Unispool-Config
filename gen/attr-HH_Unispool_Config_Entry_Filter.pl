use strict;

my $pkg = 'HH::Unispool::Config::Entry::Filter';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::Entry)],
        short_description => 'UNISPOOL filter information',
        abstract => 'UNISPOOL filter information',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Filter.pl', '.'),
        description => <<EOF,
C<${pkg}> holds information for UNISPOOL filter definitions.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'file',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the file name for the filter',
        },
        {
             attribute_name => 'type',
             allow_isa => [ qw (HH::Unispool::Config::FilterType) ],
             default_value => 'HH::Unispool::Config::FilterType->new( { type => \'default\'} )',
             allow_empty => 0,
             short_description => 'the type of the filter',
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
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::FilterType',
        },
    ],
} );
