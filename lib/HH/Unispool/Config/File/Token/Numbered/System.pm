package HH::Unispool::Config::File::Token::Numbered::System;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'execution_priority' => [ 'HH::Unispool::Config::ExecPri' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'acct' => [ '^.*$' ],
    'apass' => [ '^.*$' ],
    'block_delay' => [ '^\d*$' ],
    'remote_system_name' => [ '^.+$' ],
    'timeout' => [ '^\d*$' ],
    'upass' => [ '^.*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Numbered::System - abstract class for system I<S> tokens

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

abstract class for system I<S> tokens

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::System> is an abstract class for system I<S> tokens.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::System> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<acct>>

Passed to L<set_acct()>.

=item B<C<apass>>

Passed to L<set_apass()>.

=item B<C<block_delay>>

Passed to L<set_block_delay()>.

=item B<C<execution_priority>>

Passed to L<set_execution_priority()>.

=item B<C<high_priority_login>>

Passed to L<set_high_priority_login()>.

=item B<C<initially_open>>

Passed to L<set_initially_open()>.

=item B<C<remote_system_name>>

Passed to L<set_remote_system_name()>. Mandatory option.

=item B<C<timeout>>

Passed to L<set_timeout()>.

=item B<C<upass>>

Passed to L<set_upass()>.

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

=item get_acct()

Returns the remote login account (is not available on development system used).

=item get_apass()

Returns the account password (is not available on development system used).

=item get_block_delay()

Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item get_execution_priority()

Returns the execution priority of the driver process on MPE hosts.

=item get_input_line_number()

This method is inherited from package C<HH::Unispool::Config::File::Token>. Returns the line number from from which the token is read.

=item get_number()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered>. Returns the number of the entry.

=item get_remote_system_name()

Returns the unique name for the remote system.

=item get_timeout()

Returns the delay before closing the link after transfering the last request (in seconds) (is not available on development system used).

=item get_upass()

Returns the user paccword (is not available on development system used).

=item is_high_priority_login()

Returns whether the login must be high priotity (is not available on development system used) or not.

=item is_initially_open()

Returns whether the communication link should be opened at the moment UNISPOOL is started or not.

=item read_string(LINE)

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item set_acct(VALUE)

Set the remote login account (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_apass(VALUE)

Set the account password (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_block_delay(VALUE)

Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_execution_priority(VALUE)

Set the execution priority of the driver process on MPE hosts. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::ExecPri

=back

=back

=item set_high_priority_login(VALUE)

State that the login must be high priotity (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item set_initially_open(VALUE)

State that the communication link should be opened at the moment UNISPOOL is started. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

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

=item set_remote_system_name(VALUE)

Set the unique name for the remote system. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_timeout(VALUE)

Set the delay before closing the link after transfering the last request (in seconds) (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_upass(VALUE)

Set the user paccword (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::_initialize, first argument must be 'HASH' reference.");

    # acct, SINGLE
    exists( $opt->{acct} ) && $self->set_acct( $opt->{acct} );

    # apass, SINGLE
    exists( $opt->{apass} ) && $self->set_apass( $opt->{apass} );

    # block_delay, SINGLE
    exists( $opt->{block_delay} ) && $self->set_block_delay( $opt->{block_delay} );

    # execution_priority, SINGLE
    exists( $opt->{execution_priority} ) && $self->set_execution_priority( $opt->{execution_priority} );

    # high_priority_login, BOOLEAN
    exists( $opt->{high_priority_login} ) && $self->set_high_priority_login( $opt->{high_priority_login} );

    # initially_open, BOOLEAN
    exists( $opt->{initially_open} ) && $self->set_initially_open( $opt->{initially_open} );

    # remote_system_name, SINGLE, mandatory
    exists( $opt->{remote_system_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::_initialize, option 'remote_system_name' is mandatory.");
    $self->set_remote_system_name( $opt->{remote_system_name} );

    # timeout, SINGLE
    exists( $opt->{timeout} ) && $self->set_timeout( $opt->{timeout} );

    # upass, SINGLE
    exists( $opt->{upass} ) && $self->set_upass( $opt->{upass} );

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

sub get_acct {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{acct} );
}

sub get_apass {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{apass} );
}

sub get_block_delay {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{block_delay} );
}

sub get_execution_priority {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{execution_priority} );
}

sub get_remote_system_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{remote_system_name} );
}

sub get_timeout {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{timeout} );
}

sub get_upass {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_System}{upass} );
}

sub is_high_priority_login {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_System}{high_priority_login} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub is_initially_open {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_System}{initially_open} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub read_string {
    my $self = shift;

    $self->SUPER::read_string(@_);
}

sub set_acct {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'acct', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_acct, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{acct} = $val;
}

sub set_apass {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'apass', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_apass, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{apass} = $val;
}

sub set_block_delay {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'block_delay', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_block_delay, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{block_delay} = $val;
}

sub set_execution_priority {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'execution_priority', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_execution_priority, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{execution_priority} = $val;
}

sub set_high_priority_login {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_System}{high_priority_login} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_System}{high_priority_login} = 0;
    }
}

sub set_initially_open {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_System}{initially_open} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_System}{initially_open} = 0;
    }
}

sub set_remote_system_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_system_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_remote_system_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{remote_system_name} = $val;
}

sub set_timeout {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'timeout', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_timeout, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{timeout} = $val;
}

sub set_upass {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'upass', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::set_upass, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_System}{upass} = $val;
}

sub write_string {
    my $self = shift;

    $self->SUPER::read_string(@_);
}

