use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered::System::Info';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Numbered)],
        short_description => 'system info I<I> token',
        abstract => 'system info I<I> token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contans system info I<I> token information.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'description',
             allow_rx => [ qw(^.*$) ],
             short_description => 'the description for the system,',
        },
    ],
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$number, \$tail) = \$line =~ /\$USP_IS_RX/;
    defined(\$number) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my \@tail = \$self->_split_tail(\$tail);
    \$description = \$tail[0];

    # Set attributes
    \$self->set_number(\$number);
    (\$description) && \$self->set_description(\$description);
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    return(
        sprintf(
            \$USP_IS_FRM,
            \$self->get_number() || 0,
            \$self->get_description() || '',
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