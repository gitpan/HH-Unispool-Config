use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered::Filter';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Unnumbered)],
        short_description => 'class for filter I<F> tokens',
        abstract => 'class for filter I<F> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is a class for filter I<F> tokens.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the reference name for the filter',
        },
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
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the type of the filter',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line
    my (\$name, \$file, \$type) = \$line =~ /\$USP_FILTER_RX/;
    defined(\$name) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    \$self->set_name(\$name);
    \$self->set_file(\$file);
    require HH::Unispool::Config::FilterType;
    \$self->set_type( HH::Unispool::Config::FilterType->new( {type => \$type} ) );
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_FILTER_FRM,
            \$self->get_name() || '',
            \$self->get_file() || '',
            \$self->get_type()->get_type() || '',
        )
    );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::File::Token',
            import_list => [ 'qw( :rx :frm )' ],
        },
    ],
} );
