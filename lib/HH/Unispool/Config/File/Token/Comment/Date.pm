package HH::Unispool::Config::File::Token::Comment::Date;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Comment );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );
use Time::Local qw( timelocal );

# Used by _value_is_allowed
our %ALLOW_ISA = (
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'time' => [ '^\d+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    # See _initialize for 'time' default value
);

# Unispool <=> unix conversion
our %UNIX2USP_MONTH = ();

# Unispool <=> unix conversion
our %USP2UNIX_MONTH = (
    jan => 0,
    feb => 1,
    mar => 2,
    apr => 3,
    may => 4,
    jun => 5,
    jul => 6,
    aug => 7,
    sep => 8,
    oct => 9,
    nov => 10,
    dec => 11,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

# Unispool <=> unix conversion
our @UNIX2USP_WDAY = qw( SUN MON TUE WED THU FRI SAT );

# Fill UNIX2USP_MONTH
foreach my $mon ( keys(%USP2UNIX_MONTH) ) {
        $UNIX2USP_MONTH{ $USP2UNIX_MONTH{$mon} } = uc($mon);
}

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Comment::Date - date comment token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

date comment token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Comment::Date> contains information on the date comment token.

=head1 CONSTRUCTOR

=over

=item new( [ OPT_HASH_REF ] )

Creates a new C<HH::Unispool::Config::File::Token::Comment::Date> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<time>>

Passed to L<set_time()>. Defaults to B<time()>.

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

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Comment'>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item write_string()

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Comment'>. Returns a Unispool config file token line string.

=item set_time(VALUE)

Set the date in the comment in Unix time. C<VALUE> is the value. Default value at initialization is C<time()>. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_time()

Returns the date in the comment in Unix time.

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

First development: January 2003

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Comment::Date::_initialize, first argument must be 'HASH' reference.");

    # time, SINGLE, with default value
    $self->set_time( exists( $opt->{time} ) ? $opt->{time} : time() );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line
    my ($mon, $mday, $year, $hour, $min, $am_pm) = $line =~ /$USP_DATE_RX/;
    defined($mon) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Comment::Date::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Make Unix time out of obtained values
    if ( $am_pm =~ /am/i && $hour == 12 ) {
        $hour = 0;
    }
    elsif ( $am_pm =~ /pm/i && $hour < 12 ) {
        $hour += 12;
    }
    $mon = $USP2UNIX_MONTH{ lc($mon) };
    my $time = timelocal ( 0, $min, $hour, $mday, $mon, $year - 1900 );

    # Set attributes
    $self->set_time($time);
}

sub write_string {
    my $self = shift;

    # Make string and return it
    my @time = localtime( $self->get_time() );
    my $am_pm = ($time[2] < 12) ? 'AM' : 'PM';
    my $hour12 = $time[2];
    if ( $time[2] == 0 ) {
        $hour12 = 12;
    }
    elsif ( $time[2] > 12 ) {
        $hour12 = $time[2] - 12;
    }
    return(
        sprintf(
            $USP_DATE_FRM,
            $UNIX2USP_WDAY[ $time[6] ] || '',
            $UNIX2USP_MONTH{ $time[4] } || '',
            $time[3] || 0,
            $time[5] + 1900 || 0,
            $hour12 || 0,
            $time[1] || 0,
            $am_pm || 0,
        )
    );
}

sub set_time {
    my $self = shift;
    my $val = shift;

    # Value for 'time' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Comment::Date::set_time, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'time', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Comment::Date::set_time, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Comment_Date}{time} = $val;
}

sub get_time {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Comment_Date}{time} );
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

