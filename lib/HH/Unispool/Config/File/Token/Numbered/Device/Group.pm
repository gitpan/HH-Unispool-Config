package HH::Unispool::Config::File::Token::Numbered::Device::Group;

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
    'member_device_name' => [ '^.+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Numbered::Device::Group - group device I<G> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

group device I<G> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::Device::Group> contains information on the group device I<G> token.

=head1 CONSTRUCTOR

=over

=item new( [ OPT_HASH_REF ] )

Creates a new C<HH::Unispool::Config::File::Token::Numbered::Device::Group> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<member_device_name>>

Passed to L<set_member_device_name()>. Must be an C<ARRAY> reference.

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

This method is inherited from package C<'HH::Unispool::Config::File::Token'>. Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item read_string(LINE)

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Numbered'>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item write_string()

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Numbered'>. Returns a Unispool config file token line string.

=item set_member_device_name(ARRAY)

Set the name of a device that can be accessed through the group device absolutely. C<ARRAY> is the list value. Each element in the list is allowed to occur only once. Multiple occurences of the same element yield in the last occuring element to be inserted and the rest to be ignored. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must match regular expression:

=over

=item ^.+$

=back

=back

=item add_member_device_name(ARRAY)

Add additional values on the name of a device that can be accessed through the group device. C<ARRAY> is the list value. The addition may not yield to multiple identical elements in the list. Hence, multiple occurences of the same element cause the last occurence to be inserted. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must match regular expression:

=over

=item ^.+$

=back

=back

=item delete_member_device_name(ARRAY)

Delete elements from the name of a device that can be accessed through the group device. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item exists_member_device_name(ARRAY)

Returns the count of items in C<ARRAY> that are in the name of a device that can be accessed through the group device.

=item values_member_device_name()

Returns an C<ARRAY> containing all values of the name of a device that can be accessed through the group device.

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::File::Token

=over

=item To access attribute named B<C<input_line_number>>:

set_input_line_number(), get_input_line_number()

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::File::Token::Numbered

=over

=item To access attribute named B<C<number>>:

set_number(), get_number()

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
L<HH::Unispool::Config::File::Tokenizer>,
L<HH::Unispool::Config::FilterType>,
L<HH::Unispool::Config::OS>,
L<HH::Unispool::Config::Scope>

=head1 BUGS

None known (yet.)

=head1 HISTORY

First development: February 2003

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::Group::_initialize, first argument must be 'HASH' reference.");

    # member_device_name, MULTI
    if ( exists( $opt->{member_device_name} ) ) {
        ref( $opt->{member_device_name} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::Group::_initialize, specified value for option 'member_device_name' must be an 'ARRAY' reference.");
        $self->set_member_device_name( @{ $opt->{member_device_name} } );
    }
    else {
        $self->set_member_device_name();
    }

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($number, $tail) = $line =~ /$USP_G_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::Group::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my @member = $self->_split_tail($tail);

    # Set attributes
    $self->set_number($number);
    $self->set_member_device_name();
    ($member[0]) && $self->add_member_device_name($member[0]);
    ($member[1]) && $self->add_member_device_name($member[1]);
    ($member[2]) && $self->add_member_device_name($member[2]);
    ($member[3]) && $self->add_member_device_name($member[3]);
}

sub write_string {
    my $self = shift;

    # Make string and return it
    my @member = sort( $self->values_member_device_name() );
    return(
        sprintf(
            $USP_G_FRM,
            $self->get_number() || 0,
            $member[0] || '',
            $member[1] || '',
            $member[2] || '',
            $member[3] || '',
        )
    );
}

sub set_member_device_name {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'member_device_name', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::Group::set_member_device_name, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name} = {};

    # Add values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name}{$val} = $val;
    }
}

sub add_member_device_name {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'member_device_name', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::Group::add_member_device_name, one or more specified value(s) '@_' is/are not allowed.");

    # Add values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name}{$val} = $val;
    }
}

sub delete_member_device_name {
    my $self = shift;

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name}{$val} ) || next;
        delete( $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name}{$val} );
        $del ++;
    }
    return($del);
}

sub exists_member_device_name {
    my $self = shift;

    # Count occurences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name}{$val} );
    }
    return($count);
}

sub values_member_device_name {
    my $self = shift;

    # Return all values
    return( values( %{ $self->{HH_Unispool_Config_File_Token_Numbered_Device_Group}{member_device_name} } ) );
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

