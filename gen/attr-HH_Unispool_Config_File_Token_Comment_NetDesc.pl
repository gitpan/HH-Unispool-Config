use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Comment::NetDesc';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Comment)],
        short_description => 'abstract network description comment token',
        abstract => 'abstract network description comment token',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> contains information on the abstract network description comment token.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'net_desc',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the network descriptor name in the comment',
        },
    ],
    meth_opt => [
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::File::Token',
            import_list => [ 'qw( :rx :frm )' ],
        },
    ],
} );
