package HH::Unispool::Config::File::Token::Numbered::System::6;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Numbered::System );
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

HH::Unispool::Config::File::Token::Numbered::System::6 - system type C<6> system I<S> token

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

system type C<6> system I<S> token

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Numbered::System::6> contans system type C<6> system I<S> token information.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Numbered::System::6> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

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

This method is inherited from package C<'HH::Unispool::Config::File::Token'>. Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item read_string(LINE)

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Numbered::System'>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item write_string()

This method is overloaded from package C<'HH::Unispool::Config::File::Token::Numbered::System'>. Returns a Unispool config file token line string.

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

=head1 INHERITED METHODS FROM HH::Unispool::Config::File::Token::Numbered::System

=over

=item To access attribute named B<C<acct>>:

set_acct(), get_acct()

=item To access attribute named B<C<apass>>:

set_apass(), get_apass()

=item To access attribute named B<C<block_delay>>:

set_block_delay(), get_block_delay()

=item To access attribute named B<C<execution_priority>>:

set_execution_priority(), get_execution_priority()

=item To access attribute named B<C<high_priority_login>>:

set_high_priority_login(), is_high_priority_login()

=item To access attribute named B<C<initially_open>>:

set_initially_open(), is_initially_open()

=item To access attribute named B<C<remote_system_name>>:

set_remote_system_name(), get_remote_system_name()

=item To access attribute named B<C<timeout>>:

set_timeout(), get_timeout()

=item To access attribute named B<C<upass>>:

set_upass(), get_upass()

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
    my ($number, $remote_system_name, $tail) = $line =~ /$USP_S6_RX/;
    defined($number) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Numbered::System::6::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");
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
            $USP_S6_FRM,
            $self->get_number() || 0,
            $self->get_remote_system_name() || '',
            $self->get_block_delay() || 0,
            $flags || '',
            $self->get_execution_priority()->get_execution_priority() || '',
        )
    );
}

