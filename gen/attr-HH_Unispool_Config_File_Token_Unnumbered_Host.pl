use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered::Host';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Unnumbered)],
        short_description => 'class for host I<H> tokens',
        abstract => 'class for host I<H> tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is a class for host I<H> tokens.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'name',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the network name of the system',
        },
        {
             method_factory_name => 'os',
             allow_isa => [ qw(HH::Unispool::Config::OS) ],
             short_description => 'the operating system running on this system',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line for name
    my (\$name, \$tail) = \$line =~ /\$USP_H_RX/;
    defined(\$name) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my \@tail = \$self->_split_tail(\$tail);

    # Parse line for optional os
    my \$os = \$tail[0];

    # Set attributes
    \$self->set_name(\$name);
    if ( defined(\$os) ) {
        require HH::Unispool::Config::OS;
        \$self->set_os( HH::Unispool::Config::OS->new( { os => \$os } ) );
    }
EOF
        },
        {
            method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    # Make string and return it
    \$self->get_os() || return(
        sprintf(
            \$USP_H1_FRM,
            \$self->get_name() || '',
        )
    );
    return(
        sprintf(
            \$USP_H2_FRM,
            \$self->get_name() || '',
            \$self->get_os()->get_os() || '',
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
