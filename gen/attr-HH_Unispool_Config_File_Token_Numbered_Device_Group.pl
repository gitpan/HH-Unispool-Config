use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::Device::Group';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'group device I<G> token',
        abstract => 'group device I<G> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains information on the group device I<G> token.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'member_device_name',
             type => 'MULTI',
             unique => 1,
             allow_rx => [ qw(^.+$) ],
             short_description => 'the name of a device that can be accessed through the group device',
        },
    ],
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$tail) = \$line =~ /\$USP_G_RX/;
    defined(\$number) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my \@member = \$self->_split_tail(\$tail);

    # Set attributes
    \$self->set_number(\$number);
    \$self->set_member_device_name();
    (\$member[0]) && \$self->add_member_device_name(\$member[0]);
    (\$member[1]) && \$self->add_member_device_name(\$member[1]);
    (\$member[2]) && \$self->add_member_device_name(\$member[2]);
    (\$member[3]) && \$self->add_member_device_name(\$member[3]);
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    my \@member = sort( \$self->values_member_device_name() );
    return(
        sprintf(
            \$USP_G_FRM,
            \$self->get_number() || 0,
            \$member[0] || '',
            \$member[1] || '',
            \$member[2] || '',
            \$member[3] || '',
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
