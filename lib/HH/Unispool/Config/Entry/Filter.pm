package HH::Unispool::Config::Entry::Filter;

use 5.006;
use base qw( HH::Unispool::Config::Entry );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::FilterType;

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'type' => [ 'HH::Unispool::Config::FilterType' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'file' => [ '^.+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _initialize
our %DEFAULT_VALUE = (
    'type' => HH::Unispool::Config::FilterType->new( { type => 'default'} ),
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::Filter - UNISPOOL filter information

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::FilterType;
 use HH::Unispool::Config::Entry::Filter;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::RemoteSystem::8;
 
 # Create a config from scratch
 my $conf3 = HH::Unispool::Config->new();
 
 # Create a filter and add it to the configuration
 my $flt = HH::Unispool::Config::Entry::Filter->new( {
     name => 'cat',
     file => '/usr/bin/cat',
 } );
 $conf3->add_filter($flt);
 
 # Create another filter and add it to the configuration
 $flt = HH::Unispool::Config::Entry::Filter->new( {
     name => 'lpcat',
     file => '/my/bin/dir/lpcat',
     type => HH::Unispool::Config::FilterType->new( {
         type => 'lp',
     } ),
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
 
 # Create the foo.bar.org system and add it to the configuration
 my $sysf = HH::Unispool::Config::Entry::System->new( {
     name => 'foo.bar.org',
     local_system_name => 'foo',
     network_name => 'foo.bar.org',
     os => HH::Unispool::Config::OS->new( { os => 'Solaris' } ),
     type => 'cs',
 } );
 $conf3->add_system($sysf);
 
 # Write the configuration
 $conf3->write('t/config.sample.flt.out');

=head1 ABSTRACT

UNISPOOL filter information

=head1 DESCRIPTION

C<HH::Unispool::Config::Entry::Filter> holds information for UNISPOOL filter definitions.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::Filter> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<file>>

Passed to L<set_file()>. Mandatory option.

=item B<C<type>>

Passed to L<set_type()>. Defaults to B<HH::Unispool::Config::FilterType-E<gt>new( { type => 'default'} )>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry>> may include:

=over

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=back

=item new_from_tokenizer(TOKENIZER)

This method is an implementation from package C<HH::Unispool::Config::Entry>. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO)

This method is overloaded from package C<HH::Unispool::Config::Entry>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.

=item get_file()

Returns the file name for the filter.

=item get_name()

This method is inherited from package C<HH::Unispool::Config::Entry>. Returns the entry name.

=item get_type()

Returns the type of the filter.

=item set_file(VALUE)

Set the file name for the filter. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

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

=item set_type(VALUE)

Set the type of the filter. C<VALUE> is the value. Default value at initialization is C<HH::Unispool::Config::FilterType-E<gt>new( { type => 'default'} )>. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::FilterType

=back

=back

=item write(FILE_HANDLE)

This method is an implementation from package C<HH::Unispool::Config::Entry>. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

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

    # First token must be a
    # HH::Unispool::Config::File::Token::Unnumbered::Filter
    my $f = $tokenizer->get();
    &UNIVERSAL::isa($f,
            'HH::Unispool::Config::File::Token::Unnumbered::Filter') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::Filte'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{file} = $f->get_file();
    $opt{name} = $f->get_name();
    $opt{type} = $f->get_type();

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::Filter->new(\%opt) );
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::_initialize, first argument must be 'HASH' reference.");

    # file, SINGLE, mandatory
    exists( $opt->{file} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::_initialize, option 'file' is mandatory.");
    $self->set_file( $opt->{file} );

    # type, SINGLE, with default value
    $self->set_type( exists( $opt->{type} ) ? $opt->{type} : $DEFAULT_VALUE{type} );

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

    # Reference types must be identical
    if ( ref($from) ne ref($to) ) {
        my $rf = ref($from);
        my $rt = ref($to);

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to);

    # Diff the file
    if ( $from->get_file() ne $to->get_file() ) {
        my $ref = ref($from);
        my $vf = $from->get_file();
        my $vt = $to->get_file();
        my $name = $from->get_name();
        $diff .= "$ref/$name: file difference: $vf <-> $vt\n";
    }

    # Diff the type
    $diff .= $from->get_type()->diff( $to->get_type() );

    # Return diff
    return($diff);
}

sub get_file {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Filter}{file} );
}

sub get_type {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_Filter}{type} );
}

sub set_file {
    my $self = shift;
    my $val = shift;

    # Value for 'file' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::set_file, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'file', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::set_file, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Filter}{file} = $val;
}

sub set_type {
    my $self = shift;
    my $val = shift;

    # Value for 'type' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::set_type, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'type', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::Filter::set_type, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_Filter}{type} = $val;
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the four token
    require HH::Unispool::Config::File::Token::Unnumbered::Filter;
    my $f = HH::Unispool::Config::File::Token::Unnumbered::Filter->new( {
        file => $self->get_file(),
        name => $self->get_name(),
        type => $self->get_type(),
    } );

    # Print the tokens
    $fh->print( $f->write_string() );
}

