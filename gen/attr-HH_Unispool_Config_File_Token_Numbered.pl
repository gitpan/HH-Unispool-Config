use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Numbered';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token)],
        short_description => 'abstract class for numbered tokens',
        abstract => 'abstract class for numbered tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for numbered tokens.
EOF
    },
    attr_opt => [
        {
             attribute_name => 'number',
             allow_rx => [ qw(^\d*$) ],
             short_description => 'the number of the entry',
        },
    ],
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
