package HH::Unispool::Config::File::Token::Numbered::Device;

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
    'block_delay' => [ '^\d*$' ],
    'buffer_size' => [ '^\d*$' ],
    'connect_retry' => [ '^\d*$' ],
    'device_name' => [ '^.+$' ],
    'device_password' => [ '^.*$' ],
    'page_length' => [ '^\d*$' ],
    'page_width' => [ '^\d*$' ],
    'remote_device_name' => [ '^.*$' ],
    'remote_system_name' => [ '^.*$' ],
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

HH::Unispool::Config::File::Token::Numbered::Device - abstract class for device I<D> tokens

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

abstract class for device I<D> tokens

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::Device> is an abstract class for device I<D> tokens.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::Device> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<block_delay>>

Passed to L<set_block_delay()>.

=item B<C<buffer_size>>

Passed to L<set_buffer_size()>.

=item B<C<connect_retry>>

Passed to L<set_connect_retry()>.

=item B<C<device_name>>

Passed to L<set_device_name()>. Mandatory option.

=item B<C<device_password>>

Passed to L<set_device_password()>.

=item B<C<execution_priority>>

Passed to L<set_execution_priority()>.

=item B<C<initially_spooled>>

Passed to L<set_initially_spooled()>.

=item B<C<networkwide>>

Passed to L<set_networkwide()>.

=item B<C<page_length>>

Passed to L<set_page_length()>.

=item B<C<page_width>>

Passed to L<set_page_width()>.

=item B<C<remote_device_name>>

Passed to L<set_remote_device_name()>.

=item B<C<remote_system_name>>

Passed to L<set_remote_system_name()>.

=item B<C<save_printfile>>

Passed to L<set_save_printfile()>.

=item B<C<unispool_control>>

Passed to L<set_unispool_control()>.

=item B<C<unispool_header>>

Passed to L<set_unispool_header()>.

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

=item set_block_delay(VALUE)

Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_block_delay()

Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item set_buffer_size(VALUE)

Set the number of bytes sent to the printer in one write operation. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_buffer_size()

Returns the number of bytes sent to the printer in one write operation.

=item set_connect_retry(VALUE)

Set the number of seconds UNISPOOL should wait if the connection can not be established immediately. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_connect_retry()

Returns the number of seconds UNISPOOL should wait if the connection can not be established immediately.

=item set_device_name(VALUE)

Set the unique name for the device. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_device_name()

Returns the unique name for the device.

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

Set the execution priority of the driver process on MPE hosts. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::ExecPri

=back

=back

=item get_execution_priority()

Returns the execution priority of the driver process on MPE hosts.

=item set_initially_spooled(VALUE)

State that an automatic STARTSPOOL must be performed when UNISPOOL is started. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_initially_spooled()

Returns whether an automatic STARTSPOOL must be performed when UNISPOOL is started or not.

=item set_networkwide(VALUE)

State that the device must be made available from each node in the configuration cluster. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_networkwide()

Returns whether the device must be made available from each node in the configuration cluster or not.

=item set_page_length(VALUE)

Set the page length (lines) for determining the size of UNISPOOL banners. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_page_length()

Returns the page length (lines) for determining the size of UNISPOOL banners.

=item set_page_width(VALUE)

Set the page width (bytes) for determining the size of UNISPOOL banners. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_page_width()

Returns the page width (bytes) for determining the size of UNISPOOL banners.

=item set_remote_device_name(VALUE)

Set the device on the remote system that will receive the output. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_remote_device_name()

Returns the device on the remote system that will receive the output.

=item set_remote_system_name(VALUE)

Set the name of the system to which the output for this device must be routed. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_remote_system_name()

Returns the name of the system to which the output for this device must be routed.

=item set_save_printfile(VALUE)

State that printfiles printed on this device should be saved. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_save_printfile()

Returns whether printfiles printed on this device should be saved or not.

=item set_unispool_control(VALUE)

State that the UNISPOOL control is on (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_unispool_control()

Returns whether the UNISPOOL control is on (is not available on development system used) or not.

=item set_unispool_header(VALUE)

State that standard UNISPOOL banners pages are printed initially. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_unispool_header()

Returns whether standard UNISPOOL banners pages are printed initially or not.

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::_initialize, first argument must be 'HASH' reference.");

    # block_delay, SINGLE
    exists( $opt->{block_delay} ) && $self->set_block_delay( $opt->{block_delay} );

    # buffer_size, SINGLE
    exists( $opt->{buffer_size} ) && $self->set_buffer_size( $opt->{buffer_size} );

    # connect_retry, SINGLE
    exists( $opt->{connect_retry} ) && $self->set_connect_retry( $opt->{connect_retry} );

    # device_name, SINGLE, mandatory
    exists( $opt->{device_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::_initialize, option 'device_name' is mandatory.");
    $self->set_device_name( $opt->{device_name} );

    # device_password, SINGLE
    exists( $opt->{device_password} ) && $self->set_device_password( $opt->{device_password} );

    # execution_priority, SINGLE
    exists( $opt->{execution_priority} ) && $self->set_execution_priority( $opt->{execution_priority} );

    # initially_spooled, BOOLEAN
    exists( $opt->{initially_spooled} ) && $self->set_initially_spooled( $opt->{initially_spooled} );

    # networkwide, BOOLEAN
    exists( $opt->{networkwide} ) && $self->set_networkwide( $opt->{networkwide} );

    # page_length, SINGLE
    exists( $opt->{page_length} ) && $self->set_page_length( $opt->{page_length} );

    # page_width, SINGLE
    exists( $opt->{page_width} ) && $self->set_page_width( $opt->{page_width} );

    # remote_device_name, SINGLE
    exists( $opt->{remote_device_name} ) && $self->set_remote_device_name( $opt->{remote_device_name} );

    # remote_system_name, SINGLE
    exists( $opt->{remote_system_name} ) && $self->set_remote_system_name( $opt->{remote_system_name} );

    # save_printfile, BOOLEAN
    exists( $opt->{save_printfile} ) && $self->set_save_printfile( $opt->{save_printfile} );

    # unispool_control, BOOLEAN
    exists( $opt->{unispool_control} ) && $self->set_unispool_control( $opt->{unispool_control} );

    # unispool_header, BOOLEAN
    exists( $opt->{unispool_header} ) && $self->set_unispool_header( $opt->{unispool_header} );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub read_string {
    my $self = shift;

    $self->SUPER::read_string(@_);
}

sub write_string {
    my $self = shift;

    $self->SUPER::read_string(@_);
}

sub set_block_delay {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'block_delay', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_block_delay, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{block_delay} = $val;
}

sub get_block_delay {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{block_delay} );
}

sub set_buffer_size {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'buffer_size', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_buffer_size, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{buffer_size} = $val;
}

sub get_buffer_size {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{buffer_size} );
}

sub set_connect_retry {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'connect_retry', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_connect_retry, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{connect_retry} = $val;
}

sub get_connect_retry {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{connect_retry} );
}

sub set_device_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'device_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_device_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{device_name} = $val;
}

sub get_device_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{device_name} );
}

sub set_device_password {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'device_password', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_device_password, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{device_password} = $val;
}

sub get_device_password {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{device_password} );
}

sub set_execution_priority {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'execution_priority', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_execution_priority, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{execution_priority} = $val;
}

sub get_execution_priority {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{execution_priority} );
}

sub set_initially_spooled {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{initially_spooled} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{initially_spooled} = 0;
    }
}

sub is_initially_spooled {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{initially_spooled} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_networkwide {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{networkwide} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{networkwide} = 0;
    }
}

sub is_networkwide {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{networkwide} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_page_length {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'page_length', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_page_length, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{page_length} = $val;
}

sub get_page_length {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{page_length} );
}

sub set_page_width {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'page_width', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_page_width, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{page_width} = $val;
}

sub get_page_width {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{page_width} );
}

sub set_remote_device_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_device_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_remote_device_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{remote_device_name} = $val;
}

sub get_remote_device_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{remote_device_name} );
}

sub set_remote_system_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_system_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::set_remote_system_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Numbered_Device}{remote_system_name} = $val;
}

sub get_remote_system_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{remote_system_name} );
}

sub set_save_printfile {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{save_printfile} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{save_printfile} = 0;
    }
}

sub is_save_printfile {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{save_printfile} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_unispool_control {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{unispool_control} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{unispool_control} = 0;
    }
}

sub is_unispool_control {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{unispool_control} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_unispool_header {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{unispool_header} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Numbered_Device}{unispool_header} = 0;
    }
}

sub is_unispool_header {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Numbered_Device}{unispool_header} ) {
        return(1);
    }
    else {
        return(0);
    }
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

