package HH::Unispool::Config::Entry::Device::5;

use 5.006;
use base qw( HH::Unispool::Config::Entry::Device );
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
    'header_name' => [ '^.*$' ],
    'remote_device_name' => [ '^.*$' ],
    'remote_system_name' => [ '^.*$' ],
    'trailer_name' => [ '^.*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::Device::5 - UNISPOOL type 5 device

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Entry::Filter;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::Device::5;
 use HH::Unispool::Config::Entry::Device::6;
 use HH::Unispool::Config::Entry::RemoteSystem::8;
 
 # Create a config from scratch
 my $conf3 = HH::Unispool::Config->new();
 
 # Create a filter and add it to the configuration
 my $flt = HH::Unispool::Config::Entry::Filter->new( {
     name => 'cat',
     file => '/usr/bin/cat',
 } );
 $conf3->add_filter($flt);
 
 # Create the _Network_ system and add it to the configuration
 my $sysn = HH::Unispool::Config::Entry::System->new( {
     name => '_Network_',
 } );
 $conf3->add_system($sysn);
 
 # Add a type 8 remote system to _Network_
 my $rsys = HH::Unispool::Config::Entry::RemoteSystem::8->new( {
     name => 'foo',
     os => HH::Unispool::Config::OS->new( { os => 'Solaris' } ),
     remote_node_name => 'foo.bar.org',
 } );
 $sysn->add_remote_system($rsys);
 
 # Add a type 5 device to _Network_
 my $dev = HH::Unispool::Config::Entry::Device::5->new( {
     name => 'lp',
     filter_name => 'cat',
     remote_device_name => 'lp',
     remote_system_name => 'foo',
     description => 'lp',
 } );
 $sysn->add_device($dev);
 
 # Create the foo.bar.org system and add it to the configuration
 my $sysf = HH::Unispool::Config::Entry::System->new( {
     name => 'foo.bar.org',
     local_system_name => 'foo',
     network_name => 'foo.bar.org',
     os => HH::Unispool::Config::OS->new( { os => 'Solaris' } ),
     type => 'cs',
 } );
 $conf3->add_system($sysf);
 
 # Add a type 6 device to foo.bar.org
 $dev = HH::Unispool::Config::Entry::Device::6->new( {
     name => 'lp1',
     filter_name => 'cat',
     remote_node_name => 'lp1.foo.bar.org',
     description => 'lp1',
 } );
 $sysf->add_device($dev);
 
 # Add another type 6 device to foo.bar.org
 $dev = HH::Unispool::Config::Entry::Device::6->new( {
     name => 'lp2',
     filter_name => 'cat',
     remote_node_name => 'lp2.foo.bar.org',
     description => 'lp2',
 } );
 $sysf->add_device($dev);
 
 # Add another type 3 device to foo.bar.org
 $dev = HH::Unispool::Config::Entry::Device::3->new( {
     name => 'lp',
     filter_name => 'cat',
     member_device_name => [ qw( lp1 lp2 ) ],
     description => 'lp',
 } );
 $sysf->add_device($dev);
 
 # Write the configuration
 $conf3->write('t/config.sample.d5.out');

=head1 ABSTRACT

UNISPOOL type 5 device

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::Device::5> holds information for UNISPOOL type 5 device

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::Device::5> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<header_name>>

Passed to L<set_header_name()>.

=item B<C<remote_device_name>>

Passed to L<set_remote_device_name()>. Mandatory option.

=item B<C<remote_system_name>>

Passed to L<set_remote_system_name()>. Mandatory option.

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

This method is an implementation from package C<HH::Unispool::Config::Entry::Device>. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO [, DIFF_NUMBER])

This method is an implementation from package C<HH::Unispool::Config::Entry::Device>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item get_description()

This method is inherited from package C<HH::Unispool::Config::Entry::Device>. Returns the description for the device.

=item get_filter_name()

This method is inherited from package C<HH::Unispool::Config::Entry::Device>. Returns the name of the filter file to be used when printfiles for this device are generated.

=item get_header_name()

Returns the control procedure to be executed before printing the printfile.

=item get_name()

This method is inherited from package C<HH::Unispool::Config::Entry>. Returns the entry name.

=item get_number()

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. Returns the entry number.

=item get_remote_device_name()

Returns the device on the remote system that will receive the output.

=item get_remote_system_name()

Returns the name of the system to which the output for this device must be routed.

=item get_trailer_name()

Returns the control procedure to be executed after printing the printfile.

=item is_diff_number()

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. Returns whether L<diff()> should consider the C<number> attribtutes or not.

=item set_description(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::Device>. Set the description for the device. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_diff_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::Numbered>. State that L<diff()> should consider the C<number> attribtutes. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_filter_name(VALUE)

This method is inherited from package C<HH::Unispool::Config::Entry::Device>. Set the name of the filter file to be used when printfiles for this device are generated. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_header_name(VALUE)

Set the control procedure to be executed before printing the printfile. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

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

=item set_remote_device_name(VALUE)

Set the device on the remote system that will receive the output. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_remote_system_name(VALUE)

Set the name of the system to which the output for this device must be routed. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item set_trailer_name(VALUE)

Set the control procedure to be executed after printing the printfile. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.*$

=back

=back

=item write(FILE_HANDLE)

This method is an implementation from package C<HH::Unispool::Config::Entry::Device>. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

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

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::5
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::Device::5') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::5'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number();
    $opt{name} = $s->get_device_name();
    $opt{remote_device_name} = $s->get_remote_device_name();
    $opt{remote_system_name} = $s->get_remote_system_name();

    # Allow X and I tokens
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{header_name} = $x->get_header_name();
            $opt{trailer_name} = $x->get_trailer_name();
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::5->new(\%opt) );
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::_initialize, first argument must be 'HASH' reference.");

    # header_name, SINGLE
    exists( $opt->{header_name} ) && $self->set_header_name( $opt->{header_name} );

    # remote_device_name, SINGLE, mandatory
    exists( $opt->{remote_device_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::_initialize, option 'remote_device_name' is mandatory.");
    $self->set_remote_device_name( $opt->{remote_device_name} );

    # remote_system_name, SINGLE, mandatory
    exists( $opt->{remote_system_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::_initialize, option 'remote_system_name' is mandatory.");
    $self->set_remote_system_name( $opt->{remote_system_name} );

    # trailer_name, SINGLE
    exists( $opt->{trailer_name} ) && $self->set_trailer_name( $opt->{trailer_name} );

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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to, $diff_number);

    # Diff the header name
    if ( $from->get_header_name() ne $to->get_header_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_header_name();
        my $vt = $to->get_header_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: header name difference: $vf <-> $vt\n";
    }

    # Diff the remote device name
    if ( $from->get_remote_device_name() ne $to->get_remote_device_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_remote_device_name();
        my $vt = $to->get_remote_device_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: remote device name difference: $vf <-> $vt\n";
    }

    # Diff the remote system name
    if ( $from->get_remote_system_name() ne $to->get_remote_system_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_remote_system_name();
        my $vt = $to->get_remote_system_name();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: remote system name difference: $vf <-> $vt\n";
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

sub get_header_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_5}{header_name} );
}

sub get_remote_device_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_5}{remote_device_name} );
}

sub get_remote_system_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_5}{remote_system_name} );
}

sub get_trailer_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_5}{trailer_name} );
}

sub set_header_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'header_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::set_header_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_5}{header_name} = $val;
}

sub set_remote_device_name {
    my $self = shift;
    my $val = shift;

    # Value for 'remote_device_name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::set_remote_device_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_device_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::set_remote_device_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_5}{remote_device_name} = $val;
}

sub set_remote_system_name {
    my $self = shift;
    my $val = shift;

    # Value for 'remote_system_name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::set_remote_system_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'remote_system_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::set_remote_system_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_5}{remote_system_name} = $val;
}

sub set_trailer_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'trailer_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::5::set_trailer_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_5}{trailer_name} = $val;
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::Device::5;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::5->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        remote_device_name => $self->get_remote_device_name(),
        remote_system_name => $self->get_remote_system_name(),
    } );

    require HH::Unispool::Config::File::Token::Numbered::X;
    my $x = HH::Unispool::Config::File::Token::Numbered::X->new( {
        number => $self->get_number(),
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
    $fh->print( $x->write_string() );
}

