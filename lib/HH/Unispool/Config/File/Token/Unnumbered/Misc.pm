package HH::Unispool::Config::File::Token::Unnumbered::Misc;

use 5.006;
use base qw( HH::Unispool::Config::File::Token::Unnumbered );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::File::Token qw( :rx :frm );

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'date_format' => [ 'HH::Unispool::Config::DateFormat' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'default_printer' => [ '^.+$' ],
    'local_system_name' => [ '^.+$' ],
    'maximum_delay_time' => [ '^\d+$' ],
    'maximum_print_file_space' => [ '^\d+$' ],
    'maximum_save_file_space' => [ '^\d+$' ],
    'save_groups' => [ '^\d*$' ],
    'save_time_in_days' => [ '^\d+$' ],
    'start_time_clean_job_hour' => [ '^\d+$' ],
    'start_time_clean_job_minute' => [ '^\d+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _initialize
our %DEFAULT_VALUE = (
    'clean_on_weekdays_only' => 0,
    'maximum_delay_time' => 15,
    'maximum_print_file_space' => 0,
    'maximum_save_file_space' => 0,
    'save_groups' => '',
    'save_time_in_days' => 3,
    'start_time_clean_job_hour' => 0,
    'start_time_clean_job_minute' => 0,
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::File::Token::Unnumbered::Misc - class for miscellaneous I<M> tokens

=head1 SYNOPSIS

Application programmers don't need to use this class and API programmers read code.

=head1 ABSTRACT

class for miscellaneous I<M> tokens

=head1 DESCRIPTION

C<HH::Unispool::Config::File::Token::Unnumbered::Misc> is a class for miscellaneous I<M> tokens.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::File::Token::Unnumbered::Misc> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<clean_on_weekdays_only>>

Passed to L<set_clean_on_weekdays_only()>. Defaults to B<0>.

=item B<C<date_format>>

Passed to L<set_date_format()>.

=item B<C<default_printer>>

Passed to L<set_default_printer()>.

=item B<C<local_system_name>>

Passed to L<set_local_system_name()>. Mandatory option.

=item B<C<maximum_delay_time>>

Passed to L<set_maximum_delay_time()>. Defaults to B<15>.

=item B<C<maximum_print_file_space>>

Passed to L<set_maximum_print_file_space()>. Defaults to B<0>.

=item B<C<maximum_save_file_space>>

Passed to L<set_maximum_save_file_space()>. Defaults to B<0>.

=item B<C<save_groups>>

Passed to L<set_save_groups()>. Defaults to B<''>.

=item B<C<save_time_in_days>>

Passed to L<set_save_time_in_days()>. Defaults to B<3>.

=item B<C<start_time_clean_job_hour>>

Passed to L<set_start_time_clean_job_hour()>. Defaults to B<0>.

=item B<C<start_time_clean_job_minute>>

Passed to L<set_start_time_clean_job_minute()>. Defaults to B<0>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::File::Token>> may include:

=over

=item B<C<input_line_number>>

Passed to L<set_input_line_number()>.

=back

=item new_from_string(LINE)

Creates a new object from the specified Unispool config file line string.

=back

=head1 METHODS

=over

=item get_date_format()

Returns the format in which UNISPOOL will show and accept date information.

=item get_default_printer()

Returns the printer to be used when no other one is specified.

=item get_input_line_number()

This method is inherited from package C<HH::Unispool::Config::File::Token>. Returns the line number from from which the token is read.

=item get_local_system_name()

Returns the name of the system UNISPOOL is running on.

=item get_maximum_delay_time()

Returns the number of seconds the UNISPOOL main process is allowed to sleep between consecutive scans for printfiles.

=item get_maximum_print_file_space()

Returns the maximum number of bytes available to store UNISPOOL printfiles.

=item get_maximum_save_file_space()

Returns the maximum number of bytes available to store saved printfiles.

=item get_save_groups()

Returns the number of savegroups (not found in UNISPOOL C<config -screen>).

=item get_save_time_in_days()

Returns the number of days saved printfiles will be kept on disk before they are automatically removed.

=item get_start_time_clean_job_hour()

Returns the hour part of the time that the clean job must be started on a 24-hour clock.

=item get_start_time_clean_job_minute()

Returns the minute part of the time that the clean job must be started on a 24-hour clock.

=item is_clean_on_weekdays_only()

Returns whether saved printfiles are deleted on weekdays only or not.

=item read_string(LINE)

This method is overloaded from package C<HH::Unispool::Config::File::Token::Unnumbered>. Reads the Unispool config file token from a line string. C<LINE> is a plain line string. On error an exception C<Error::Simple> is thrown.

=item set_clean_on_weekdays_only(VALUE)

State that saved printfiles are deleted on weekdays only. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_date_format(VALUE)

Set the format in which UNISPOOL will show and accept date information. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::DateFormat

=back

=back

=item set_default_printer(VALUE)

Set the printer to be used when no other one is specified. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_input_line_number(VALUE)

This method is inherited from package C<HH::Unispool::Config::File::Token>. Set the line number from from which the token is read. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_local_system_name(VALUE)

Set the name of the system UNISPOOL is running on. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_maximum_delay_time(VALUE)

Set the number of seconds the UNISPOOL main process is allowed to sleep between consecutive scans for printfiles. C<VALUE> is the value. Default value at initialization is C<15>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item set_maximum_print_file_space(VALUE)

Set the maximum number of bytes available to store UNISPOOL printfiles. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item set_maximum_save_file_space(VALUE)

Set the maximum number of bytes available to store saved printfiles. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item set_save_groups(VALUE)

Set the number of savegroups (not found in UNISPOOL C<config -screen>). C<VALUE> is the value. Default value at initialization is C<''>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item set_save_time_in_days(VALUE)

Set the number of days saved printfiles will be kept on disk before they are automatically removed. C<VALUE> is the value. Default value at initialization is C<3>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item set_start_time_clean_job_hour(VALUE)

Set the hour part of the time that the clean job must be started on a 24-hour clock. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item set_start_time_clean_job_minute(VALUE)

Set the minute part of the time that the clean job must be started on a 24-hour clock. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item write_string()

This method is overloaded from package C<HH::Unispool::Config::File::Token::Unnumbered>. Returns a Unispool config file token line string.

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

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::_initialize, first argument must be 'HASH' reference.");

    # clean_on_weekdays_only, BOOLEAN, with default value
    $self->set_clean_on_weekdays_only( exists( $opt->{clean_on_weekdays_only} ) ? $opt->{clean_on_weekdays_only} : $DEFAULT_VALUE{clean_on_weekdays_only} );

    # date_format, SINGLE
    exists( $opt->{date_format} ) && $self->set_date_format( $opt->{date_format} );

    # default_printer, SINGLE
    exists( $opt->{default_printer} ) && $self->set_default_printer( $opt->{default_printer} );

    # local_system_name, SINGLE, mandatory
    exists( $opt->{local_system_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::_initialize, option 'local_system_name' is mandatory.");
    $self->set_local_system_name( $opt->{local_system_name} );

    # maximum_delay_time, SINGLE, with default value
    $self->set_maximum_delay_time( exists( $opt->{maximum_delay_time} ) ? $opt->{maximum_delay_time} : $DEFAULT_VALUE{maximum_delay_time} );

    # maximum_print_file_space, SINGLE, with default value
    $self->set_maximum_print_file_space( exists( $opt->{maximum_print_file_space} ) ? $opt->{maximum_print_file_space} : $DEFAULT_VALUE{maximum_print_file_space} );

    # maximum_save_file_space, SINGLE, with default value
    $self->set_maximum_save_file_space( exists( $opt->{maximum_save_file_space} ) ? $opt->{maximum_save_file_space} : $DEFAULT_VALUE{maximum_save_file_space} );

    # save_groups, SINGLE, with default value
    $self->set_save_groups( exists( $opt->{save_groups} ) ? $opt->{save_groups} : $DEFAULT_VALUE{save_groups} );

    # save_time_in_days, SINGLE, with default value
    $self->set_save_time_in_days( exists( $opt->{save_time_in_days} ) ? $opt->{save_time_in_days} : $DEFAULT_VALUE{save_time_in_days} );

    # start_time_clean_job_hour, SINGLE, with default value
    $self->set_start_time_clean_job_hour( exists( $opt->{start_time_clean_job_hour} ) ? $opt->{start_time_clean_job_hour} : $DEFAULT_VALUE{start_time_clean_job_hour} );

    # start_time_clean_job_minute, SINGLE, with default value
    $self->set_start_time_clean_job_minute( exists( $opt->{start_time_clean_job_minute} ) ? $opt->{start_time_clean_job_minute} : $DEFAULT_VALUE{start_time_clean_job_minute} );

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

sub get_date_format {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{date_format} );
}

sub get_default_printer {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{default_printer} );
}

sub get_local_system_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{local_system_name} );
}

sub get_maximum_delay_time {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{maximum_delay_time} );
}

sub get_maximum_print_file_space {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{maximum_print_file_space} );
}

sub get_maximum_save_file_space {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{maximum_save_file_space} );
}

sub get_save_groups {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{save_groups} );
}

sub get_save_time_in_days {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{save_time_in_days} );
}

sub get_start_time_clean_job_hour {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{start_time_clean_job_hour} );
}

sub get_start_time_clean_job_minute {
    my $self = shift;

    return( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{start_time_clean_job_minute} );
}

sub is_clean_on_weekdays_only {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{clean_on_weekdays_only} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub read_string {
    my $self = shift;
    my $line = shift;

    # Parse line for name
    my ($name, $tail) = $line =~ /$USP_M_RX/;
    defined($name) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::read_string, parameter 'LINE' does not match the regular expression for this token's line string.");

    # Parse line for other entries
    my @tail = $self->_split_tail($tail);
    ( scalar(@tail) > 8 ) && throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::read_string, parameter 'LINE' contains too many ';' separated entries after the local system name '$name'.");
    my $mdt = shift(@tail);
    my $st_str = shift(@tail);
    my ($stid, $cowo) = split(/\//, $st_str);
    $cowo = ( lc($cowo) eq 'w' ) if ( defined($cowo) );
    my $sg = shift(@tail);
    my $df = shift(@tail);
    my $stcj_str = shift(@tail);
    my ( $stcj_h, $stcj_m ) = split( /:/, $stcj_str);
    my $mpfs = shift(@tail);
    my $msfs = shift(@tail);
    my $dp = shift(@tail);

    # Set attributes
    $self->set_local_system_name($name);
    defined($mdt) && $self->set_maximum_delay_time($mdt);
    defined($stid) && $self->set_save_time_in_days($stid);
    defined($cowo) && $self->set_clean_on_weekdays_only($cowo);
    defined($sg) && $self->set_save_groups($sg);
    if ($df) {
        require HH::Unispool::Config::DateFormat;
        $self->set_date_format( HH::Unispool::Config::DateFormat->new( { date_format => $df } ) );
    }
    defined($stcj_h) && $self->set_start_time_clean_job_hour($stcj_h);
    defined($stcj_m) && $self->set_start_time_clean_job_minute($stcj_m);
    defined($mpfs) && $self->set_maximum_print_file_space($mpfs);
    defined($msfs) && $self->set_maximum_save_file_space($msfs);
    defined($dp) && $self->set_default_printer($dp);
}

sub set_clean_on_weekdays_only {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{clean_on_weekdays_only} = 1;
    }
    else {
        $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{clean_on_weekdays_only} = 0;
    }
}

sub set_date_format {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'date_format', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_date_format, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{date_format} = $val;
}

sub set_default_printer {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'default_printer', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_default_printer, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{default_printer} = $val;
}

sub set_local_system_name {
    my $self = shift;
    my $val = shift;

    # Value for 'local_system_name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_local_system_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'local_system_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_local_system_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{local_system_name} = $val;
}

sub set_maximum_delay_time {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'maximum_delay_time', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_maximum_delay_time, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{maximum_delay_time} = $val;
}

sub set_maximum_print_file_space {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'maximum_print_file_space', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_maximum_print_file_space, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{maximum_print_file_space} = $val;
}

sub set_maximum_save_file_space {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'maximum_save_file_space', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_maximum_save_file_space, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{maximum_save_file_space} = $val;
}

sub set_save_groups {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'save_groups', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_save_groups, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{save_groups} = $val;
}

sub set_save_time_in_days {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'save_time_in_days', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_save_time_in_days, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{save_time_in_days} = $val;
}

sub set_start_time_clean_job_hour {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'start_time_clean_job_hour', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_start_time_clean_job_hour, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{start_time_clean_job_hour} = $val;
}

sub set_start_time_clean_job_minute {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'start_time_clean_job_minute', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::File::Token::Unnumbered::Misc::set_start_time_clean_job_minute, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_File_Token_Unnumbered_Misc}{start_time_clean_job_minute} = $val;
}

sub write_string {
    my $self = shift;

    # Make string and return it
    my $wc = $self->is_clean_on_weekdays_only() ? 'W' : 'C';
    return(
        sprintf(
            $USP_M_FRM,
            $self->get_local_system_name() || '',
            $self->get_maximum_delay_time() || 0,
            $self->get_save_time_in_days() . "/$wc",
            $self->get_save_groups() || '',
            $self->get_date_format()->get_date_format() || '',
            sprintf("%d:%02d",
                $self->get_start_time_clean_job_hour() || 0,
                $self->get_start_time_clean_job_minute() || 0,
            ),
            $self->get_maximum_print_file_space() || 0,
            $self->get_maximum_save_file_space() || 0,
            $self->get_default_printer() || '',
        )
    );
}

