use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Factory';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'token factory class',
        abstract => 'token factory class',
        singleton => 1,
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains factory method to make tokens out of strings.
EOF
    },
    attr_opt => [
    ],
    meth_opt => [
        {
            method_name => 'create_token',
            parameter_description => ' LINE[, NR ] ',
            description => <<EOF,
Creates a C<HH::Unispool::Config::File::Token> object out of the specified line. C<LINE> is a plain line string. C<NR> is an optional parameter containing the line number from where the line is read. On error an exception C<Error::Simple> is thrown.
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::File::Token',
            import_list => [ 'qw( :rx )' ],
        },
    ],
} );
