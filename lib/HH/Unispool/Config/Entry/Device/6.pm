package HH::Unispool::Config::Entry::Device::6;

use 5.006;
use base qw( HH::Unispool::Config::Entry::Device );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::ExecPri;

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'execution_priority' => [ 'HH::Unispool::Config::ExecPri' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'block_delay' => [ '^\d*$' ],
    'connect_retry' => [ '^\d+$' ],
    'device_password' => [ '^.*$' ],
    'header_name' => [ '^.*$' ],
    'profile_name' => [ '^.*$' ],
    'remote_node_name' => [ '^.+$' ],
    'server_tcp_port' => [ '^.*$' ],
    'trailer_name' => [ '^.*$' ],
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
    'block_delay' => 0,
    'connect_retry' => 0,
    'execution_priority' => HH::Unispool::Config::ExecPri->new( { execution_priority => '' } ),
    'initially_spooled' => 1,
    'networkwide' => 1,
    'protocol' => 'TCP',
    'save_printfile' => 0,
    'server_tcp_port' => 9100,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::Device::6 - UNISPOOL type 6 device

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::Device::6;
 
 # Create a config from scratch with a _Local_ scope
 my $conf = HH::Unispool::Config->new( {
     scope => HH::Unispool::Config::Scope->new ( {
         scope => [ qw( _Local_) ],
     } ),
 } );
 
 # Create the _Local_ system and add it to the configuration
 my $sysn = HH::Unispool::Config::Entry::System->new( {
     name => '_Local_',
     local_system_name => 'foo',
     network_name => 'foo.bar.org',
     os => HH::Unispool::Config::OS->new( {
         os => 'Solaris',
     } ),
 } );
 $conf->add_system($sysn);
 
 # Add a type 6 device to _Local_
 my $dev = HH::Unispool::Config::Entry::Device::6->new( {
     name => 'lp',
     filter_name => 'cat',
     remote_node_name => 'lp.foo.bar.org',
     description => 'lp',
 } );
 $sysn->add_device($dev);
 
 # Write the configuration
 $conf->write('t/config.sample.d6.out');

=head1 ABSTRACT

UNISPOOL type 6 device

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::Device::6> holds information for UNISPOOL type 6 device

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::Device::6> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<block_delay>>

Passed to L<set_block_delay()>. Defaults to B<0>.

=item B<C<connect_retry>>

Passed to L<set_connect_retry()>. Defaults to B<0>.

=item B<C<device_password>>

Passed to L<set_device_password()>.

=item B<C<execution_priority>>

Passed to L<set_execution_priority()>. Defaults to B<HH::Unispool::Config::ExecPri-E<gt>new( { execution_priority => '' } )>.

=item B<C<header_name>>

Passed to L<set_header_name()>.

=item B<C<initially_spooled>>

Passed to L<set_initially_spooled()>. Defaults to B<1>.

=item B<C<networkwide>>

Passed to L<set_networkwide()>. Defaults to B<1>.

=item B<C<profile_name>>

Passed to L<set_profile_name()>.

=item B<C<protocol>>

Passed to L<set_protocol()>. Defaults to B<'TCP'>.

=item B<C<remote_node_name>>

Passed to L<set_remote_node_name()>. Mandatory option.

=item B<C<save_printfile>>

Passed to L<set_save_printfile()>. Defaults to B<0>.

=item B<C<server_tcp_port>>

Passed to L<set_server_tcp_port()>. Defaults to B<9100>.

=item B<C<trailer_name>>

Passed to L<set_trailer_name()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry>> may include:

=over

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry::Device>> may include:

=over

=item B<C<description>>

Passed to L<set_description()>.

=item B<C<filter_name>>

Passed to L<set_filter_name()>. Mandatory option.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry::Numbered>> may include:

=over

=item B<C<diff_number>>

Passed to L<set_diff_number()>. Defaults to B<0>.

=item B<C<number>>

Passed to L<set_number()>.

=back

=item new_from_tokenizer(TOKENIZER)

This method is an implementation from package C<'HH::Unispool::Config::Entry::Device'>. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO [, DIFF_NUMBER])

This method is an implementation from package C<'HH::Unispool::Config::Entry::Device'>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item write(FILE_HANDLE)

This method is an implementation from package C<'HH::Unispool::Config::Entry::Device'>. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item set_block_delay(VALUE)

Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_block_delay()

Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item set_connect_retry(VALUE)

Set the number of seconds UNISPOOL should wait if the connection can not be established immediately. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_connect_retry()

Returns the number of seconds UNISPOOL should wait if the connection can not be established immediately.

=item set_device_password(VALUE)

Set the password required to access the device. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_device_password()

Returns the password required to access the device.

=item set_execution_priority(VALUE)

Set the execution priority of the driver process on MPE hosts. C<VALUE> is the value. Default value at initialization is C<HH::Unispool::Config::ExecPri-E<gt>new( { execution_priority => '' } )>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::ExecPri

=back

=back

=item get_execution_priority()

Returns the execution priority of the driver process on MPE hosts.

=item set_header_name(VALUE)

Set the control procedure to be executed before printing the printfile. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_header_name()

Returns the control procedure to be executed before printing the printfile.

=item set_initially_spooled(VALUE)

State that an automatic STARTSPOOL must be performed when UNISPOOL is started. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item is_initially_spooled()

Returns whether an automatic STARTSPOOL must be performed when UNISPOOL is started or not.

=item set_networkwide(VALUE)

State that the device must be made available from each node in the configuration cluster. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item is_networkwide()

Returns whether the device must be made available from each node in the configuration cluster or not.

=item set_profile_name(VALUE)

Set the name of the profile containing the device initialisation and status checking specification. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_profile_name()

Returns the name of the profile containing the device initialisation and status checking specification.

=item set_protocol(VALUE)

Set the protocol to be used for the device. C<VALUE> is the value. Default value at initialization is C<'TCP'>. On error an exception C<Error::Simple> is thrown.

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

=item set_save_printfile(VALUE)

State that printfiles printed on this device should be saved. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_save_printfile()

Returns whether printfiles printed on this device should be saved or not.

=item set_server_tcp_port(VALUE)

Set the TCP port assigned on the print server. C<VALUE> is the value. Default value at initialization is C<9100>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_server_tcp_port()

Returns the TCP port assigned on the print server.

=item set_trailer_name(VALUE)

Set the control procedure to be executed after printing the printfile. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_trailer_name()

Returns the control procedure to be executed after printing the printfile.

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry

=over

=item To access attribute named B<C<name>>:

set_name(), get_name()

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry::Device

=over

=item To access attribute named B<C<description>>:

set_description(), get_description()

=item To access attribute named B<C<filter_name>>:

set_filter_name(), get_filter_name()

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry::Numbered

=over

=item To access attribute named B<C<diff_number>>:

set_diff_number(), is_diff_number()

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::_initialize, first argument must be 'HASH' reference.");

    # block_delay, SINGLE, with default value
    $self->set_block_delay( exists( $opt->{block_delay} ) ? $opt->{block_delay} : $DEFAULT_VALUE{block_delay} );

    # connect_retry, SINGLE, with default value
    $self->set_connect_retry( exists( $opt->{connect_retry} ) ? $opt->{connect_retry} : $DEFAULT_VALUE{connect_retry} );

    # device_password, SINGLE
    exists( $opt->{device_password} ) && $self->set_device_password( $opt->{device_password} );

    # execution_priority, SINGLE, with default value
    $self->set_execution_priority( exists( $opt->{execution_priority} ) ? $opt->{execution_priority} : $DEFAULT_VALUE{execution_priority} );

    # header_name, SINGLE
    exists( $opt->{header_name} ) && $self->set_header_name( $opt->{header_name} );

    # initially_spooled, BOOLEAN, with default value
    $self->set_initially_spooled( exists( $opt->{initially_spooled} ) ? $opt->{initially_spooled} : $DEFAULT_VALUE{initially_spooled} );

    # networkwide, BOOLEAN, with default value
    $self->set_networkwide( exists( $opt->{networkwide} ) ? $opt->{networkwide} : $DEFAULT_VALUE{networkwide} );

    # profile_name, SINGLE
    exists( $opt->{profile_name} ) && $self->set_profile_name( $opt->{profile_name} );

    # protocol, SINGLE, with default value
    $self->set_protocol( exists( $opt->{protocol} ) ? $opt->{protocol} : $DEFAULT_VALUE{protocol} );

    # remote_node_name, SINGLE, mandatory
    exists( $opt->{remote_node_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::_initialize, option 'remote_node_name' is mandatory.");
    $self->set_remote_node_name( $opt->{remote_node_name} );

    # save_printfile, BOOLEAN, with default value
    $self->set_save_printfile( exists( $opt->{save_printfile} ) ? $opt->{save_printfile} : $DEFAULT_VALUE{save_printfile} );

    # server_tcp_port, SINGLE, with default value
    $self->set_server_tcp_port( exists( $opt->{server_tcp_port} ) ? $opt->{server_tcp_port} : $DEFAULT_VALUE{server_tcp_port} );

    # trailer_name, SINGLE
    exists( $opt->{trailer_name} ) && $self->set_trailer_name( $opt->{trailer_name} );

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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to, $diff_number);

    # Diff the block delay
    if ( $from->get_block_delay() ne $to->get_block_delay() ) {
        my $ref = ref($from);
        my $vf = $from->get_block_delay();
        my $vt = $to->get_block_delay();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: block delay difference: $vf <-> $vt\n";
    }

    # Diff the connect retry
    if ( $from->get_connect_retry() ne $to->get_connect_retry() ) {
        my $ref = ref($from);
        my $vf = $from->get_connect_retry();
        my $vt = $to->get_connect_retry();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: connect retry difference: $vf <-> $vt\n";
    }

    # Diff the device password
    if ( $from->get_device_password() ne $to->get_device_password() ) {
        my $ref = ref($from);
        my $vf = $from->get_device_password();
        my $vt = $to->get_device_password();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: device password difference: $vf <-> $vt\n";
    }

    # Diff the execution priority
    $diff .= $from->get_execution_priority()->diff(
                                                $to->get_execution_priority() );

    # Diff the header name
    if ( $from->get_header_name() ne $to->get_header_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_header_name();
        my $vt = $to->get_header_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: header name difference: $vf <-> $vt\n";
    }

    # Diff the initially spooled state
    if ( $from->is_initially_spooled() != $to->is_initially_spooled() ) {
        my $ref = ref($from);
        my $vf = $from->is_initially_spooled();
        my $vt = $to->is_initially_spooled();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: initially spooled difference: $vf <-> $vt\n";
    }

    # Diff the networkwide state
    if ( $from->is_networkwide() != $to->is_networkwide() ) {
        my $ref = ref($from);
        my $vf = $from->is_networkwide();
        my $vt = $to->is_networkwide();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: networkwide difference: $vf <-> $vt\n";
    }

    # Diff the profile name
    if ( $from->get_profile_name() ne $to->get_profile_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_profile_name();
        my $vt = $to->get_profile_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: profile name difference: $vf <-> $vt\n";
    }

    # Diff the protocol
    if ( $from->get_protocol() ne $to->get_protocol() ) {
        my $ref = ref($from);
        my $vf = $from->get_protocol();
        my $vt = $to->get_protocol();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: protocol difference: $vf <-> $vt\n";
    }

    # Diff the remote node name
    if ( $from->get_remote_node_name() ne $to->get_remote_node_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_remote_node_name();
        my $vt = $to->get_remote_node_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: remote node name difference: $vf <-> $vt\n";
    }

    # Diff the save printfile state
    if ( $from->is_save_printfile() != $to->is_save_printfile() ) {
        my $ref = ref($from);
        my $vf = $from->is_save_printfile();
        my $vt = $to->is_save_printfile();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: save printfile difference: $vf <-> $vt\n";
    }

    # Diff the server tcp port
    if ( $from->get_server_tcp_port() ne $to->get_server_tcp_port() ) {
        my $ref = ref($from);
        my $vf = $from->get_server_tcp_port();
        my $vt = $to->get_server_tcp_port();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: server tcp port difference: $vf <-> $vt\n";
    }

    # Diff the trailer name
    if ( $from->get_trailer_name() ne $to->get_trailer_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_trailer_name();
        my $vt = $to->get_trailer_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: trailer name difference: $vf <-> $vt\n";
    }

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::6
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::Device::6') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::6'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number();
    $opt{name} = $s->get_device_name();
    $opt{device_password} = $s->get_device_password();
    $opt{block_delay} = $s->get_block_delay();
    $opt{connect_retry} = $s->get_connect_retry();
    $opt{initially_spooled} = $s->is_initially_spooled();
    $opt{networkwide} = $s->is_networkwide();
    $opt{save_printfile} = $s->is_save_printfile();
    $opt{execution_priority} = $s->get_execution_priority();

    # Allow N, X and I tokens
    my $n = undef;
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Network') ) {
            defined ($p) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::0::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Network'.");
            $n = $tok;
            $opt{remote_node_name} = $n->get_remote_node_name();
            $opt{protocol} = $n->get_protocol();
            $opt{server_tcp_port} = $n->get_server_tcp_port();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{profile_name} = $x->get_profile_name();
            $opt{header_name} = $x->get_header_name();
            $opt{trailer_name} = $x->get_trailer_name();
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::6->new(\%opt) );
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::Device::6;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::6->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        device_password => $self->get_device_password(),
        block_delay => $self->get_block_delay(),
        connect_retry => $self->get_connect_retry(),
        initially_spooled => $self->is_initially_spooled(),
        networkwide => $self->is_networkwide(),
        save_printfile => $self->is_save_printfile(),
        execution_priority => $self->get_execution_priority(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::Network;
    my $n = HH::Unispool::Config::File::Token::Numbered::Network->new( {
        number => $self->get_number(),
        remote_node_name => $self->get_remote_node_name(),
        protocol => $self->get_protocol(),
        server_tcp_port => $self->get_server_tcp_port(),
        device_token => 1,
    } );

    require HH::Unispool::Config::File::Token::Numbered::X;
    my $x = HH::Unispool::Config::File::Token::Numbered::X->new( {
        number => $self->get_number(),
        profile_name => $self->get_profile_name(),
        header_name => $self->get_header_name(),
        trailer_name => $self->get_trailer_name(),
        filter_name => $self->get_filter_name(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::Device::Info;
    my $i = HH::Unispool::Config::File::Token::Numbered::Device::Info->new( {
        number => $self->get_number(),
        description => $self->get_description(),
    } );

    # Print the tokens
    $fh->print( $d->write_string() );
    $fh->print( $i->write_string() );
    $fh->print( $n->write_string() );
    $fh->print( $x->write_string() );
}

sub set_block_delay {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'block_delay', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_block_delay, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{block_delay} = $val;
}

sub get_block_delay {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{block_delay} );
}

sub set_connect_retry {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'connect_retry', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_connect_retry, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{connect_retry} = $val;
}

sub get_connect_retry {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{connect_retry} );
}

sub set_device_password {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'device_password', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_device_password, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{device_password} = $val;
}

sub get_device_password {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{device_password} );
}

sub set_execution_priority {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'execution_priority', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_execution_priority, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{execution_priority} = $val;
}

sub get_execution_priority {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{execution_priority} );
}

sub set_header_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'header_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_header_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{header_name} = $val;
}

sub get_header_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{header_name} );
}

sub set_initially_spooled {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_6}{initially_spooled} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_6}{initially_spooled} = 0;
    }
}

sub is_initially_spooled {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_6}{initially_spooled} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_networkwide {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_6}{networkwide} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_6}{networkwide} = 0;
    }
}

sub is_networkwide {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_6}{networkwide} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_profile_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'profile_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_profile_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{profile_name} = $val;
}

sub get_profile_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{profile_name} );
}

sub set_protocol {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'protocol', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_protocol, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{protocol} = $val;
}

sub get_protocol {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{protocol} );
}

sub set_remote_node_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_node_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_remote_node_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{remote_node_name} = $val;
}

sub get_remote_node_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{remote_node_name} );
}

sub set_save_printfile {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_6}{save_printfile} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_6}{save_printfile} = 0;
    }
}

sub is_save_printfile {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_6}{save_printfile} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_server_tcp_port {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'server_tcp_port', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_server_tcp_port, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{server_tcp_port} = $val;
}

sub get_server_tcp_port {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{server_tcp_port} );
}

sub set_trailer_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'trailer_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::6::set_trailer_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_6}{trailer_name} = $val;
}

sub get_trailer_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_6}{trailer_name} );
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

