use strict;

my $pkg = 'HH::Unispool::Config::Scope';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'UNISPOOL scope',
        abstract => 'UNISPOOL scope',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_DateFormat.pl', '.'),
        description => <<EOF,
C<${pkg}> contains UNISPOOL scope information.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'scope',
             type => 'MULTI',
             unique => 1,
             allow_rx => [ qw(^.+$) ],
             alluw_value => [ qw( _Server_ _Script_ _Network_ System=* ) ],
             default_value => [ qw( _Server_ _Script_ _Network_ System=* ) ],
             allow_empty => 0,
             short_description => 'the dump scope in the comment',
        },
    ],
    meth_opt => [
        {
            method_name => 'diff',
            parameter_description => 'TO',
            description => <<EOF,
Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.
EOF
        },
    ],
    sym_opt => [
        {
            symbol_name => '@USP_SCOPE_ORDER',
            assignment => <<'EOF',
qw( _Server_ _Script_ _Network_ _Local_ );
EOF
            comment => "# Unispool scope order\n",
        },
        {
            symbol_name => '%USP_SCOPE_ORDER',
            assignment => <<'EOF',
();
EOF
            comment => "# Unispool scope order\n",
        },
    ],
} );
