package HH::Unispool::Config::File::Tokenizer;

use 5.006;
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'file' => [ 'IO::Handle' ],
    'got_buffer' => [ 'HH::Unispool::Config::File::Token' ],
    'unget_buffer' => [ 'HH::Unispool::Config::File::Token' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Tokenizer - file tokenizer module

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

file tokenizer module

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Tokenizer> generates C<HH::Unispool::Config::File::Token> objects from an C<IO::Handle>.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Tokenizer> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<file>>

Passed to L<set_file()>. Mandatory option.

=item B<C<got_buffer>>

Passed to L<set_got_buffer()>. Must be an C<ARRAY> reference.

=item B<C<unget_buffer>>

Passed to L<set_unget_buffer()>. Must be an C<ARRAY> reference.

=back

=back

=head1 METHODS

=over

=item exists_got_buffer(ARRAY)

Returns the count of items in C<ARRAY> that are in the I<got> buffer.

=item exists_unget_buffer(ARRAY)

Returns the count of items in C<ARRAY> that are in the I<unget> buffer.

=item get()

Either unget a C<HH::Unispool::Config::File::Token> from the B<unget buffer> and return it or read a line from the file, make a C<HH::Unispool::Config::File::Token> out of it and return it. On error a C<Error::Simple> exception is thrown.

=item get_file()

Returns the file handle to read from.

=item get_got_buffer( [ INDEX_ARRAY ] )

Returns an C<ARRAY> containing the I<got> buffer. C<INDEX_ARRAY> is an optional list of indexes which when specified causes only the indexed elements in the ordered list to be returned. If not specified, all elements are returned.

=item get_unget_buffer( [ INDEX_ARRAY ] )

Returns an C<ARRAY> containing the I<unget> buffer. C<INDEX_ARRAY> is an optional list of indexes which when specified causes only the indexed elements in the ordered list to be returned. If not specified, all elements are returned.

=item input_line_number()

Return the last read input line number.

=item pop_got_buffer()

Pop and return an element off the I<got> buffer. On error an exception C<Error::Simple> is thrown.

=item pop_unget_buffer()

Pop and return an element off the I<unget> buffer. On error an exception C<Error::Simple> is thrown.

=item push_got_buffer(ARRAY)

Push additional values on the I<got> buffer. C<ARRAY> is the list value. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item push_unget_buffer(ARRAY)

Push additional values on the I<unget> buffer. C<ARRAY> is the list value. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item set_file(VALUE)

Set the file handle to read from. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item IO::Handle

=back

=back

=item set_got_buffer(ARRAY)

Set the I<got> buffer absolutely. C<ARRAY> is the list value. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item set_idx_got_buffer( INDEX, VALUE )

Set value in the I<got> buffer. C<INDEX> is the integer index which is greater than or equal to C<0>. C<VALUE> is the value.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item set_idx_unget_buffer( INDEX, VALUE )

Set value in the I<unget> buffer. C<INDEX> is the integer index which is greater than or equal to C<0>. C<VALUE> is the value.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item set_num_got_buffer( NUMBER, VALUE )

Set value in the I<got> buffer. C<NUMBER> is the integer index which is greater than C<0>. C<VALUE> is the value.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item set_num_unget_buffer( NUMBER, VALUE )

Set value in the I<unget> buffer. C<NUMBER> is the integer index which is greater than C<0>. C<VALUE> is the value.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item set_unget_buffer(ARRAY)

Set the I<unget> buffer absolutely. C<ARRAY> is the list value. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item shift_got_buffer()

Shift and return an element off the I<got> buffer. On error an exception C<Error::Simple> is thrown.

=item shift_unget_buffer()

Shift and return an element off the I<unget> buffer. On error an exception C<Error::Simple> is thrown.

=item unget()

Unget the last token by moving it from the B<got buffer> to the B<unget buffer>. On error a C<Error::Simple> exception is thrown.

=item unshift_got_buffer(ARRAY)

Unshift additional values on the I<got> buffer. C<ARRAY> is the list value. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=item unshift_unget_buffer(ARRAY)

Unshift additional values on the I<unget> buffer. C<ARRAY> is the list value. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::File::Token

=back

=back

=back

=head1 SEE ALSO

L<HH::Unispool::Config>,
L<HH::Unispool::Config::DateFormat>,
L<HH::Unispool::Config::Entry>,
L<HH::Unispool::Config::Entry::Device>,
L<HH::Unispool::Config::Entry::Device::0>,
L<HH::Unispool::Config::Entry::Device::1>,
L<HH::Unispool::Config::Entry::Device::2>,
L<HH::Unispool::Config::Entry::Device::3>,
L<HH::Unispool::Config::Entry::Device::4>,
L<HH::Unispool::Config::Entry::Device::5>,
L<HH::Unispool::Config::Entry::Device::6>,
L<HH::Unispool::Config::Entry::Device::7>,
L<HH::Unispool::Config::Entry::Filter>,
L<HH::Unispool::Config::Entry::Numbered>,
L<HH::Unispool::Config::Entry::RemoteSystem>,
L<HH::Unispool::Config::Entry::RemoteSystem::3>,
L<HH::Unispool::Config::Entry::RemoteSystem::6>,
L<HH::Unispool::Config::Entry::RemoteSystem::7>,
L<HH::Unispool::Config::Entry::RemoteSystem::8>,
L<HH::Unispool::Config::Entry::System>,
L<HH::Unispool::Config::ExecPri>,
L<HH::Unispool::Config::File::Token>,
L<HH::Unispool::Config::File::Token::Comment>,
L<HH::Unispool::Config::File::Token::Comment::Cs>,
L<HH::Unispool::Config::File::Token::Comment::Date>,
L<HH::Unispool::Config::File::Token::Comment::Device>,
L<HH::Unispool::Config::File::Token::Comment::Filter>,
L<HH::Unispool::Config::File::Token::Comment::Group>,
L<HH::Unispool::Config::File::Token::Comment::Head>,
L<HH::Unispool::Config::File::Token::Comment::Misc>,
L<HH::Unispool::Config::File::Token::Comment::NetDesc>,
L<HH::Unispool::Config::File::Token::Comment::RSys>,
L<HH::Unispool::Config::File::Token::Comment::Scope>,
L<HH::Unispool::Config::File::Token::Comment::Tail>,
L<HH::Unispool::Config::File::Token::Factory>,
L<HH::Unispool::Config::File::Token::Numbered>,
L<HH::Unispool::Config::File::Token::Numbered::Device>,
L<HH::Unispool::Config::File::Token::Numbered::Device::0>,
L<HH::Unispool::Config::File::Token::Numbered::Device::1>,
L<HH::Unispool::Config::File::Token::Numbered::Device::2>,
L<HH::Unispool::Config::File::Token::Numbered::Device::3>,
L<HH::Unispool::Config::File::Token::Numbered::Device::4>,
L<HH::Unispool::Config::File::Token::Numbered::Device::5>,
L<HH::Unispool::Config::File::Token::Numbered::Device::6>,
L<HH::Unispool::Config::File::Token::Numbered::Device::7>,
L<HH::Unispool::Config::File::Token::Numbered::Device::Group>,
L<HH::Unispool::Config::File::Token::Numbered::Device::Info>,
L<HH::Unispool::Config::File::Token::Numbered::Device::P>,
L<HH::Unispool::Config::File::Token::Numbered::Network>,
L<HH::Unispool::Config::File::Token::Numbered::System>,
L<HH::Unispool::Config::File::Token::Numbered::System::3>,
L<HH::Unispool::Config::File::Token::Numbered::System::6>,
L<HH::Unispool::Config::File::Token::Numbered::System::7>,
L<HH::Unispool::Config::File::Token::Numbered::System::8>,
L<HH::Unispool::Config::File::Token::Numbered::System::Info>,
L<HH::Unispool::Config::File::Token::Numbered::X>,
L<HH::Unispool::Config::File::Token::Unnumbered>,
L<HH::Unispool::Config::File::Token::Unnumbered::Bcs>,
L<HH::Unispool::Config::File::Token::Unnumbered::CSN>,
L<HH::Unispool::Config::File::Token::Unnumbered::Cs>,
L<HH::Unispool::Config::File::Token::Unnumbered::CsBcs>,
L<HH::Unispool::Config::File::Token::Unnumbered::Filter>,
L<HH::Unispool::Config::File::Token::Unnumbered::Host>,
L<HH::Unispool::Config::File::Token::Unnumbered::Misc>,
L<HH::Unispool::Config::FilterType>,
L<HH::Unispool::Config::OS>,
L<HH::Unispool::Config::Scope>

=head1 BUGS

None known (yet.)

=head1 HISTORY

First development: February 2003
Last update: September 2003

=head1 AUTHOR

Vincenzo Zocca

=head1 COPYRIGHT

Copyright 2003 by Vincenzo Zocca

=head1 LICENSE

This file is part of the C<HH::Unispool::Config> module hierarchy for Perl by
Vincenzo Zocca.

The HH::Unispool::Config module hierarchy is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2 of
the License, or (at your option) any later version.

The HH::Unispool::Config module hierarchy is distributed in the hope that it will
be useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the HH::Unispool::Config module hierarchy; if not, write to
the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
Boston, MA 02111-1307 USA

=cut

sub new {
    my $class = shift;

    my $self = {};
    bless( $self, ( ref($class) || $class ) );
    return( $self->_initialize(@_) );
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::_initialize, first argument must be 'HASH' reference.");

    # file, SINGLE, mandatory
    exists( $opt->{file} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::_initialize, option 'file' is mandatory.");
    $self->set_file( $opt->{file} );

    # got_buffer, MULTI
    if ( exists( $opt->{got_buffer} ) ) {
        ref( $opt->{got_buffer} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::_initialize, specified value for option 'got_buffer' must be an 'ARRAY' reference.");
        $self->set_got_buffer( @{ $opt->{got_buffer} } );
    }
    else {
        $self->set_got_buffer();
    }

    # unget_buffer, MULTI
    if ( exists( $opt->{unget_buffer} ) ) {
        ref( $opt->{unget_buffer} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::_initialize, specified value for option 'unget_buffer' must be an 'ARRAY' reference.");
        $self->set_unget_buffer( @{ $opt->{unget_buffer} } );
    }
    else {
        $self->set_unget_buffer();
    }

    # Return $self
    return($self);
}

sub _value_is_allowed {
    my $name = shift;

    # Value is allowed if no ALLOW clauses exist for the named attribute
    if ( ! exists( $ALLOW_ISA{$name} ) && ! exists( $ALLOW_REF{$name} ) && ! exists( $ALLOW_RX{$name} ) && ! exists( $ALLOW_VALUE{$name} ) ) {
        return(1);
    }

    # At this point, all values in @_ must to be allowed
    CHECK_VALUES:
    foreach my $val (@_) {
        # Check ALLOW_ISA
        if ( ref($val) && exists( $ALLOW_ISA{$name} ) ) {
            foreach my $class ( @{ $ALLOW_ISA{$name} } ) {
                &UNIVERSAL::isa( $val, $class ) && next CHECK_VALUES;
            }
        }

        # Check ALLOW_REF
        if ( ref($val) && exists( $ALLOW_REF{$name} ) ) {
            exists( $ALLOW_REF{$name}{ ref($val) } ) && next CHECK_VALUES;
        }

        # Check ALLOW_RX
        if ( defined($val) && ! ref($val) && exists( $ALLOW_RX{$name} ) ) {
            foreach my $rx ( @{ $ALLOW_RX{$name} } ) {
                $val =~ /$rx/ && next CHECK_VALUES;
            }
        }

        # Check ALLOW_VALUE
        if ( ! ref($val) && exists( $ALLOW_VALUE{$name} ) ) {
            exists( $ALLOW_VALUE{$name}{$val} ) && next CHECK_VALUES;
        }

        # We caught a not allowed value
        return(0);
    }

    # OK, all values are allowed
    return(1);
}

sub exists_got_buffer {
    my $self = shift;

    # Count occurrences
    my $count = 0;
    foreach my $val1 (@_) {
        foreach my $val2 ( @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} } ) {
            ( $val1 eq $val2 ) && $count ++;
        }
    }
    return($count);
}

sub exists_unget_buffer {
    my $self = shift;

    # Count occurrences
    my $count = 0;
    foreach my $val1 (@_) {
        foreach my $val2 ( @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} } ) {
            ( $val1 eq $val2 ) && $count ++;
        }
    }
    return($count);
}

sub get {
    my $self = shift;

    # The token to get
    my $tok;

    # Shift an token from the unget buffer
    if ( $tok = $self->pop_unget_buffer() ) {
        $self->push_got_buffer($tok);
    }

    # Or try making a token from the file
    else {
        # Read a non empty line
        my $line = undef;
        while ( $line = $self->get_file()->getline() ) {
            ( $line =~ /\S/ ) && last;
        }

        # Make a token out of the line
        if ($line) {
            use HH::Unispool::Config::File::Token::Factory;
            my $fact = HH::Unispool::Config::File::Token::Factory->instance();
            $tok = $fact->create_token( $line, $self->get_file()->input_line_number() );
            $self->push_got_buffer($tok);
        }
    }

    # Return the token
    return($tok);
}

sub get_file {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Tokenizer}{file} );
}

sub get_got_buffer {
    my $self = shift;

    if ( scalar(@_) ) {
        my @ret = ();
        foreach my $i (@_) {
            push( @ret, $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer}[ int($i) ] );
        }
        return(@ret);
    }
    else {
        # Return the full list
        return( @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} } );
    }
}

sub get_unget_buffer {
    my $self = shift;

    if ( scalar(@_) ) {
        my @ret = ();
        foreach my $i (@_) {
            push( @ret, $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer}[ int($i) ] );
        }
        return(@ret);
    }
    else {
        # Return the full list
        return( @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} } );
    }
}

sub input_line_number {
    my $self = shift;

    my $prev = $self->pop_got_buffer();
    if ( defined($prev) ) {
        $self->push_got_buffer($prev);
        return( $prev->get_input_line_number() );
    }
    else {
        return(0);
    }
}

sub pop_got_buffer {
    my $self = shift;

    # Pop an element from the list
    return( pop( @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} } ) );
}

sub pop_unget_buffer {
    my $self = shift;

    # Pop an element from the list
    return( pop( @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} } ) );
}

sub push_got_buffer {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'got_buffer', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::push_got_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Push the list
    push( @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} }, @_ );
}

sub push_unget_buffer {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'unget_buffer', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::push_unget_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Push the list
    push( @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} }, @_ );
}

sub set_file {
    my $self = shift;
    my $val = shift;

    # Value for 'file' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_file, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'file', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_file, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Tokenizer}{file} = $val;
}

sub set_got_buffer {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'got_buffer', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_got_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Set the list
    @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} } = @_;
}

sub set_idx_got_buffer {
    my $self = shift;
    my $idx = shift;
    my $val = shift;

    # Check if index is a positive integer or zero
    ( $idx == int($idx) ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_idx_got_buffer, the specified index '$idx' is not an integer.");
    ( $idx >= 0 ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_idx_got_buffer, the specified index '$idx' is not a positive integer or zero.");

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'got_buffer', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_idx_got_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Set the value in the list
    $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer}[$idx] = $val;
}

sub set_idx_unget_buffer {
    my $self = shift;
    my $idx = shift;
    my $val = shift;

    # Check if index is a positive integer or zero
    ( $idx == int($idx) ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_idx_unget_buffer, the specified index '$idx' is not an integer.");
    ( $idx >= 0 ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_idx_unget_buffer, the specified index '$idx' is not a positive integer or zero.");

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'unget_buffer', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_idx_unget_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Set the value in the list
    $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer}[$idx] = $val;
}

sub set_num_got_buffer {
    my $self = shift;
    my $num = shift;

    # Check if index is an integer
    ( $num == int($num) ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_num_got_buffer, the specified number '$num' is not an integer.");

    # Call set_idx_got_buffer
    $self->set_idx_got_buffer( $num - 1, @_ );
}

sub set_num_unget_buffer {
    my $self = shift;
    my $num = shift;

    # Check if index is an integer
    ( $num == int($num) ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_num_unget_buffer, the specified number '$num' is not an integer.");

    # Call set_idx_unget_buffer
    $self->set_idx_unget_buffer( $num - 1, @_ );
}

sub set_unget_buffer {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'unget_buffer', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::set_unget_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Set the list
    @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} } = @_;
}

sub shift_got_buffer {
    my $self = shift;

    # Shift an element from the list
    return( shift( @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} } ) );
}

sub shift_unget_buffer {
    my $self = shift;

    # Shift an element from the list
    return( shift( @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} } ) );
}

sub unget {
    my $self = shift;

    my $tok = $self->pop_got_buffer();
    defined($tok) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::unget, got buffer is empty.");
    $self->push_unget_buffer($tok);
}

sub unshift_got_buffer {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'got_buffer', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::unshift_got_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Unshift the list
    unshift( @{ $self->{HH_Unispool_Config_File_Tokenizer}{got_buffer} }, @_ );
}

sub unshift_unget_buffer {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'unget_buffer', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Tokenizer::unshift_unget_buffer, one or more specified value(s) '@_' is/are not allowed.");

    # Unshift the list
    unshift( @{ $self->{HH_Unispool_Config_File_Tokenizer}{unget_buffer} }, @_ );
}

