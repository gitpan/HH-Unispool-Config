use strict;

my $pkg = 'HH::Unispool::Config::Entry::Filter';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        base => [qw (HH::Unispool::Config::Entry)],
        short_description => 'UNISPOOL filter information',
        abstract => 'UNISPOOL filter information',
        synopsis => &::read_synopsis('syn-HH_Unispool_Config_Entry_Filter.pl', '.'),
        description => <<EOF,
C<${pkg}> holds information for UNISPOOL filter definitions.
EOF
    },
    attr_opt => [
        {
             method_factory_name => 'file',
             allow_rx => [ qw(^.+$) ],
             mandatory => 1,
             allow_empty => 0,
             short_description => 'the file name for the filter',
        },
        {
             method_factory_name => 'type',
             allow_isa => [ qw (HH::Unispool::Config::FilterType) ],
             default_value => 'HH::Unispool::Config::FilterType->new( { type => \'default\'} )',
             allow_empty => 0,
             short_description => 'the type of the filter',
        },
    ],
    constr_opt => [
        {
            method_name => 'new_from_tokenizer',
            body => <<'EOF',
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a
    # HH::Unispool::Config::File::Token::Unnumbered::Filter
    my $f = $tokenizer->get();
    &UNIVERSAL::isa($f,
            'HH::Unispool::Config::File::Token::Unnumbered::Filter') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::Filte'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{file} = $f->get_file();
    $opt{name} = $f->get_name();
    $opt{type} = $f->get_type();

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Filter->new(\%opt) );
EOF
        },
    ],
    meth_opt => [
        {
            method_name => 'diff',
        },
        {
            method_name => 'write',
            body => <<'EOF',
    my $self = shift;
    my $fh = shift;

    # Make the four token
    require HH::Unispool::Config::File::Token::Unnumbered::Filter;
    my $f = HH::Unispool::Config::File::Token::Unnumbered::Filter->new( {
        file => $self->get_file(),
        name => $self->get_name(),
        type => $self->get_type(),
    } );

    # Print the tokens
    $fh->print( $f->write_string() );
EOF
        },
    ],
    use_opt => [
        {
            dependency_name => 'HH::Unispool::Config::FilterType',
        },
    ],
} );
