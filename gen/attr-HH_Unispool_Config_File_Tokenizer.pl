use strict;

my $pkg = 'HH::Unispool::Config::File::Tokenizer';

push (@::bean_desc, {
    bean_opt => {
        package => $pkg,
        short_description => 'file tokenizer module',
        abstract => 'file tokenizer module',
        synopsis => "Application programmers don't need to use this class and API programmers read code.\n",
        description => <<EOF,
C<${pkg}> generates C<HH::Unispool::Config::File::Token> objects from an C<IO::Handle>.
EOF
    },
    attr_opt => [
        {
            attribute_name => 'file',
            type => 'SINGLE',
            mandatory => 1,
            allow_isa => [ qw(IO::Handle) ],
            allow_empty => 0,
            short_description => 'the file handle to read from',
        },
        {
            attribute_name => 'got_buffer',
            type => 'MULTI',
            ordered => 1,
            allow_isa => [ qw(HH::Unispool::Config::File::Token) ],
            short_description => 'the I<got> buffer',
        },
        {
            attribute_name => 'unget_buffer',
            type => 'MULTI',
            ordered => 1,
            allow_isa => [ qw(HH::Unispool::Config::File::Token) ],
            short_description => 'the I<unget> buffer',
        },
    ],
    meth_opt => [
        {
            method_name => 'get',
            description => <<EOF,
Either unget a C<HH::Unispool::Config::File::Token> from the B<unget buffer> and return it or read a line from the file, make a C<HH::Unispool::Config::File::Token> out of it and return it. On error a C<Error::Simple> exception is thrown.
EOF
            body => <<EOF,
    my \$self = shift;

    # The token to get
    my \$tok;

    # Shift an token from the unget buffer
    if ( \$tok = \$self->pop_unget_buffer() ) {
        \$self->push_got_buffer(\$tok);
    }

    # Or try making a token from the file
    else {
        # Read a non empty line
        my \$line = undef;
        while ( \$line = \$self->get_file()->getline() ) {
            ( \$line =~ /\\S/ ) && last;
        }

        # Make a token out of the line
        if (\$line) {
            use HH::Unispool::Config::File::Token::Factory;
            my \$fact = HH::Unispool::Config::File::Token::Factory->instance();
            \$tok = \$fact->create_token( \$line, \$self->get_file()->input_line_number() );
            \$self->push_got_buffer(\$tok);
        }
    }

    # Return the token
    return(\$tok);
EOF
        },
        {
            method_name => 'input_line_number',
            description => <<EOF,
Return the last read input line number.
EOF
            body => <<EOF,
    my \$self = shift;

    my \$prev = \$self->pop_got_buffer();
    if ( defined(\$prev) ) {
        \$self->push_got_buffer(\$prev);
        return( \$prev->get_input_line_number() );
    }
    else {
        return(0);
    }
EOF
        },
        {
            method_name => 'unget',
            description => <<EOF,
Unget the last token by moving it from the B<got buffer> to the B<unget buffer>. On error a C<Error::Simple> exception is thrown.
EOF
            body => <<EOF,
    my \$self = shift;

    my \$tok = \$self->pop_got_buffer();
    defined(\$tok) || throw Error::Simple("ERROR: ${pkg}::unget, got buffer is empty.");
    \$self->push_unget_buffer(\$tok);
EOF
        },
    ],
} );
