package HH::Unispool::Config::File::Token::Numbered::X;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );

# Used by _value_is_allowed
our %ALLOW_ISA = (
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'filter_name' => [ '^.*$' ],
    'header_name' => [ '^.*$' ],
    'profile_name' => [ '^.*$' ],
    'trailer_name' => [ '^.*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Numbered::X - I<X> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

I<X> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::X> contans I<X> token information.

=head1 CONSTRUCTOR

=over

=item new( [ OPT_HASH_REF ] )

Creates a new C<HH::Unispool::Config::File::Token::Numbered::X> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<filter_name>>

Passed to L<set_filter_name()>.

=item B<C<header_name>>

Passed to L<set_header_name()>.

=item B<C<profile_name>>

Passed to L<set_profile_name()>.

=item B<C<trailer_name>>

Passed to L<set_trailer_name()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token>> may include:

=over

=item B<C<input_line_number>>

Passed to L<set_input_line_number()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token::Numbered>> may include:

=over

=item B<C<number>>

Passed to L<set_number()>.

=back

=item new_from_string(LINE)

Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item get_filter_name()

Returns the name of the filter file to be used when printfiles for this device are generated.

=item get_header_name()

Returns the control procedure to be executed before printing the printfile.

=item get_input_line_number()

This method is inherited from package C<HH::Unispool::Config::File::Token>. Returns the line number from from which the token is read.

=item get_number()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered>. Returns the number of the entry.

=item get_profile_name()

Returns the name of the profile containing the device initialisation and status checking specification.

=item get_trailer_name()

Returns the control procedure to be executed after printing the printfile.

=item read_string(LINE)

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item set_filter_name(VALUE)

Set the name of the filter file to be used when printfiles for this device are generated. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_header_name(VALUE)

Set the control procedure to be executed before printing the printfile. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

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

=item set_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered>. Set the number of the entry. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_profile_name(VALUE)

Set the name of the profile containing the device initialisation and status checking specification. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_trailer_name(VALUE)

Set the control procedure to be executed after printing the printfile. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item write_string()

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered>. Returns a Unispool config file token line string.

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
L<HH::Unispool::Config::File::Token::Unnumbered>,
L<HH::Unispool::Config::File::Token::Unnumbered::Bcs>,
L<HH::Unispool::Config::File::Token::Unnumbered::CSN>,
L<HH::Unispool::Config::File::Token::Unnumbered::Cs>,
L<HH::Unispool::Config::File::Token::Unnumbered::CsBcs>,
L<HH::Unispool::Config::File::Token::Unnumbered::Filter>,
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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::X::_initialize, first argument must be 'HASH' reference.");

    # filter_name, SINGLE
    exists( $opt->{filter_name} ) && $self->set_filter_name( $opt->{filter_name} );

    # header_name, SINGLE
    exists( $opt->{header_name} ) && $self->set_header_name( $opt->{header_name} );

    # profile_name, SINGLE
    exists( $opt->{profile_name} ) && $self->set_profile_name( $opt->{profile_name} );

    # trailer_name, SINGLE
    exists( $opt->{trailer_name} ) && $self->set_trailer_name( $opt->{trailer_name} );

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
        if ( ! ref($val) && exists( $ALLOW_RX{$name} ) ) {
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

sub get_filter_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_X}{filter_name} );
}

sub get_header_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_X}{header_name} );
}

sub get_profile_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_X}{profile_name} );
}

sub get_trailer_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_X}{trailer_name} );
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($number, $tail) = $line =~ /$USP_X_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::X::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my @tail = $self->_split_tail($tail);
    my $profile_name = $tail[0];
    my $header_name = $tail[1];
    my $trailer_name = $tail[2];
    my $filter_name = $tail[3];

    # Set attributes
    $self->set_number($number);
    defined($profile_name) && $self->set_profile_name($profile_name);
    defined($header_name) && $self->set_header_name($header_name);
    defined($trailer_name) && $self->set_trailer_name($trailer_name);
    defined($filter_name) && $self->set_filter_name($filter_name);
}

sub set_filter_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'filter_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::X::set_filter_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_X}{filter_name} = $val;
}

sub set_header_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'header_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::X::set_header_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_X}{header_name} = $val;
}

sub set_profile_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'profile_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::X::set_profile_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_X}{profile_name} = $val;
}

sub set_trailer_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'trailer_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::X::set_trailer_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_X}{trailer_name} = $val;
}

sub write_string {
    my $self = shift;

    # Make string and return it
    return(
        sprintf(
            $USP_X_FRM,
            $self->get_number() || 0,
            $self->get_profile_name() || '',
            $self->get_header_name() || '',
            $self->get_trailer_name() || '',
            $self->get_filter_name() || '',
        )
    );
}

