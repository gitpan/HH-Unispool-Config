package HH::Unispool::Config::File::Token::Unnumbered::Filter;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Unnumbered );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'type' => [ 'HH::Unispool::Config::FilterType' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'file' => [ '^.+$' ],
    'name' => [ '^.+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Unnumbered::Filter - class for filter I<F> tokens

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

class for filter I<F> tokens

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Unnumbered::Filter> is a class for filter I<F> tokens.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Unnumbered::Filter> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<file>>

Passed to L<set_file()>. Mandatory option.

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=item B<C<type>>

Passed to L<set_type()>. Mandatory option.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token>> may include:

=over

=item B<C<input_line_number>>

Passed to L<set_input_line_number()>.

=back

=item new_from_string(LINE)

Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item get_file()

Returns the file name for the filter.

=item get_input_line_number()

This method is inherited from package C<HH::Unispool::Config::File::Token>. Returns the line number from from which the token is read.

=item get_name()

Returns the reference name for the filter.

=item get_type()

Returns the type of the filter.

=item read_string(LINE)

This method is overloaded from package C<HH::Unispool::Config::File::Token::Unnumbered>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item set_file(VALUE)

Set the file name for the filter. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_input_line_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token>. Set the line number from from which the token is read. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_name(VALUE)

Set the reference name for the filter. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_type(VALUE)

Set the type of the filter. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::FilterType

=back

=back

=item write_string()

This method is overloaded from package C<HH::Unispool::Config::File::Token::Unnumbered>. Returns a Unispool config file token line string.

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
L<HH::Unispool::Config::File::Token::Unnumbered::Host>,
L<HH::Unispool::Config::File::Token::Unnumbered::Misc>,
L<HH::Unispool::Config::File::Tokenizer>,
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

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::_initialize, first argument must be 'HASH' reference.");

    # file, SINGLE, mandatory
    exists( $opt->{file} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::_initialize, option 'file' is mandatory.");
    $self->set_file( $opt->{file} );

    # name, SINGLE, mandatory
    exists( $opt->{name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::_initialize, option 'name' is mandatory.");
    $self->set_name( $opt->{name} );

    # type, SINGLE, mandatory
    exists( $opt->{type} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::_initialize, option 'type' is mandatory.");
    $self->set_type( $opt->{type} );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

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

sub get_file {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Filter}{file} );
}

sub get_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Filter}{name} );
}

sub get_type {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Filter}{type} );
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line
    my ($name, $file, $type) = $line =~ /$USP_FILTER_RX/;
    defined($name) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Set attributes
    $self->set_name($name);
    $self->set_file($file);
    require HH::Unispool::Config::FilterType;
    $self->set_type( HH::Unispool::Config::FilterType->new( {type => $type} ) );
}

sub set_file {
    my $self = shift;
    my $val = shift;

    # Value for 'file' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::set_file, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'file', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::set_file, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Filter}{file} = $val;
}

sub set_name {
    my $self = shift;
    my $val = shift;

    # Value for 'name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::set_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::set_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Filter}{name} = $val;
}

sub set_type {
    my $self = shift;
    my $val = shift;

    # Value for 'type' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::set_type, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'type', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Filter::set_type, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Filter}{type} = $val;
}

sub write_string {
    my $self = shift;

    # Make string and return it
    return(
        sprintf(
            $USP_FILTER_FRM,
            $self->get_name() || '',
            $self->get_file() || '',
            $self->get_type()->get_type() || '',
        )
    );
}

