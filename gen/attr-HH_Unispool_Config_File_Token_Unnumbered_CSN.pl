use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered::CSN';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Unnumbered)],
        short_description => 'class for console message system I<L> tokens',
        abstract => 'class for console message system I<L> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is a class for console message system I<L> tokens.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'central_console_node',
             allow_rx => [ qw(^.+$) ],
             short_description => 'the name of the system on which the console messages must be displayed',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$ccn) = \$line =~ /\$USP_L_RX/;
    defined(\$ccn) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    \$self->set_central_console_node(\$ccn);
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_L_FRM,
            \$self->get_central_console_node() || '',
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
