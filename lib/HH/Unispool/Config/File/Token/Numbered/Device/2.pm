package HH::Unispool::Config::File::Token::Numbered::Device::2;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered::Device );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Numbered::Device::2 - device type  C<2> device I<D> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

device type  C<2> device I<D> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::Device::2> contans device type  C<2> device I<D> token information.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::Device::2> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

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

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token::Numbered::Device>> may include:

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

=item new_from_string(LINE)

Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item get_block_delay()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item get_buffer_size()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the number of bytes sent to the printer in one write operation.

=item get_connect_retry()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the number of seconds UNISPOOL should wait if the connection can not be established immediately.

=item get_device_name()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the unique name for the device.

=item get_device_password()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the password required to access the device.

=item get_execution_priority()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the execution priority of the driver process on MPE hosts.

=item get_input_line_number()

This method is inherited from package C<HH::Unispool::Config::File::Token>. Returns the line number from from which the token is read.

=item get_number()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered>. Returns the number of the entry.

=item get_page_length()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the page length (lines) for determining the size of UNISPOOL banners.

=item get_page_width()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the page width (bytes) for determining the size of UNISPOOL banners.

=item get_remote_device_name()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the device on the remote system that will receive the output.

=item get_remote_system_name()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns the name of the system to which the output for this device must be routed.

=item is_initially_spooled()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns whether an automatic STARTSPOOL must be performed when UNISPOOL is started or not.

=item is_networkwide()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns whether the device must be made available from each node in the configuration cluster or not.

=item is_save_printfile()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns whether printfiles printed on this device should be saved or not.

=item is_unispool_control()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns whether the UNISPOOL control is on (is not available on development system used) or not.

=item is_unispool_header()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns whether standard UNISPOOL banners pages are printed initially or not.

=item read_string(LINE)

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item set_block_delay(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_buffer_size(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the number of bytes sent to the printer in one write operation. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_connect_retry(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the number of seconds UNISPOOL should wait if the connection can not be established immediately. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_device_name(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the unique name for the device. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_device_password(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the password required to access the device. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_execution_priority(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the execution priority of the driver process on MPE hosts. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::ExecPri

=back

=back

=item set_initially_spooled(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. State that an automatic STARTSPOOL must be performed when UNISPOOL is started. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item set_input_line_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token>. Set the line number from from which the token is read. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_networkwide(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. State that the device must be made available from each node in the configuration cluster. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item set_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered>. Set the number of the entry. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_page_length(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the page length (lines) for determining the size of UNISPOOL banners. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_page_width(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the page width (bytes) for determining the size of UNISPOOL banners. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_remote_device_name(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the device on the remote system that will receive the output. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_remote_system_name(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Set the name of the system to which the output for this device must be routed. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_save_printfile(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. State that printfiles printed on this device should be saved. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item set_unispool_control(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. State that the UNISPOOL control is on (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item set_unispool_header(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::Device>. State that standard UNISPOOL banners pages are printed initially. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item write_string()

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered::Device>. Returns a Unispool config file token line string.

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

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($number, $device_name, $tail) = $line =~ /$USP_D2_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::2::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    $device_name =~ s/\s*$//;
    my @tail = $self->_split_tail($tail);
    my $device_password = $tail[0];
    my $buffer_size = $tail[2];
    my $page_width = $tail[3];
    my $page_length = $tail[4];
    my $flags = $tail[7];
    my $execution_priority = $tail[8];
    defined($flags) && ( $flags =~ /u/i ) && throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::2::read_string, flag 'U' is not allowed in the token's line string.");

    # Set attributes
    $self->set_number($number);
    $self->set_device_name($device_name);
    $self->set_device_password($device_password);
    $self->set_buffer_size($buffer_size);
    $self->set_page_width($page_width);
    $self->set_page_length($page_length);
    require HH::Unispool::Config::ExecPri;
    $self->set_execution_priority( HH::Unispool::Config::ExecPri->new( { execution_priority => $execution_priority } ) );
    $self->set_unispool_header( $flags =~ /h/i );
    $self->set_initially_spooled( $flags =~ /i/i );
    $self->set_networkwide( $flags =~ /n/i );
    $self->set_save_printfile( $flags =~ /s/i );
}

sub write_string {
    my $self = shift;

    # Make string and return it
    my $flags = '';
    $flags .= $self->is_unispool_header() ? 'H' : ' ';
    $flags .= $self->is_initially_spooled() ? 'I' : ' ';
    $flags .= $self->is_networkwide() ? 'N' : ' ';
    $flags .= $self->is_save_printfile() ? 'S' : ' ';
    return(
        sprintf(
            $USP_D2_FRM,
            $self->get_number() || 0,
            $self->get_device_name() || '',
            $self->get_device_password() || '',
            $self->get_buffer_size() || 0,
            $self->get_page_width() || 0,
            $self->get_page_length() || 0,
            $flags || '',
            $self->get_execution_priority()->get_execution_priority() || '',
        )
    );
}

