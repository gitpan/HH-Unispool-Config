package HH::Unispool::Config::File::Token::Factory;

use 5.006;
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx );

# Singleton variable
our $SINGLETON = undef;

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Factory - token factory class

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

token factory class

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Factory> contains factory method to make tokens out of strings.

=head1 CONSTRUCTOR

=over

=item new()

Creates a new C<HH::Unispool::Config::File::Token::Factory> object.

=back

=head1 METHODS

=over

=item create_token( LINE[, NR ] )

Creates a C<HH::Unispool::Config::File::Token> object out of the specified line. C<LINE> is a plain line string. C<NR> is an optional parameter containing the line number from where the line is read. On error an exception C<Error::Simple> is thrown.

=item instance( [ CONSTR_OPT ] )

Always returns the same C<HH::Unispool::Config::File::Token::Factory> -singleton- object instance. The first time it is called, parameters C<CONSTR_OPT> -if specified- are passed to the constructor.

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Factory::_initialize, first argument must be 'HASH' reference.");

    # Return $self
    return($self);
}

sub create_token {
    my $self = shift;
    my $line = shift;
    my $nr = shift;

    # Look for a matching regular expression
    if ( $line =~ $USP_BCS_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Bcs;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Bcs->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_DEV_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Device;
        my $tok = HH::Unispool::Config::File::Token::Comment::Device->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_GRP_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Group;
        my $tok = HH::Unispool::Config::File::Token::Comment::Group->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_MISC_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Misc;
        my $tok = HH::Unispool::Config::File::Token::Comment::Misc->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CFG_RSYS_RX ) {
        require HH::Unispool::Config::File::Token::Comment::RSys;
        my $tok = HH::Unispool::Config::File::Token::Comment::RSys->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CS_INFO_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Cs;
        my $tok = HH::Unispool::Config::File::Token::Comment::Cs->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_CS_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Cs;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Cs->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D0_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::0;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::0->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D1_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::1;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::1->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D2_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::2;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::2->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D3_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::3;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::3->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D4_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::4;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::4->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D5_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::5;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::5->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D6_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::6;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::6->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_D7_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::7;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::7->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_DATE_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Date;
        my $tok = HH::Unispool::Config::File::Token::Comment::Date->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_FILTER_INFO_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Filter;
        my $tok = HH::Unispool::Config::File::Token::Comment::Filter->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_FILTER_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Filter;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Filter->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_G_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::Group;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Group->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_H_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Host;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Host->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_HEAD_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Head;
        my $tok = HH::Unispool::Config::File::Token::Comment::Head->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_ID_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::Info;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::Info->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_IS_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::Info;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::Info->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_L_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::CSN;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::CSN->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_M_RX ) {
        require HH::Unispool::Config::File::Token::Unnumbered::Misc;
        my $tok = HH::Unispool::Config::File::Token::Unnumbered::Misc->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_N_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Network;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Network->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_PD_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::Device::P;
        my $tok = HH::Unispool::Config::File::Token::Numbered::Device::P->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S3_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::3;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::3->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S6_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::6;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::6->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S7_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::7;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::7->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_S8_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::System::8;
        my $tok = HH::Unispool::Config::File::Token::Numbered::System::8->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_SCOPE_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Scope;
        my $tok = HH::Unispool::Config::File::Token::Comment::Scope->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_TAIL_RX ) {
        require HH::Unispool::Config::File::Token::Comment::Tail;
        my $tok = HH::Unispool::Config::File::Token::Comment::Tail->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    elsif ( $line =~ $USP_X_RX ) {
        require HH::Unispool::Config::File::Token::Numbered::X;
        my $tok = HH::Unispool::Config::File::Token::Numbered::X->new_from_string($line);
        $tok->set_input_line_number($nr);
        return($tok);
    }
    else {
        chomp($line);
        my $nrmsg = ($nr) ? " read from line number '$nr'" : '';
        throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::factory::create_token, specified line '$line'$nrmsg does not match any token pattern.");
    }
}

sub instance {
    # Allow calls like:
    # - HH::Unispool::Config::File::Token::Factory::instance()
    # - HH::Unispool::Config::File::Token::Factory->instance()
    # - $variable->instance()
    if ( ref($_[0]) && &UNIVERSAL::isa( $_[0], 'HH::Unispool::Config::File::Token::Factory' ) ) {
        shift;
    }
    elsif ( ! ref($_[0]) && $_[0] eq 'HH::Unispool::Config::File::Token::Factory' ) {
        shift;
    }

    # If $SINGLETON is defined return it
    defined($SINGLETON) && return($SINGLETON);

    # Create the object and set $SINGLETON
    $SINGLETON = HH::Unispool::Config::File::Token::Factory->new();

    # Initialize the object separately as the initialization might
    # depend on $SINGLETON being set.
    $SINGLETON->_initialize(@_);

    # Return $SINGLETON
    return($SINGLETON);
}

