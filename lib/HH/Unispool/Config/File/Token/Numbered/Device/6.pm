package HH::Unispool::Config::File::Token::Numbered::Device::6;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered::Device );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Numbered::Device::6 - device type C<6> device I<D> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

device type C<6> device I<D> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::Device::6> contans device type C<6> device I<D> token information.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::Device::6> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

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

This method is inherited from package C<'HH::Unispool::Config::File::Token'>. Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item read_string(LINE)

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Numbered::Device'>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item write_string()

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Numbered::Device'>. Returns a Unispool config file token line string.

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

=head1 INHERITED METHODS FROM HH::Unispool::Config::File::Token::Numbered::Device

=over

=item To access attribute named B<C<block_delay>>:

set_block_delay(), get_block_delay()

=item To access attribute named B<C<buffer_size>>:

set_buffer_size(), get_buffer_size()

=item To access attribute named B<C<connect_retry>>:

set_connect_retry(), get_connect_retry()

=item To access attribute named B<C<device_name>>:

set_device_name(), get_device_name()

=item To access attribute named B<C<device_password>>:

set_device_password(), get_device_password()

=item To access attribute named B<C<execution_priority>>:

set_execution_priority(), get_execution_priority()

=item To access attribute named B<C<initially_spooled>>:

set_initially_spooled(), is_initially_spooled()

=item To access attribute named B<C<networkwide>>:

set_networkwide(), is_networkwide()

=item To access attribute named B<C<page_length>>:

set_page_length(), get_page_length()

=item To access attribute named B<C<page_width>>:

set_page_width(), get_page_width()

=item To access attribute named B<C<remote_device_name>>:

set_remote_device_name(), get_remote_device_name()

=item To access attribute named B<C<remote_system_name>>:

set_remote_system_name(), get_remote_system_name()

=item To access attribute named B<C<save_printfile>>:

set_save_printfile(), is_save_printfile()

=item To access attribute named B<C<unispool_control>>:

set_unispool_control(), is_unispool_control()

=item To access attribute named B<C<unispool_header>>:

set_unispool_header(), is_unispool_header()

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

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($number, $device_name, $tail) = $line =~ /$USP_D6_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::6::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    $device_name =~ s/\s*$//;
    my @tail = $self->_split_tail($tail);
    my $device_password = $tail[0];
    my $block_delay = $tail[2];
    my $connect_retry = $tail[3];
    my $flags = $tail[7];
    my $execution_priority = $tail[8];
    defined($flags) && ( $flags =~ /h/i ) && throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::6::read_string, flag 'H' is not allowed in the token's line string.");
    defined($flags) && ( $flags =~ /u/i ) && throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::Device::6::read_string, flag 'U' is not allowed in the token's line string.");

    # Set attributes
    $self->set_number($number);
    $self->set_device_name($device_name);
    $self->set_device_password($device_password);
    $self->set_block_delay($block_delay);
    $self->set_connect_retry($connect_retry);
    require HH::Unispool::Config::ExecPri;
    $self->set_execution_priority( HH::Unispool::Config::ExecPri->new( { execution_priority => $execution_priority } ) );
    $self->set_initially_spooled( $flags =~ /i/i );
    $self->set_networkwide( $flags =~ /n/i );
    $self->set_save_printfile( $flags =~ /s/i );
}

sub write_string {
    my $self = shift;

    # Make string and return it
    my $flags = '';
    $flags .= ' ';
    $flags .= $self->is_initially_spooled() ? 'I' : ' ';
    $flags .= $self->is_networkwide() ? 'N' : ' ';
    $flags .= $self->is_save_printfile() ? 'S' : ' ';
    $flags .= $self->is_unispool_control() ? 'U' : ' ';
    return(
        sprintf(
            $USP_D6_FRM,
            $self->get_number() || 0,
            $self->get_device_name() || '',
            $self->get_device_password() || '',
            $self->get_block_delay() || 0,
            $self->get_connect_retry() || 0,
            $flags || '',
            $self->get_execution_priority()->get_execution_priority() || '',
        )
    );
}

