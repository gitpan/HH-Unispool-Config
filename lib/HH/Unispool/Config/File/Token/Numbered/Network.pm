package HH::Unispool::Config::File::Token::Numbered::Network;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered );
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
    'remote_node_name' => [ '^.+$' ],
    'server_tcp_port' => [ '^.*$' ],
    'transfer_size' => [ '^\d*$' ],
    'transfer_time_out' => [ '^\d*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
    'protocol' => {
        'LPD' => 1,
        'PJL' => 1,
        'TCP' => 1,
        'XPP' => 1,
    },
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Numbered::Network - network I<N> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

network I<N> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::Network> contans network I<N> token information.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::Network> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<device_token>>

Passed to L<set_device_token()>.

=item B<C<os>>

Passed to L<set_os()>.

=item B<C<protocol>>

Passed to L<set_protocol()>.

=item B<C<remote_node_name>>

Passed to L<set_remote_node_name()>. Mandatory option.

=item B<C<server_tcp_port>>

Passed to L<set_server_tcp_port()>.

=item B<C<transfer_size>>

Passed to L<set_transfer_size()>.

=item B<C<transfer_time_out>>

Passed to L<set_transfer_time_out()>.

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

=item set_device_token(VALUE)

State that this is a device token. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_device_token()

Returns whether this is a device token or not.

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

=item set_protocol(VALUE)

Set the protocol to be used for the device. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a one of:

=over

=item LPD

=item PJL

=item TCP

=item XPP

=back

=back

=item get_protocol()

Returns the protocol to be used for the device.

=item set_remote_node_name(VALUE)

Set the name of the system as it can be resolved by the network software. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_remote_node_name()

Returns the name of the system as it can be resolved by the network software.

=item set_server_tcp_port(VALUE)

Set the TCP port assigned on the print server. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_server_tcp_port()

Returns the TCP port assigned on the print server.

=item set_transfer_size(VALUE)

Set the size of the data blocks to be transfered. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_transfer_size()

Returns the size of the data blocks to be transfered.

=item set_transfer_time_out(VALUE)

Set the time in which a transfer must be completed to be considered successful. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_transfer_time_out()

Returns the time in which a transfer must be completed to be considered successful.

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
L<HH::Unispool::Config::File::Token::Numbered::Device::Group>,
L<HH::Unispool::Config::File::Token::Numbered::Device::Info>,
L<HH::Unispool::Config::File::Token::Numbered::Device::P>,
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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::_initialize, first argument must be 'HASH' reference.");

    # device_token, BOOLEAN
    exists( $opt->{device_token} ) && $self->set_device_token( $opt->{device_token} );

    # os, SINGLE
    exists( $opt->{os} ) && $self->set_os( $opt->{os} );

    # protocol, SINGLE
    exists( $opt->{protocol} ) && $self->set_protocol( $opt->{protocol} );

    # remote_node_name, SINGLE, mandatory
    exists( $opt->{remote_node_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::_initialize, option 'remote_node_name' is mandatory.");
    $self->set_remote_node_name( $opt->{remote_node_name} );

    # server_tcp_port, SINGLE
    exists( $opt->{server_tcp_port} ) && $self->set_server_tcp_port( $opt->{server_tcp_port} );

    # transfer_size, SINGLE
    exists( $opt->{transfer_size} ) && $self->set_transfer_size( $opt->{transfer_size} );

    # transfer_time_out, SINGLE
    exists( $opt->{transfer_time_out} ) && $self->set_transfer_time_out( $opt->{transfer_time_out} );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($number, $remote_node_name, $tail) = $line =~ /$USP_N_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    $remote_node_name =~ s/\s*$//;
    my @tail = $self->_split_tail($tail);
    ( scalar(@tail) > 3 ) && throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::read_string, parameter 'LINE' contains too many ';' separated entries after the remote node name '$remote_node_name'.");

    # Set attributes
    $self->set_number($number);
    defined($remote_node_name) && $self->set_remote_node_name($remote_node_name);

    if (defined ( $tail[1] ) && $tail[1] eq 'SERVER') {
        $self->set_device_token(1);
        defined( $tail[0] ) && $self->set_protocol( $tail[0] );
        defined( $tail[2] ) && $self->set_server_tcp_port( $tail[2] );
    }
    else {
        $self->set_device_token(0);
        if ( defined( $tail[0] ) && $tail[0] ) {
            require HH::Unispool::Config::OS;
            $self->set_os( HH::Unispool::Config::OS->new( { os => $tail[0] } ) );
        }
        defined( $tail[1] ) && $self->set_transfer_size( $tail[1] );
        defined( $tail[2] ) && $self->set_transfer_time_out( $tail[2] );
    }
}

sub write_string {
    my $self = shift;

    # Make string and return it
    $self->is_device_token() && return(
        sprintf(
            $USP_ND_FRM,
            $self->get_number() || 0,
            $self->get_remote_node_name() || '',
            $self->get_protocol() || '',
            $self->get_server_tcp_port() || '',
        )
    );

    if ( defined( $self->get_os() ) && defined( $self->get_transfer_size() ) && $self->get_transfer_size() || defined( $self->get_transfer_time_out() ) && $self->get_transfer_time_out() ) {
        return(
            sprintf(
                $USP_N5_FRM,
                $self->get_number() || 0,
                $self->get_remote_node_name() || '',
                $self->get_os()->get_os() || '',
                $self->get_transfer_size() || 0,
                $self->get_transfer_time_out() || 0,
            )
        );
    }
    if ( defined( $self->get_os() ) ) {
        return(
            sprintf(
                $USP_N3_FRM,
                $self->get_number() || 0,
                $self->get_remote_node_name() || '',
                $self->get_os()->get_os() || '',
            )
        );
    }
    return(
        sprintf(
            $USP_N2_FRM,
            $self->get_number() || 0,
            $self->get_remote_node_name() || '',
        )
    );
}

sub set_device_token {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Network}{device_token} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_Network}{device_token} = 0;
    }
}

sub is_device_token {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{device_token} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_os {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'os', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::set_os, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Network}{os} = $val;
}

sub get_os {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{os} );
}

sub set_protocol {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'protocol', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::set_protocol, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Network}{protocol} = $val;
}

sub get_protocol {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{protocol} );
}

sub set_remote_node_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_node_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::set_remote_node_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Network}{remote_node_name} = $val;
}

sub get_remote_node_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{remote_node_name} );
}

sub set_server_tcp_port {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'server_tcp_port', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::set_server_tcp_port, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Network}{server_tcp_port} = $val;
}

sub get_server_tcp_port {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{server_tcp_port} );
}

sub set_transfer_size {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'transfer_size', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::set_transfer_size, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Network}{transfer_size} = $val;
}

sub get_transfer_size {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{transfer_size} );
}

sub set_transfer_time_out {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'transfer_time_out', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Network::set_transfer_time_out, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Network}{transfer_time_out} = $val;
}

sub get_transfer_time_out {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Network}{transfer_time_out} );
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

