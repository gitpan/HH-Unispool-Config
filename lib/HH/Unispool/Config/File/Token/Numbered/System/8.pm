package HH::Unispool::Config::File::Token::Numbered::System::8;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered::System );
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

HH::Unispool::Config::File::Token::Numbered::System::8 - system type C<8> system I<S> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

system type C<8> system I<S> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::System::8> contans system type C<8> system I<S> token information.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::System::8> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

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

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token::Numbered::System>> may include:

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

=item new_from_string(LINE)

Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item get_acct()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the remote login account (is not available on development system used).

=item get_apass()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the account password (is not available on development system used).

=item get_block_delay()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item get_execution_priority()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the execution priority of the driver process on MPE hosts.

=item get_input_line_number()

This method is inherited from package C<HH::Unispool::Config::File::Token>. Returns the line number from from which the token is read.

=item get_number()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered>. Returns the number of the entry.

=item get_remote_system_name()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the unique name for the remote system.

=item get_timeout()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the delay before closing the link after transfering the last request (in seconds) (is not available on development system used).

=item get_upass()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns the user paccword (is not available on development system used).

=item is_high_priority_login()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns whether the login must be high priotity (is not available on development system used) or not.

=item is_initially_open()

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns whether the communication link should be opened at the moment UNISPOOL is started or not.

=item read_string(LINE)

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered::System>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item set_acct(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the remote login account (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_apass(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the account password (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_block_delay(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_execution_priority(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the execution priority of the driver process on MPE hosts. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::ExecPri

=back

=back

=item set_high_priority_login(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. State that the login must be high priotity (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item set_initially_open(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. State that the communication link should be opened at the moment UNISPOOL is started. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

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

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the unique name for the remote system. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_timeout(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the delay before closing the link after transfering the last request (in seconds) (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_upass(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token::Numbered::System>. Set the user paccword (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item write_string()

This method is overloaded from package C<HH::Unispool::Config::File::Token::Numbered::System>. Returns a Unispool config file token line string.

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
    my ($number, $remote_system_name, $tail) = $line =~ /$USP_S8_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::8::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
    $remote_system_name =~ s/\s*$//;
    my @tail = $self->_split_tail($tail);
    my $block_delay = $tail[6];
    my $flags = $tail[7];
    my $exec = $tail[8];

    # Set attributes
    $self->set_number($number);
    defined($remote_system_name) && $self->set_remote_system_name($remote_system_name);
    defined($block_delay) && $self->set_block_delay($block_delay);
    defined($flags) && $self->set_initially_open( $flags =~ /i/i );
    defined($flags) && $self->set_high_priority_login( $flags =~ /h/i );
    require HH::Unispool::Config::ExecPri;
    defined($exec) && $self->set_execution_priority( HH::Unispool::Config::ExecPri->new( {execution_priority=> $exec} ) );
}

sub write_string {
    my $self = shift;

    # Make string and return it
    my $flags = '';
    $flags .= $self->is_high_priority_login() ? 'H' : ' ';
    $flags .= $self->is_initially_open() ? 'I' : ' ';
    return(
        sprintf(
            $USP_S8_FRM,
            $self->get_number() || 0,
            $self->get_remote_system_name() || '',
            $self->get_block_delay() || 0,
            $flags || '',
            $self->get_execution_priority()->get_execution_priority() || '',
        )
    );
}

