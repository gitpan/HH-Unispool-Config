use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Comment::Scope';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Comment)],
        short_description => 'scope comment token',
        abstract => 'scope comment token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains information on the scope comment token.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'scope',
             allow_isa => [ qw(HH::Unispool::Config::Scope) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the dump scope in the comment',
        },
    ],
    meth_opt => [
        {
            method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;
    my \$line = shift;

    # Parse line
    my (\$scope) = \$line =~ /\$USP_SCOPE_RX/;
    defined(\$scope) || throw Error::Simple("ERROR: ${pkg}::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    require HH::Unispool::Config::Scope;
    \$self->set_scope( HH::Unispool::Config::Scope->new( { scope => [ split(/\\s*,\\s*/, \$scope) ] } ) );
EOF
        },
        {
            method_name => 'write_string',
            body => <<'EOF',
    my $self = shift;

    # Make string and return it
    return(
        sprintf(
            $USP_SCOPE_FRM,
            join( ', ', $self->get_scope()->values_scope() ) || '',
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
