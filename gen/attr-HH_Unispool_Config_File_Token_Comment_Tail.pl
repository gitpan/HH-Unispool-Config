use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Comment::Tail';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Comment)],
        short_description => 'file tail comment token',
        abstract => 'file tail comment token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains information on the file tail comment token.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'host',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the host name in the comment',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line
    my (\$host) = \$line =~ /\$USP_TAIL_RX/;
    defined(\$host) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    \$self->set_host(\$host);
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_TAIL_FRM,
            \$self->get_host() || '',
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
