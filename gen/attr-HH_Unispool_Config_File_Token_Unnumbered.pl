use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Unnumbered';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token)],
        short_description => 'abstract class for unnumbered tokens',
        abstract => 'abstract class for unnumbered tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for unnumbered tokens.
EOF
    },
    meth_opt => [
        {
             method_name => 'read_string',
            body => <<EOF,
    my \$self = shift;

    \$self->SUPER::read_string(\@_);
EOF
        },
        {
             method_name => 'write_string',
            body => <<EOF,
    my \$self = shift;

    \$self->SUPER::read_string(\@_);
EOF
        },
    ],
} );
