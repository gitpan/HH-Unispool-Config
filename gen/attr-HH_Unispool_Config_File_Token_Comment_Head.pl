use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Comment::Head';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Comment)],
        short_description => 'file head comment token',
        abstract => 'file head comment token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains information on the file head comment token.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'version',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the version in the comment',
        },
        {
             method_factory_name => 'host',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the host in the comment',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line
    my (\$version, \$host) = \$line =~ /\$USP_HEAD_RX/;
    defined(\$version) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    \$self->set_version(\$version);
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
            \$USP_HEAD_FRM,
            \$self->get_version() || '',
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
