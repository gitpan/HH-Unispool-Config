package HH::Unispool::Config::Entry::Device::3;

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
    'member_device_name' => [ '^\w+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    'execution_priority' => HH::Unispool::Config::ExecPri->new( { execution_priority => '' } ),
    'initially_spooled' => 1,
    'networkwide' => 1,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::Device::3 - UNISPOOL type 3 device

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::Device::3;
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
     name => 'lp1',
     filter_name => 'cat',
     remote_node_name => 'lp1.foo.bar.org',
     description => 'lp1',
 } );
 $sysn->add_device($dev);
 
 # Add another type 6 device to _Local_
 $dev = HH::Unispool::Config::Entry::Device::6->new( {
     name => 'lp2',
     filter_name => 'cat',
     remote_node_name => 'lp2.foo.bar.org',
     description => 'lp2',
 } );
 $sysn->add_device($dev);
 
 # Add a type 3 device to _Local_
 $dev = HH::Unispool::Config::Entry::Device::3->new( {
     name => 'lp',
     filter_name => 'cat',
     member_device_name => [ qw( lp1 lp2 ) ],
     description => 'lp',
 } );
 $sysn->add_device($dev);
 
 # Write the configuration
 $conf->write('t/config.sample.d3.out');

=head1 ABSTRACT

UNISPOOL type 3 device

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::Device::3> holds information for UNISPOOL type 3 device

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::Device::3> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<execution_priority>>

Passed to L<set_execution_priority()>. Defaults to B<HH::Unispool::Config::ExecPri-E<gt>new( { execution_priority => '' } )>.

=item B<C<initially_spooled>>

Passed to L<set_initially_spooled()>. Defaults to B<1>.

=item B<C<member_device_name>>

Passed to L<set_member_device_name()>. Must be an C<ARRAY> reference.

=item B<C<networkwide>>

Passed to L<set_networkwide()>. Defaults to B<1>.

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

=item add_members_from_tokenizer(TOKENIZER)

Adds group members to using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=item diff(TO [, DIFF_NUMBER])

This method is an implementation from package C<'HH::Unispool::Config::Entry::Device'>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item write(FILE_HANDLE)

This method is an implementation from package C<'HH::Unispool::Config::Entry::Device'>. Writes the entry to the specified file handle, omitting the group members (see L<write_group()>). C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item write_group(FILE_HANDLE)

Writes the group members of the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

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

=item set_initially_spooled(VALUE)

State that an automatic STARTSPOOL must be performed when UNISPOOL is started. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item is_initially_spooled()

Returns whether an automatic STARTSPOOL must be performed when UNISPOOL is started or not.

=item set_member_device_name(ARRAY)

Set the list of names of the devices that can be accessed through the group device absolutely. C<ARRAY> is the list value. Each element in the list is allowed to occur only once. Multiple occurences of the same element yield in the last occuring element to be inserted and the rest to be ignored. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must match regular expression:

=over

=item ^\w+$

=back

=back

=item add_member_device_name(ARRAY)

Add additional values on the list of names of the devices that can be accessed through the group device. C<ARRAY> is the list value. The addition may not yield to multiple identical elements in the list. Hence, multiple occurences of the same element cause the last occurence to be inserted. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must match regular expression:

=over

=item ^\w+$

=back

=back

=item delete_member_device_name(ARRAY)

Delete elements from the list of names of the devices that can be accessed through the group device. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item exists_member_device_name(ARRAY)

Returns the count of items in C<ARRAY> that are in the list of names of the devices that can be accessed through the group device.

=item values_member_device_name()

Returns an C<ARRAY> containing all values of the list of names of the devices that can be accessed through the group device.

=item set_networkwide(VALUE)

State that the device must be made available from each node in the configuration cluster. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item is_networkwide()

Returns whether the device must be made available from each node in the configuration cluster or not.

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::_initialize, first argument must be 'HASH' reference.");

    # execution_priority, SINGLE
    $self->set_execution_priority( exists( $opt->{execution_priority} ) ? $opt->{execution_priority} : $DEFAULT_VALUE{execution_priority} );

    # initially_spooled, BOOLEAN, with default value
    $self->set_initially_spooled( exists( $opt->{initially_spooled} ) ? $opt->{initially_spooled} : $DEFAULT_VALUE{initially_spooled} );

    # member_device_name, MULTI
    if ( exists( $opt->{member_device_name} ) ) {
        ref( $opt->{member_device_name} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::_initialize, specified value for option 'member_device_name' must be an 'ARRAY' reference.");
        $self->set_member_device_name( @{ $opt->{member_device_name} } );
    }
    else {
        $self->set_member_device_name();
    }

    # networkwide, BOOLEAN, with default value
    $self->set_networkwide( exists( $opt->{networkwide} ) ? $opt->{networkwide} : $DEFAULT_VALUE{networkwide} );

    # Call the superclass' _initialize
    $self->SUPER::_initialize($opt);

    # Return $self
    return($self);
}

sub add_members_from_tokenizer {
    my $self = shift;
    my $tokenizer = shift;

    # Allow G tokens
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::Group') ||
                $tok->get_number() != $self->get_number() ) {
            $tokenizer->unget();
            last;
        }

        # Add the members
        $self->add_member_device_name( $tok->values_member_device_name() );
    }
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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to, $diff_number);

    # Diff the execution priority
    $diff .= $from->get_execution_priority()->diff(
                                                $to->get_execution_priority() );

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

    # Diff member device name
    foreach my $vf ( $from->values_member_device_name() ) {
        $to->exists_member_device_name($vf) && next;
        my $ref = ref($from);
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: member device name missing in TO: $vf\n";
    }
    foreach my $vt ( $to->values_member_device_name() ) {
        $from->exists_member_device_name($vt) && next;
        my $ref = ref($from);
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: member device name missing in FROM: $vt\n";
    }

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::3
    my $d = $tokenizer->get();
    $d->isa('HH::Unispool::Config::File::Token::Numbered::Device::3') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::3'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $d->get_number();
    $opt{name} = $d->get_device_name();
    $opt{networkwide} = $d->is_networkwide();
    $opt{initially_spooled} = $d->is_initially_spooled();
    $opt{execution_priority} = $d->get_execution_priority();

    # Allow X and I tokens
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $d->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::3->new(\%opt) );
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::Device::3;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::3->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        networkwide => $self->is_networkwide(),
        initially_spooled => $self->is_initially_spooled(),
        execution_priority => $self->get_execution_priority(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::X;
    my $x = HH::Unispool::Config::File::Token::Numbered::X->new( {
        number => $self->get_number(),
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
    $fh->print( $x->write_string() );
}

sub write_group {
    my $self = shift;
    my $fh = shift;

    my @all_member = sort( $self->values_member_device_name() );
    while ( scalar(@all_member) ) {
        my @tok_member = ();

        for ( my $i = 0; $i < 4; $i ++ ) {
             my $member = shift(@all_member);
             defined ($member) || last;
             push(@tok_member, $member);
        }

        require HH::Unispool::Config::File::Token::Numbered::Device::Group;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Group->new( {
            number => $self->get_number(),
            member_device_name => [ @tok_member ],
        } );

        $fh->print( $tok->write_string() );
    }
}

sub set_execution_priority {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'execution_priority', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::set_execution_priority, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_3}{execution_priority} = $val;
}

sub get_execution_priority {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_3}{execution_priority} );
}

sub set_initially_spooled {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_3}{initially_spooled} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_3}{initially_spooled} = 0;
    }
}

sub is_initially_spooled {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_3}{initially_spooled} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_member_device_name {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'member_device_name', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::set_member_device_name, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name} = {};

    # Add values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name}{$val} = $val;
    }
}

sub add_member_device_name {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'member_device_name', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::3::add_member_device_name, one or more specified value(s) '@_' is/are not allowed.");

    # Add values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name}{$val} = $val;
    }
}

sub delete_member_device_name {
    my $self = shift;

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name}{$val} ) || next;
        delete( $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name}{$val} );
        $del ++;
    }
    return($del);
}

sub exists_member_device_name {
    my $self = shift;

    # Count occurences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name}{$val} );
    }
    return($count);
}

sub values_member_device_name {
    my $self = shift;

    # Return all values
    return( values( %{ $self->{HH_Unispool_Config_Entry_Device_3}{member_device_name} } ) );
}

sub set_networkwide {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_3}{networkwide} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_3}{networkwide} = 0;
    }
}

sub is_networkwide {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_3}{networkwide} ) {
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

