use strict;

my $pkg = 'HH::Unispool::Config::File::Token::Comment';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::File::Token)],
        short_description => 'Abstract class for comment line string tokens from UNISPOOL config files',
        abstract => 'Abstract class for UNISPOOL comment file tokens',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> is an abstract class for comment line string tokens from UNISPOOL config files.
It groups comment tokens.
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
