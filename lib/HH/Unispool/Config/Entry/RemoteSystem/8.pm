package HH::Unispool::Config::Entry::RemoteSystem::8;

use 5.006;
use base qw( HH::Unispool::Config::Entry::RemoteSystem );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'os' => [ 'HH::Unispool::Config::OS' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'block_delay' => [ '^\d*$' ],
    'remote_node_name' => [ '^[\w\.]+$' ],
    'transfer_size' => [ '^\d*$' ],
    'transfer_time_out' => [ '^\d*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _initialize
our %DEFAULT_VALUE = (
    'block_delay' => 0,
    'initially_open' => 1,
    'transfer_size' => 4098,
    'transfer_time_out' => 180,
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::RemoteSystem::8 - UNISPOOL type 8 remote system

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::RemoteSystem::8;
 
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
 
 # Add a type 8 remote system to _Local_
 my $dev = HH::Unispool::Config::Entry::RemoteSystem::8->new( {
     name => 'rsys8',
     remote_node_name => 'barney.bedrock.org',
     os => HH::Unispool::Config::OS->new( {
         os => 'Solaris',
     } ),
 } );
 $sysn->add_remote_system($dev);
 
 # Write the configuration
 $conf->write('t/config.sample.r8.out');

=head1 ABSTRACT

UNISPOOL type 8 remote system

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::RemoteSystem::8> holds information for UNISPOOL type 8 remote systems

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::RemoteSystem::8> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<block_delay>>

Passed to L<set_block_delay()>. Defaults to B<0>.

=item B<C<initially_open>>

Passed to L<set_initially_open()>. Defaults to B<1>.

=item B<C<os>>

Passed to L<set_os()>. Mandatory option.

=item B<C<remote_node_name>>

Passed to L<set_remote_node_name()>. Mandatory option.

=item B<C<transfer_size>>

Passed to L<set_transfer_size()>. Defaults to B<4098>.

=item B<C<transfer_time_out>>

Passed to L<set_transfer_time_out()>. Defaults to B<180>.

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

This method is an implementation from package C<HH::Unispool::Config::Entry::RemoteSystem>. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO [, DIFF_NUMBER])

This method is an implementation from package C<HH::Unispool::Config::Entry::RemoteSystem>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item get_block_delay()

Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item get_description()

This method is inherited from package C<HH::Unispool::Config::Entry::RemoteSystem>. Returns the description for the remote system.

=item get_execution_priority()

This method is inherited from package C<HH::Unispool::Config::Entry::RemoteSystem>. Returns the execution priority of the driver process on MPE hosts.

=item get_name()

This method is inherited from package C<HH::Unispool::Config::Entry>. Returns the entry name.

=item get_number()

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. Returns the entry number.

=item get_os()

Returns the operating system running on the remote node.

=item get_remote_node_name()

Returns the name of the system as it can be resolved by the network software.

=item get_transfer_size()

Returns the size of the data blocks to be transfered.

=item get_transfer_time_out()

Returns the time in which a transfer must be completed to be considered successful.

=item is_diff_number()

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. Returns whether L<diff()> should consider the C<number> attribtutes or not.

=item is_initially_open()

Returns whether the communication link should be opened at the moment UNISPOOL is started or not.

=item set_block_delay(VALUE)

Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_description(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::RemoteSystem>. Set the description for the remote system. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_diff_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. State that L<diff()> should consider the C<number> attribtutes. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_execution_priority(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::RemoteSystem>. Set the execution priority of the driver process on MPE hosts. C<VALUE> is the value. Default value at initialization is C<HH::Unispool::Config::ExecPri->new( { execution_priority => '' } )>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::ExecPri

=back

=back

=item set_initially_open(VALUE)

State that the communication link should be opened at the moment UNISPOOL is started. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item set_name(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry>. Set the entry name. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. Set the entry number. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_os(VALUE)

Set the operating system running on the remote node. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::OS

=back

=back

=item set_remote_node_name(VALUE)

Set the name of the system as it can be resolved by the network software. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^[\w\.]+$

=back

=back

=item set_transfer_size(VALUE)

Set the size of the data blocks to be transfered. C<VALUE> is the value. Default value at initialization is C<4098>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_transfer_time_out(VALUE)

Set the time in which a transfer must be completed to be considered successful. C<VALUE> is the value. Default value at initialization is C<180>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item write(FILE_HANDLE)

This method is an implementation from package C<HH::Unispool::Config::Entry::RemoteSystem>. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

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

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::System::8
    my $s = $tokenizer->get();
    my $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($s, 'HH::Unispool::Config::File::Token::Numbered::System::8') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::System::8' on or directly after line '$line.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number() if ( $s->get_number() );
    $opt{name} = $s->get_remote_system_name() if ( $s->get_remote_system_name() );
    $opt{block_delay} = $s->get_block_delay() if ( $s->get_block_delay() );
    $opt{initially_open} = $s->is_initially_open() if ( $s->is_initially_open() );
    $opt{execution_priority} = $s->get_execution_priority() if ( $s->get_execution_priority() );

    # Allow an I and N token
    my $i = undef;
    my $n = undef;
    while ( my $tok = $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Only allow HH::Unispool::Config::File::Token::Numbered tokens
        # with the same number as the 'S' line
        if ( ! $tok->isa( 'HH::Unispool::Config::File::Token::Numbered' ) ||
                    $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }

        # Handle HH::Unispool::Config::File::Token::Numbered::System::Info
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::Info') ) {

            # Do not allow double tokens
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::System::Info' on or directly after line '$line.");
            $i = $tok;

            # Fill out %opt
            $opt{description} = $i->get_description() if ( $i->get_description() );
        }

        # Handle HH::Unispool::Config::File::Token::Numbered::Network
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Network') ) {

            # Do not allow double tokens
            defined ($n) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Network' on or directly after line '$line.");
            $n = $tok;

            # Fill out %opt
            $opt{remote_node_name} = $n->get_remote_node_name();
            $opt{os} = $n->get_os();
            $opt{transfer_size} = $n->get_transfer_size();
            $opt{transfer_time_out} = $n->get_transfer_time_out();
        }
        else {
            $tokenizer->unget();
            last;
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::RemoteSystem::8->new(\%opt) );
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::_initialize, first argument must be 'HASH' reference.");

    # block_delay, SINGLE, with default value
    $self->set_block_delay( exists( $opt->{block_delay} ) ? $opt->{block_delay} : $DEFAULT_VALUE{block_delay} );

    # initially_open, BOOLEAN, with default value
    $self->set_initially_open( exists( $opt->{initially_open} ) ? $opt->{initially_open} : $DEFAULT_VALUE{initially_open} );

    # os, SINGLE, mandatory
    exists( $opt->{os} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::_initialize, option 'os' is mandatory.");
    $self->set_os( $opt->{os} );

    # remote_node_name, SINGLE, mandatory
    exists( $opt->{remote_node_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::_initialize, option 'remote_node_name' is mandatory.");
    $self->set_remote_node_name( $opt->{remote_node_name} );

    # transfer_size, SINGLE, with default value
    $self->set_transfer_size( exists( $opt->{transfer_size} ) ? $opt->{transfer_size} : $DEFAULT_VALUE{transfer_size} );

    # transfer_time_out, SINGLE, with default value
    $self->set_transfer_time_out( exists( $opt->{transfer_time_out} ) ? $opt->{transfer_time_out} : $DEFAULT_VALUE{transfer_time_out} );

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

sub diff {
    my $from = shift;
    my $to = shift;
    my $diff_number = shift;
    $diff_number = $from->is_diff_number() if ( ! defined( $diff_number ) );

    # Reference types must be identical
    if ( ref($from) ne ref($to) ) {
        my $rf = ref($from);
        my $rt = ref($to);

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::diff, FROM ($rf) and TO ($rt) reference types differ.");
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

    # Diff the initially open state
    if ( $from->is_initially_open() != $to->is_initially_open() ) {
        my $ref = ref($from);
        my $vf = $from->is_initially_open();
        my $vt = $to->is_initially_open();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: initially open difference: $vf <-> $vt\n";
    }

    # Diff the os
    $diff .= $from->get_os()->diff( $to->get_os() );

    # Diff the remote node name
    if ( $from->get_remote_node_name() ne $to->get_remote_node_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_remote_node_name();
        my $vt = $to->get_remote_node_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: remote node name difference: $vf <-> $vt\n";
    }

    # Diff the transfer size
    if ( $from->get_transfer_size() ne $to->get_transfer_size() ) {
        my $ref = ref($from);
        my $vf = $from->get_transfer_size();
        my $vt = $to->get_transfer_size();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: transfer size difference: $vf <-> $vt\n";
    }

    # Diff the transfer time out
    if ( $from->get_transfer_time_out() ne $to->get_transfer_time_out() ) {
        my $ref = ref($from);
        my $vf = $from->get_transfer_time_out();
        my $vt = $to->get_transfer_time_out();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: transfer time out difference: $vf <-> $vt\n";
    }

    # Return diff
    return($diff);
}

sub get_block_delay {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{block_delay} );
}

sub get_os {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{os} );
}

sub get_remote_node_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{remote_node_name} );
}

sub get_transfer_size {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{transfer_size} );
}

sub get_transfer_time_out {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{transfer_time_out} );
}

sub is_initially_open {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{initially_open} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_block_delay {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'block_delay', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::set_block_delay, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{block_delay} = $val;
}

sub set_initially_open {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{initially_open} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{initially_open} = 0;
    }
}

sub set_os {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'os', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::set_os, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{os} = $val;
}

sub set_remote_node_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_node_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::set_remote_node_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{remote_node_name} = $val;
}

sub set_transfer_size {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'transfer_size', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::set_transfer_size, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{transfer_size} = $val;
}

sub set_transfer_time_out {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'transfer_time_out', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::8::set_transfer_time_out, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_8}{transfer_time_out} = $val;
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::System::8;
    my $s = HH::Unispool::Config::File::Token::Numbered::System::8->new( {
        number => $self->get_number(),
        remote_system_name => $self->get_name(),
        block_delay => $self->get_block_delay(),
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
        os => $self->get_os(),
        transfer_size => $self->get_transfer_size(),
        transfer_time_out => $self->get_transfer_time_out(),
        device_token => 0,
    } );

    # Print the tokens
    $fh->print( $s->write_string() );
    $fh->print( $i->write_string() );
    $fh->print( $n->write_string() );
}

