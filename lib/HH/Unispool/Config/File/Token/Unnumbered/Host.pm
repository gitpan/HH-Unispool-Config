package HH::Unispool::Config::File::Token::Unnumbered::Host;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Unnumbered );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'os' => [ 'HH::Unispool::Config::OS' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'name' => [ '^.+$' ],
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

HH::Unispool::Config::File::Token::Unnumbered::Host - class for host I<H> tokens

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

class for host I<H> tokens

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Unnumbered::Host> is a class for host I<H> tokens.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Unnumbered::Host> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=item B<C<os>>

Passed to L<set_os()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token>> may include:

=over

=item B<C<input_line_number>>

Passed to L<set_input_line_number()>.

=back

=item new_from_string(LINE)

This method is inherited from package C<'HH::Unispool::Config::File::Token'>. Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item read_string(LINE)

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Unnumbered'>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item write_string()

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Unnumbered'>. Returns a Unispool config file token line string.

=item set_name(VALUE)

Set the network name of the system. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_name()

Returns the network name of the system.

=item set_os(VALUE)

Set the operating system running on this system. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::OS

=back

=back

=item get_os()

Returns the operating system running on this system.

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::File::Token

=over

=item To access attribute named B<C<input_line_number>>:

set_input_line_number(), get_input_line_number()

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Host::_initialize, first argument must be 'HASH' reference.");

    # name, SINGLE, mandatory
    exists( $opt->{name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Host::_initialize, option 'name' is mandatory.");
    $self->set_name( $opt->{name} );

    # os, SINGLE
    exists( $opt->{os} ) && $self->set_os( $opt->{os} );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($name, $tail) = $line =~ /$USP_H_RX/;
    defined($name) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Host::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    my @tail = $self->_split_tail($tail);

    # Parse line for optional os
    my $os = $tail[0];

    # Set attributes
    $self->set_name($name);
    if ( defined($os) ) {
        require HH::Unispool::Config::OS;
        $self->set_os( HH::Unispool::Config::OS->new( { os => $os } ) );
    }
}

sub write_string {
    my $self = shift;

    # Make string and return it
    $self->get_os() || return(
        sprintf(
            $USP_H1_FRM,
            $self->get_name() || '',
        )
    );
    return(
        sprintf(
            $USP_H2_FRM,
            $self->get_name() || '',
            $self->get_os()->get_os() || '',
        )
    );
}

sub set_name {
    my $self = shift;
    my $val = shift;

    # Value for 'name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Host::set_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Host::set_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Host}{name} = $val;
}

sub get_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Host}{name} );
}

sub set_os {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'os', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Host::set_os, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Host}{os} = $val;
}

sub get_os {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Host}{os} );
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

