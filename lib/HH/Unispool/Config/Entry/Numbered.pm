package HH::Unispool::Config::Entry::Numbered;

use 5.006;
use base qw( HH::Unispool::Config::Entry );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);

# Used by _value_is_allowed
our %ALLOW_ISA = (
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'number' => [ '^\d*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    'diff_number' => 0,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::Numbered - Abstract class to group numbered UNISPOOL config entries

=head1 SYNOPSIS

None, this is an abstract class.

=head1 ABSTRACT

Abstract class for UNISPOOL numbered config file entries

=head1 DESCRIPTION

C<HH::Unispool::Config::Entry::Numbered> is an abstract class to group numbered UNISPOOL config entries.
Numbered entries are plain entries with a number which is not identifying in
this API.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::Numbered> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<diff_number>>

Passed to L<set_diff_number()>. Defaults to B<0>.

=item B<C<number>>

Passed to L<set_number()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry>> may include:

=over

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=back

=item new_from_tokenizer(TOKENIZER)

This is an interface method. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO [, DIFF_NUMBER])

This method is overloaded from package C<'HH::Unispool::Config::Entry'>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item write(FILE_HANDLE)

This is an interface method. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item set_diff_number(VALUE)

State that L<diff()> should consider the C<number> attribtutes. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_diff_number()

Returns whether L<diff()> should consider the C<number> attribtutes or not.

=item set_number(VALUE)

Set the entry number. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_number()

Returns the entry number.

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry

=over

=item To access attribute named B<C<name>>:

set_name(), get_name()

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Numbered::_initialize, first argument must be 'HASH' reference.");

    # diff_number, BOOLEAN, with default value
    $self->set_diff_number( exists( $opt->{diff_number} ) ? $opt->{diff_number} : $DEFAULT_VALUE{diff_number} );

    # number, SINGLE
    exists( $opt->{number} ) && $self->set_number( $opt->{number} );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub diff {
    my $from = shift;
    my $to = shift;
    my $diff_number = shift;
    $diff_number = $from->is_diff_number() if ( ! defined( $diff_number ) );

    # Reference types must be identical
    if ( ref($from) ne ref($to) ) {
        my $rf = ref($from);
        my $rt = ref($to);

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Numbered::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to);

    # Diff the number
    if ( $from->is_diff_number() && $from->get_number() ne $to->get_number() ) {
        my $ref = ref($from);
        my $vf = $from->get_number();
        my $vt = $to->get_number();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: number difference: $vf <-> $vt\n";
    }

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Numbered::new_from_tokenizer, call this method in a subclass that has implemented it.");
}

sub write {
    throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Numbered::write, call this method in a subclass that has implemented it.");
}

sub set_diff_number {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Numbered}{diff_number} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Numbered}{diff_number} = 0;
    }
}

sub is_diff_number {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Numbered}{diff_number} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_number {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'number', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Numbered::set_number, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Numbered}{number} = $val;
}

sub get_number {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Numbered}{number} );
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

