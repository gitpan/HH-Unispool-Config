use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered::Cs';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Unnumbered::CsBcs)],
        short_description => 'class for CS I<C> tokens',
        abstract => 'class for CS I<C> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is a class for CS I<C> tokens.
EOF
    },
    attr_opt => [
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line
    my (\$hostname) = \$line =~ /\$USP_CS_RX/;
    defined(\$hostname) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    \$self->set_hostname(\$hostname);
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_CS_FRM,
            \$self->get_hostname() || '',
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
