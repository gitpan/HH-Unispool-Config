use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::X';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'I<X> token',
        abstract => 'I<X> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans I<X> token information.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'profile_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the profile containing the device initialisation and status checking specification',
        },
        {
             attribute_name => 'header_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the control procedure to be executed before printing the printfile',
        },
        {
             attribute_name => 'trailer_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the control procedure to be executed after printing the printfile',
        },
        {
             attribute_name => 'filter_name',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the name of the filter file to be used when printfiles for this device are generated',
        },
    ],
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$tail) = \$line =~ /\$USP_X_RX/;
    defined(\$number) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my \@tail = \$self->_split_tail(\$tail);
    my \$profile_name = \$tail[0];
    my \$header_name = \$tail[1];
    my \$trailer_name = \$tail[2];
    my \$filter_name = \$tail[3];

    # Set attributes
    \$self->set_number(\$number);
    defined(\$profile_name) && \$self->set_profile_name(\$profile_name);
    defined(\$header_name) && \$self->set_header_name(\$header_name);
    defined(\$trailer_name) && \$self->set_trailer_name(\$trailer_name);
    defined(\$filter_name) && \$self->set_filter_name(\$filter_name);
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_X_FRM,
            \$self->get_number() || 0,
            \$self->get_profile_name() || '',
            \$self->get_header_name() || '',
            \$self->get_trailer_name() || '',
            \$self->get_filter_name() || '',
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
