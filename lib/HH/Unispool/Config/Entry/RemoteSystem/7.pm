package HH::Unispool::Config::Entry::RemoteSystem::7;

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
    'block_delay' => [ '^\d*$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    'block_delay' => 0,
    'initially_open' => 1,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::RemoteSystem::7 - UNISPOOL type 7 remote system

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::RemoteSystem::7;
 
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
 
 # Add a type 7 remote system to _Local_
 my $dev = HH::Unispool::Config::Entry::RemoteSystem::7->new( {
     name => 'rsys7',
 } );
 $sysn->add_remote_system($dev);
 
 # Write the configuration
 $conf->write('t/config.sample.r7.out');

=head1 ABSTRACT

UNISPOOL type 7 remote system

=head1 DESCRIPTION

Class C<HH::Unispool::Config::Entry::RemoteSystem::7> holds information for UNISPOOL type 7 remote systems

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::RemoteSystem::7> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<block_delay>>

Passed to L<set_block_delay()>. Defaults to B<0>.

=item B<C<initially_open>>

Passed to L<set_initially_open()>. Defaults to B<1>.

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

=item set_block_delay(VALUE)

Set the time in seconds UNISPOOL should pause between sending two blocks. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_block_delay()

Returns the time in seconds UNISPOOL should pause between sending two blocks.

=item set_initially_open(VALUE)

State that the communication link should be opened at the moment UNISPOOL is started. C<VALUE> is the value. Default value at initialization is C<1>. On error an exception C<Error::Simple> is thrown.

=item is_initially_open()

Returns whether the communication link should be opened at the moment UNISPOOL is started or not.

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
L<HH::Unispool::Config::Entry::RemoteSystem::3>,
L<HH::Unispool::Config::Entry::RemoteSystem::6>,
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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::7::_initialize, first argument must be 'HASH' reference.");

    # block_delay, SINGLE, with default value
    $self->set_block_delay( exists( $opt->{block_delay} ) ? $opt->{block_delay} : $DEFAULT_VALUE{block_delay} );

    # initially_open, BOOLEAN, with default value
    $self->set_initially_open( exists( $opt->{initially_open} ) ? $opt->{initially_open} : $DEFAULT_VALUE{initially_open} );

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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::7::diff, FROM ($rf) and TO ($rt) reference types differ.");
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

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Numbered::System::7
    my $s = $tokenizer->get();
    $s->isa('HH::Unispool::Config::File::Token::Numbered::System::7') || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::7::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Numbered::System::7'.");

    # Fill the initialization option hash
    my %opt = ();
    $opt{number} = $s->get_number() if ( $s->get_number() );
    $opt{name} = $s->get_remote_system_name() if ( $s->get_remote_system_name() );
    $opt{block_delay} = $s->get_block_delay() if ( $s->get_block_delay() );
    $opt{initially_open} = $s->is_initially_open() if ( $s->is_initially_open() );
    $opt{execution_priority} = $s->get_execution_priority() if ( $s->get_execution_priority() );

    # Allow an I and N token
    my $i = undef;
    while ( my $tok = $tokenizer->get() ) {
        if ( ! $tok->isa('HH::Unispool::Config::File::Token::Numbered') || $tok->get_number() != $s->get_number() ) {
            $tokenizer->unget();
            last;
        }
        elsif ( $tok->isa('HH::Unispool::Config::File::Token::Numbered::System::Info') ) {
            defined ($i) && throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::7::new_from_tokenizer, multiple tokens obtained from 'TOKENIZER' for entry $opt{name}/$opt{number} from class 'HH::Unispool::Config::File::Token::Numbered::System::Info'.");
            $i = $tok;
            $opt{description} = $i->get_description() if ( $i->get_description() );
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::7::new_from_tokenizer, expected tokens from 'TOKENIZER' for entry $opt{name}/$opt{number} from either class 'HH::Unispool::Config::File::Token::Numbered::System::Info' or 'HH::Unispool::Config::File::Token::Numbered::Network'.");
        }
    }

    # Construct a new object and return it
    return( HH::Unispool::Config::Entry::RemoteSystem::7->new(\%opt) );
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make the three tokens
    require HH::Unispool::Config::File::Token::Numbered::System::7;
    my $s = HH::Unispool::Config::File::Token::Numbered::System::7->new( {
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

    # Print the tokens
    $fh->print( $s->write_string() );
    $fh->print( $i->write_string() );
}

sub set_block_delay {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'block_delay', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::RemoteSystem::7::set_block_delay, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_RemoteSystem_7}{block_delay} = $val;
}

sub get_block_delay {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_RemoteSystem_7}{block_delay} );
}

sub set_initially_open {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_7}{initially_open} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_RemoteSystem_7}{initially_open} = 0;
    }
}

sub is_initially_open {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_RemoteSystem_7}{initially_open} ) {
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

