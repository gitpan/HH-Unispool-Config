package HH::Unispool::Config::Entry::RemoteSystem::3;

use 5.006;
use base qw( HH::Unispool::Config::Entry::RemoteSystem );
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
    'acct' => [ '^.*$' ],
    'apass' => [ '^.*$' ],
    'remote_node_name' => [ '^[\w\.]+$' ],
    'timeout' => [ '^\d*$' ],
    'upass' => [ '^.*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    'high_priority_login' => 0,
    'timeout' => 180,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::RemoteSystem::3 - UNISPOOL type 3 remote system

=head1 SYNOPSIS

 # Information on remote system type 0 is obtained through an
 # informal document. I guess this remote system type is out
 # of fashion...
 
 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::RemoteSystem::3;
 
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
 
 # Add a type 3 remote system to _Local_
 my $dev = HH::Unispool::Config::Entry::RemoteSystem::3->new( {
     name => 'rsys3',
     acct => 'fred',
     apass => '123wilma',
     upass => '123pebbles',
     remote_node_name => 'barney.bedrock.org',
 } );
 $sysn->add_remote_system($dev);
 
 # Write the configuration
 $conf->write('t/config.sample.r3.out');

=head1 ABSTRACT

UNISPOOL type 3 remote system

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::RemoteSystem::3> holds information for UNISPOOL type 3 remote systems

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::RemoteSystem::3> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<acct>>

Passed to L<set_acct()>.

=item B<C<apass>>

Passed to L<set_apass()>.

=item B<C<high_priority_login>>

Passed to L<set_high_priority_login()>. Defaults to B<0>.

=item B<C<initially_open>>

Passed to L<set_initially_open()>.

=item B<C<remote_node_name>>

Passed to L<set_remote_node_name()>. Mandatory option.

=item B<C<timeout>>

Passed to L<set_timeout()>. Defaults to B<180>.

=item B<C<upass>>

Passed to L<set_upass()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry>> may include:

=over

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry::Numbered>> may include:

=over

=item B<C<diff_number>>

Passed to L<set_diff_number()>. Defaults to B<0>.

=item B<C<number>>

Passed to L<set_number()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry::RemoteSystem>> may include:

=over

=item B<C<description>>

Passed to L<set_description()>.

=item B<C<execution_priority>>

Passed to L<set_execution_priority()>. Defaults to B<HH::Unispool::Config::ExecPri-E<gt>new( { execution_priority => '' } )>.

=back

=item new_from_tokenizer(TOKENIZER)

This method is an implementation from package C<'HH::Unispool::Config::Entry::RemoteSystem'>. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO [, DIFF_NUMBER])

This method is an implementation from package C<'HH::Unispool::Config::Entry::RemoteSystem'>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item write(FILE_HANDLE)

This method is an implementation from package C<'HH::Unispool::Config::Entry::RemoteSystem'>. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item set_acct(VALUE)

Set the remote login account (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_acct()

Returns the remote login account (is not available on development system used).

=item set_apass(VALUE)

Set the account password (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_apass()

Returns the account password (is not available on development system used).

=item set_high_priority_login(VALUE)

State that the login must be high priotity (is not available on development system used). C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_high_priority_login()

Returns whether the login must be high priotity (is not available on development system used) or not.

=item set_initially_open(VALUE)

State that the communication link should be opened at the moment UNISPOOL is started. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=item is_initially_open()

Returns whether the communication link should be opened at the moment UNISPOOL is started or not.

=item set_remote_node_name(VALUE)

Set the name of the system as it can be resolved by the network software. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^[\w\.]+$

=back

=back

=item get_remote_node_name()

Returns the name of the system as it can be resolved by the network software.

=item set_timeout(VALUE)

Set the delay before closing the link after transfering the last request (in seconds) (is not available on development system used). C<VALUE> is the value. Default value at initialization is C<180>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_timeout()

Returns the delay before closing the link after transfering the last request (in seconds) (is not available on development system used).

=item set_upass(VALUE)

Set the user paccword (is not available on development system used). C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item get_upass()

Returns the user paccword (is not available on development system used).

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry

=over

=item To access attribute named B<C<name>>:

set_name(), get_name()

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry::Numbered

=over

=item To access attribute named B<C<diff_number>>:

set_diff_number(), is_diff_number()

=item To access attribute named B<C<number>>:

set_number(), get_number()

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry::RemoteSystem

=over

=item To access attribute named B<C<description>>:

set_description(), get_description()

=item To access attribute named B<C<execution_priority>>:

set_execution_priority(), get_execution_priority()

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::_initialize, first argument must be 'HASH' reference.");

    # acct, SINGLE
    exists( $opt->{acct} ) && $self->set_acct( $opt->{acct} );

    # apass, SINGLE
    exists( $opt->{apass} ) && $self->set_apass( $opt->{apass} );

    # high_priority_login, BOOLEAN, with default value
    $self->set_high_priority_login( exists( $opt->{high_priority_login} ) ? $opt->{high_priority_login} : $DEFAULT_VALUE{high_priority_login} );

    # initially_open, BOOLEAN
    exists( $opt->{initially_open} ) && $self->set_initially_open( $opt->{initially_open} );

    # remote_node_name, SINGLE, mandatory
    exists( $opt->{remote_node_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::_initialize, option 'remote_node_name' is mandatory.");
    $self->set_remote_node_name( $opt->{remote_node_name} );

    # timeout, SINGLE, with default value
    $self->set_timeout( exists( $opt->{timeout} ) ? $opt->{timeout} : $DEFAULT_VALUE{timeout} );

    # upass, SINGLE
    exists( $opt->{upass} ) && $self->set_upass( $opt->{upass} );

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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to, $diff_number);

    # Diff the acct
    if ( $from->get_acct() ne $to->get_acct() ) {
        my $ref = ref($from);
        my $vf = $from->get_acct();
        my $vt = $to->get_acct();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: acct difference: $vf <-> $vt\n";
    }

    # Diff the apass
    if ( $from->get_apass() ne $to->get_apass() ) {
        my $ref = ref($from);
        my $vf = $from->get_apass();
        my $vt = $to->get_apass();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: apass difference: $vf <-> $vt\n";
    }

    # Diff the high priority login state
    if ( $from->is_high_priority_login() != $to->is_high_priority_login() ) {
        my $ref = ref($from);
        my $vf = $from->is_high_priority_login();
        my $vt = $to->is_high_priority_login();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: high priority login difference: $vf <-> $vt\n";
    }

    # Diff the initially open state
    if ( $from->is_initially_open() != $to->is_initially_open() ) {
        my $ref = ref($from);
        my $vf = $from->is_initially_open();
        my $vt = $to->is_initially_open();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: initially open difference: $vf <-> $vt\n";
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

    # Diff the timeout
    if ( $from->get_timeout() ne $to->get_timeout() ) {
        my $ref = ref($from);
        my $vf = $from->get_timeout();
        my $vt = $to->get_timeout();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: timeout difference: $vf <-> $vt\n";
    }

    # Diff the upass
    if ( $from->get_upass() ne $to->get_upass() ) {
        my $ref = ref($from);
        my $vf = $from->get_upass();
        my $vt = $to->get_upass();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: upass difference: $vf <-> $vt\n";
    }

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::System::3
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::System::3') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::System::3'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number() if ( $s->get_number() );
    $opt{name} = $s->get_remote_system_name() if ( $s->get_remote_system_name() );
    $opt{acct} = $s->get_acct() if ( $s->get_acct() );
    $opt{apass} = $s->get_apass() if ( $s->get_apass() );
    $opt{upass} = $s->get_upass() if ( $s->get_upass() );
    $opt{timeout} = $s->get_timeout() if ( $s->get_timeout() );
    $opt{high_priority_login} = $s->is_high_priority_login() if ( $s->is_high_priority_login() );
    $opt{initially_open} = $s->is_initially_open() if ( $s->is_initially_open() );
    $opt{execution_priority} = $s->get_execution_priority() if ( $s->get_execution_priority() );

    # Allow an I and N token
    my $i = undef;
    my $n = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::System::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::System::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description() if ( $i->get_description() );
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Network') ) {
            defined ($n) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Network'.");
            $n = $tok;
            $opt{remote_node_name} = $n->get_remote_node_name() if ( $n->get_remote_node_name() );
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::System::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::RemoteSystem::3->new(\%opt) );
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::System::3;
    my $s = HH::Unispool::Config::File::Token::Numbered::System::3->new( {
        number => $self->get_number(),
        remote_system_name => $self->get_name(),
        acct => $self->get_acct(),
        apass => $self->get_apass(),
        upass => $self->get_upass(),
        timeout => $self->get_timeout(),
        high_priority_login => $self->is_high_priority_login(),
        initially_open => $self->is_initially_open(),
        execution_priority => $self->get_execution_priority(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::System::Info;
    my $i = HH::Unispool::Config::File::Token::Numbered::System::Info->new( {
        number => $self->get_number(),
        description => $self->get_description(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::Network;
    my $n = HH::Unispool::Config::File::Token::Numbered::Network->new( {
        number => $self->get_number(),
        remote_node_name => $self->get_remote_node_name(),
        device_token => 0,
    } );

    # Print the tokens
    $fh->print( $s->write_string() );
    $fh->print( $i->write_string() );
    $fh->print( $n->write_string() );
}

sub set_acct {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'acct', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::set_acct, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{acct} = $val;
}

sub get_acct {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{acct} );
}

sub set_apass {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'apass', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::set_apass, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{apass} = $val;
}

sub get_apass {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{apass} );
}

sub set_high_priority_login {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{high_priority_login} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{high_priority_login} = 0;
    }
}

sub is_high_priority_login {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{high_priority_login} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_initially_open {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{initially_open} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{initially_open} = 0;
    }
}

sub is_initially_open {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{initially_open} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_remote_node_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_node_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::set_remote_node_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{remote_node_name} = $val;
}

sub get_remote_node_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{remote_node_name} );
}

sub set_timeout {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'timeout', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::set_timeout, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{timeout} = $val;
}

sub get_timeout {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{timeout} );
}

sub set_upass {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'upass', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::3::set_upass, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{upass} = $val;
}

sub get_upass {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_3}{upass} );
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

