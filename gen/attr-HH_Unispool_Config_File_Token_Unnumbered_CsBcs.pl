use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered::CsBcs';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token::Unnumbered)],
        short_description => 'abstract class for CS/BCS tokens',
        abstract => 'abstract class for CS/BCS tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for CS/BCS tokens.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'hostname',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the host name in the comment',
        },
    ],
    meth_opt => [
    ],
} );
