package HH::Unispool::Config::Entry::Device::1;

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
    'buffer_size' => [ '^\d+$' ],
    'device_password' => [ '^.*$' ],
    'header_name' => [ '^.*$' ],
    'page_length' => [ '^\d+$' ],
    'page_width' => [ '^\d+$' ],
    'profile_name' => [ '^.*$' ],
    'trailer_name' => [ '^.*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    'buffer_size' => 2048,
    'execution_priority' => HH::Unispool::Config::ExecPri->new( { execution_priority => '' } ),
    'networkwide' => 1,
    'page_length' => 66,
    'page_width' => 132,
    'save_printfile' => 0,
    'unispool_header' => 0,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::Device::1 - UNISPOOL type 1 device

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::Device::1;
 
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
 
 # Add a type 1 device to _Local_
 my $dev = HH::Unispool::Config::Entry::Device::1->new( {
     name => 'lp',
     filter_name => 'cat',
 } );
 $sysn->add_device($dev);
 
 # Write the configuration
 $conf->write('t/config.sample.d1.out');

=head1 ABSTRACT

UNISPOOL type 1 device

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::Device::1> holds information for UNISPOOL type 1 device

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::Device::1> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<buffer_size>>

Passed to L<set_buffer_size()>. Defaults to B<2048>.

=item B<C<device_password>>

Passed to L<set_device_password()>.

=item B<C<execution_priority>>

Passed to L<set_execution_priority()>. Defaults to B<HH::Unispool::Config::ExecPri-E<gt>new( { execution_priority => '' } )>.

=item B<C<header_name>>

Passed to L<set_header_name()>.

=item B<C<networkwide>>

Passed to L<set_networkwide()>. Defaults to B<1>.

=item B<C<page_length>>

Passed to L<set_page_length()>. Defaults to B<66>.

=item B<C<page_width>>

Passed to L<set_page_width()>. Defaults to B<132>.

=item B<C<profile_name>>

Passed to L<set_profile_name()>.

=item B<C<save_printfile>>

Passed to L<set_save_printfile()>. Defaults to B<0>.

=item B<C<trailer_name>>

Passed to L<set_trailer_name()>.

=item B<C<unispool_header>>

Passed to L<set_unispool_header()>. Defaults to B<0>.

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

=item set_buffer_size(VALUE)

Set the number of bytes sent to the printer in one write operation. C<VALUE> is the value. Default value at initialization is C<2048>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_buffer_size()

Returns the number of bytes sent to the printer in one write operation.

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

=item set_networkwide(VALUE)

State that the device must be made available from each node in the configuration cluster. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item is_networkwide()

Returns whether the device must be made available from each node in the configuration cluster or not.

=item set_page_length(VALUE)

Set the page length (lines) for determining the size of UNISPOOL banners. C<VALUE> is the value. Default value at initialization is C<66>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_page_length()

Returns the page length (lines) for determining the size of UNISPOOL banners.

=item set_page_width(VALUE)

Set the page width (bytes) for determining the size of UNISPOOL banners. C<VALUE> is the value. Default value at initialization is C<132>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_page_width()

Returns the page width (bytes) for determining the size of UNISPOOL banners.

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

=item set_save_printfile(VALUE)

State that printfiles printed on this device should be saved. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_save_printfile()

Returns whether printfiles printed on this device should be saved or not.

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

=item set_unispool_header(VALUE)

State that standard UNISPOOL banners pages are printed initially. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_unispool_header()

Returns whether standard UNISPOOL banners pages are printed initially or not.

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::_initialize, first argument must be 'HASH' reference.");

    # buffer_size, SINGLE, with default value
    $self->set_buffer_size( exists( $opt->{buffer_size} ) ? $opt->{buffer_size} : $DEFAULT_VALUE{buffer_size} );

    # device_password, SINGLE
    exists( $opt->{device_password} ) && $self->set_device_password( $opt->{device_password} );

    # execution_priority, SINGLE, with default value
    $self->set_execution_priority( exists( $opt->{execution_priority} ) ? $opt->{execution_priority} : $DEFAULT_VALUE{execution_priority} );

    # header_name, SINGLE
    exists( $opt->{header_name} ) && $self->set_header_name( $opt->{header_name} );

    # networkwide, BOOLEAN, with default value
    $self->set_networkwide( exists( $opt->{networkwide} ) ? $opt->{networkwide} : $DEFAULT_VALUE{networkwide} );

    # page_length, SINGLE, with default value
    $self->set_page_length( exists( $opt->{page_length} ) ? $opt->{page_length} : $DEFAULT_VALUE{page_length} );

    # page_width, SINGLE, with default value
    $self->set_page_width( exists( $opt->{page_width} ) ? $opt->{page_width} : $DEFAULT_VALUE{page_width} );

    # profile_name, SINGLE
    exists( $opt->{profile_name} ) && $self->set_profile_name( $opt->{profile_name} );

    # save_printfile, BOOLEAN, with default value
    $self->set_save_printfile( exists( $opt->{save_printfile} ) ? $opt->{save_printfile} : $DEFAULT_VALUE{save_printfile} );

    # trailer_name, SINGLE
    exists( $opt->{trailer_name} ) && $self->set_trailer_name( $opt->{trailer_name} );

    # unispool_header, BOOLEAN, with default value
    $self->set_unispool_header( exists( $opt->{unispool_header} ) ? $opt->{unispool_header} : $DEFAULT_VALUE{unispool_header} );

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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to, $diff_number);

    # Diff the buffer size
    if ( $from->get_buffer_size() ne $to->get_buffer_size() ) {
        my $ref = ref($from);
        my $vf = $from->get_buffer_size();
        my $vt = $to->get_buffer_size();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: buffer size difference: $vf <-> $vt\n";
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

    # Diff the networkwide state
    if ( $from->is_networkwide() != $to->is_networkwide() ) {
        my $ref = ref($from);
        my $vf = $from->is_networkwide();
        my $vt = $to->is_networkwide();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: networkwide difference: $vf <-> $vt\n";
    }

    # Diff the page length
    if ( $from->get_page_length() ne $to->get_page_length() ) {
        my $ref = ref($from);
        my $vf = $from->get_page_length();
        my $vt = $to->get_page_length();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: page length difference: $vf <-> $vt\n";
    }

    # Diff the page width
    if ( $from->get_page_width() ne $to->get_page_width() ) {
        my $ref = ref($from);
        my $vf = $from->get_page_width();
        my $vt = $to->get_page_width();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: page width difference: $vf <-> $vt\n";
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

    # Diff the save printfile state
    if ( $from->is_save_printfile() != $to->is_save_printfile() ) {
        my $ref = ref($from);
        my $vf = $from->is_save_printfile();
        my $vt = $to->is_save_printfile();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: save printfile difference: $vf <-> $vt\n";
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

    # Diff the unispool header state
    if ( $from->is_unispool_header() != $to->is_unispool_header() ) {
        my $ref = ref($from);
        my $vf = $from->is_unispool_header();
        my $vt = $to->is_unispool_header();
        my $name = $from->get_name();
        my $number = $from->get_number();
        $diff .= "$ref/$name/$number: unispool header difference: $vf <-> $vt\n";
    }

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::Device::1
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::Device::1') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::Device::1'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number();
    $opt{name} = $s->get_device_name();
    $opt{device_password} = $s->get_device_password();
    $opt{buffer_size} = $s->get_buffer_size();
    $opt{page_width} = $s->get_page_width();
    $opt{page_length} = $s->get_page_length();
    $opt{unispool_header} = $s->is_unispool_header();
    $opt{networkwide} = $s->is_networkwide();
    $opt{save_printfile} = $s->is_save_printfile();
    $opt{execution_priority} = $s->get_execution_priority();

    # Allow X and I tokens
    my $x = undef;
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::X') ) {
            defined ($x) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::X'.");
            $x = $tok;
            $opt{profile_name} = $x->get_profile_name();
            $opt{header_name} = $x->get_header_name();
            $opt{trailer_name} = $x->get_trailer_name();
            $opt{filter_name} = $x->get_filter_name();
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::Device::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::Device::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description();
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::Device::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Device::1->new(\%opt) );
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::Device::1;
    my $d = HH::Unispool::Config::File::Token::Numbered::Device::1->new( {
        number => $self->get_number(),
        device_name => $self->get_name(),
        device_password => $self->get_device_password(),
        buffer_size => $self->get_buffer_size(),
        page_width => $self->get_page_width(),
        page_length => $self->get_page_length(),
        unispool_header => $self->is_unispool_header(),
        networkwide => $self->is_networkwide(),
        save_printfile => $self->is_save_printfile(),
        execution_priority => $self->get_execution_priority(),
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
    $fh->print( $x->write_string() );
}

sub set_buffer_size {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'buffer_size', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_buffer_size, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{buffer_size} = $val;
}

sub get_buffer_size {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{buffer_size} );
}

sub set_device_password {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'device_password', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_device_password, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{device_password} = $val;
}

sub get_device_password {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{device_password} );
}

sub set_execution_priority {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'execution_priority', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_execution_priority, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{execution_priority} = $val;
}

sub get_execution_priority {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{execution_priority} );
}

sub set_header_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'header_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_header_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{header_name} = $val;
}

sub get_header_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{header_name} );
}

sub set_networkwide {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_1}{networkwide} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_1}{networkwide} = 0;
    }
}

sub is_networkwide {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_1}{networkwide} ) {
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
    &_value_is_allowed( 'page_length', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_page_length, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{page_length} = $val;
}

sub get_page_length {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{page_length} );
}

sub set_page_width {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'page_width', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_page_width, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{page_width} = $val;
}

sub get_page_width {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{page_width} );
}

sub set_profile_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'profile_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_profile_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{profile_name} = $val;
}

sub get_profile_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{profile_name} );
}

sub set_save_printfile {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_1}{save_printfile} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_1}{save_printfile} = 0;
    }
}

sub is_save_printfile {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_1}{save_printfile} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_trailer_name {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'trailer_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Device::1::set_trailer_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Device_1}{trailer_name} = $val;
}

sub get_trailer_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Device_1}{trailer_name} );
}

sub set_unispool_header {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_Device_1}{unispool_header} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_Device_1}{unispool_header} = 0;
    }
}

sub is_unispool_header {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_Device_1}{unispool_header} ) {
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

