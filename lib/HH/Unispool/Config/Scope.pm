package HH::Unispool::Config::Scope;

use 5.006;
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
    'scope' => [ '^.+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _initialize
our %DEFAULT_VALUE = (
    'scope' => ['_Server_', '_Script_', '_Network_', 'System=*'],
);

# Unispool scope order
our %USP_SCOPE_ORDER = ();

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

# Unispool scope order
our @USP_SCOPE_ORDER = qw( _Server_ _Script_ _Network_ _Local_ );

{
    my $i = 0;
    foreach my $scope (@USP_SCOPE_ORDER) {
        $USP_SCOPE_ORDER{$scope} = $i;
        $i ++;
    }
}

1;

__END__

=head1 NAME

HH::Unispool::Config::Scope - UNISPOOL scope

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Scope;
 use HH::Unispool::Config::DateFormat;
 use HH::Unispool::Config::Entry::System;
 
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
     date_format => HH::Unispool::Config::DateFormat->new( {
         date_format => 'YY/MM/DD',
     } ),
 } );
 $conf->add_system($sysn);
 
 # Write the configuration
 $conf->write('t/config.sample.d0.out');

=head1 ABSTRACT

UNISPOOL scope

=head1 DESCRIPTION

C<HH::Unispool::Config::Scope> contains UNISPOOL scope information.

=head1 CONSTRUCTOR

=over

=item new( [ OPT_HASH_REF ] )

Creates a new C<HH::Unispool::Config::Scope> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<scope>>

Passed to L<set_scope()>. Must be an C<ARRAY> reference. Defaults to B<[> B<'_Server_'> , B<'_Script_'> , B<'_Network_'> , B<'System=*'> B<]>.

=back

=back

=head1 METHODS

=over

=item add_scope(ARRAY)

Add additional values on the dump scope in the comment. C<ARRAY> is the list value. The addition may not yield to multiple identical elements in the list. Hence, multiple occurrences of the same element cause the last occurrence to be inserted. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must match regular expression:

=over

=item ^.+$

=back

=back

=item delete_scope(ARRAY)

Delete elements from the dump scope in the comment. After deleting at least one element must remain. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item diff(TO)

Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.

=item exists_scope(ARRAY)

Returns the count of items in C<ARRAY> that are in the dump scope in the comment.

=item set_scope(ARRAY)

Set the dump scope in the comment absolutely. C<ARRAY> is the list value. Each element in the list is allowed to occur only once. Multiple occurrences of the same element yield in the last occurring element to be inserted and the rest to be ignored. Default value at initialization is C<'_Server_', '_Script_', '_Network_', 'System=*'>. C<ARRAY> must at least have one element. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must match regular expression:

=over

=item ^.+$

=back

=back

=item values_scope()

Returns an C<ARRAY> containing all values of the dump scope in the comment.

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
L<HH::Unispool::Config::OS>

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

sub new {
    my $class = shift;

    my $self = {};
    bless( $self, ( ref($class) || $class ) );
    return( $self->_initialize(@_) );
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Scope::_initialize, first argument must be 'HASH' reference.");

    # scope, MULTI, with default value
    if ( exists( $opt->{scope} ) ) {
        ref( $opt->{scope} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::Scope::_initialize, specified value for option 'scope' must be an 'ARRAY' reference.");
        $self->set_scope( @{ $opt->{scope} } );
    }
    else {
        $self->set_scope( @{ $DEFAULT_VALUE{scope} } );
    }

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

sub add_scope {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'scope', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Scope::add_scope, one or more specified value(s) '@_' is/are not allowed.");

    # Add values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Scope}{scope}{$val} = $val;
    }
}

sub delete_scope {
    my $self = shift;

    # List value for 'scope' is not allowed to be empty
    my %would_delete = ();
    foreach my $val (@_) {
        $would_delete{$val} = $val if ( exists( $self->{HH_Unispool_Config_Scope}{scope}{$val} ) );
    }
    ( scalar( keys( %{ $self->{HH_Unispool_Config_Scope}{scope} } ) ) == scalar( keys(%would_delete) ) ) && throw Error::Simple("ERROR: HH::Unispool::Config::Scope::delete_scope, list value may not be empty.");

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config_Scope}{scope}{$val} ) || next;
        delete( $self->{HH_Unispool_Config_Scope}{scope}{$val} );
        $del ++;
    }
    return($del);
}

sub diff {
    my $from = shift;
    my $to = shift;

    # Reference types must be identical
    if ( ref($from) ne ref($to) ) {
        my $rf = ref($from);
        my $rt = ref($to);

        throw Error::Simple("ERROR: HH::Unispool::Config::Scope::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = '';

    # Diff scope
    foreach my $vf ( $from->values_scope() ) {
        $to->exists_scope($vf) && next;
        my $ref = ref($from);
        $diff .= "$ref: scope item missing in TO: $vf\n";
    }
    foreach my $vt ( $to->values_scope() ) {
        $from->exists_scope($vt) && next;
        my $ref = ref($from);
        $diff .= "$ref: scope item missing in FROM: $vf\n";
    }

    # Return diff
    return($diff);
}

sub exists_scope {
    my $self = shift;

    # Count occurrences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config_Scope}{scope}{$val} );
    }
    return($count);
}

sub set_scope {
    my $self = shift;

    # List value for 'scope' is not allowed to be empty
    scalar(@_) || throw Error::Simple("ERROR: HH::Unispool::Config::Scope::set_scope, list value may not be empty.");

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'scope', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Scope::set_scope, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config_Scope}{scope} = {};

    # Add values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Scope}{scope}{$val} = $val;
    }
}

sub values_scope {
    my $self = shift;

    # Return all values in the correct order
    my @scope = ();
    foreach my $scope (@USP_SCOPE_ORDER) {
         $self->exists_scope($scope) && push( @scope, $scope );
    }
    foreach my $scope ( sort( values( %{ $self->{HH_Unispool_Config_Scope}{scope} } ) ) ) {
         exists($USP_SCOPE_ORDER{$scope}) || push( @scope, $scope );
    }
    return(@scope);
}

