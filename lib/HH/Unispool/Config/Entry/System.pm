package HH::Unispool::Config::Entry::System;

use 5.006;
use base qw( HH::Unispool::Config::Entry );
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::DateFormat;

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'date_format' => [ 'HH::Unispool::Config::DateFormat' ],
    'device' => [ 'HH::Unispool::Config::Entry::Device' ],
    'os' => [ 'HH::Unispool::Config::OS' ],
    'remote_system' => [ 'HH::Unispool::Config::Entry::RemoteSystem' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'central_console_node' => [ '^.+$' ],
    'default_printer' => [ '^.+$' ],
    'local_system_name' => [ '^.+$' ],
    'maximum_delay_time' => [ '^\d+$' ],
    'maximum_print_file_space' => [ '^\d+$' ],
    'maximum_save_file_space' => [ '^\d+$' ],
    'network_name' => [ '^.+$' ],
    'save_groups' => [ '^\d*$' ],
    'save_time_in_days' => [ '^\d+$' ],
    'start_time_clean_job_hour' => [ '^\d+$' ],
    'start_time_clean_job_minute' => [ '^\d+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
    'type' => {
        'bcs' => 1,
        'cc' => 1,
        'cs' => 1,
    },
);

# Used by _value_is_allowed
our %DEFAULT_VALUE = (
    'central_console_node' => 'SYSLOG',
    'clean_on_weekdays_only' => 0,
    # See _initialize for 'date_format' default value
    'default_printer' => 'lp',
    'diff_number' => 0,
    'maximum_delay_time' => 15,
    'maximum_print_file_space' => 0,
    'maximum_save_file_space' => 0,
    'save_groups' => '',
    'save_time_in_days' => 3,
    'start_time_clean_job_hour' => 0,
    'start_time_clean_job_minute' => 0,
);

# Package version
our ($VERSION) = '$Revision: 0.2 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config::Entry::System - Class to group remote systems and devices

=head1 SYNOPSIS

 use strict;
 
 use HH::Unispool::Config;
 use HH::Unispool::Config::OS;
 use HH::Unispool::Config::Entry::Filter;
 use HH::Unispool::Config::Entry::System;
 use HH::Unispool::Config::Entry::Device::5;
 use HH::Unispool::Config::Entry::Device::6;
 use HH::Unispool::Config::Entry::RemoteSystem::8;
 
 # Read and write config
 my $conf1 = HH::Unispool::Config->new_from_file('t/config.sample');
 $conf1->write('t/config.sample.1.out');
 
 # Read again, modify a little and diff config
 my $conf2 = HH::Unispool::Config->new_from_file('t/config.sample');
 $conf2->delete_system('foobar.bar.org');
 my $diff = $conf1->diff($conf2);
 if ($diff) {
     print STDERR "\nTHIS OUTPUT IS EXPECTED\n";
     print STDERR "DIFFERENCES\n";
     print STDERR  $diff;
     print STDERR "\nTHIS OUTPUT WAS EXPECTED\n";
 }
 
 
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
 $conf3->write('t/config.sample.3.out');

=head1 ABSTRACT

Class to group remote systems and devices

=head1 DESCRIPTION

C<HH::Unispool::Config::Entry::System> groups remote systems and devices from UNISPOOL configuration.
In different words, it groups from a configuration file anything between

 * Miscellaneous configuration items for [...]

line and the following

 * Miscellaneous configuration items for [...]

line or the following

 * End of configuration dumped on host ...

line.

=head1 CONSTRUCTOR

=over

=item new(OPT_HASH_REF)

Creates a new C<HH::Unispool::Config::Entry::System> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. C<OPT_HASH_REF> is mandatory. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<central_console_node>>

Passed to L<set_central_console_node()>. Defaults to B<'SYSLOG'>.

=item B<C<clean_on_weekdays_only>>

Passed to L<set_clean_on_weekdays_only()>. Defaults to B<0>.

=item B<C<date_format>>

Passed to L<set_date_format()>. Defaults to B<HH::Unispool::Config::DateFormat-E<gt>new( { date_format => 'DD/MM/YY' } )>.

=item B<C<default_printer>>

Passed to L<set_default_printer()>. Defaults to B<'lp'>.

=item B<C<device>>

Passed to L<set_device()>. Must be an C<ARRAY> reference.

=item B<C<diff_number>>

Passed to L<set_diff_number()>. Defaults to B<0>.

=item B<C<local_system_name>>

Passed to L<set_local_system_name()>. Mandatory option but not for the C<_Network_> system, in which case it is set to C<[Network]>.

=item B<C<maximum_delay_time>>

Passed to L<set_maximum_delay_time()>. Defaults to B<15>.

=item B<C<maximum_print_file_space>>

Passed to L<set_maximum_print_file_space()>. Defaults to B<0>.

=item B<C<maximum_save_file_space>>

Passed to L<set_maximum_save_file_space()>. Defaults to B<0>.

=item B<C<network_name>>

Passed to L<set_network_name()>. Mandatory option but not for the C<_Network_> system, in which case it is set to I<some bogus value>.

=item B<C<os>>

Passed to L<set_os()>. Mandatory option but not for the C<_Network_> system, in which case it is set to I<some bogus value>.

=item B<C<remote_system>>

Passed to L<set_remote_system()>. Must be an C<ARRAY> reference.

=item B<C<save_groups>>

Passed to L<set_save_groups()>. Defaults to B<''>.

=item B<C<save_time_in_days>>

Passed to L<set_save_time_in_days()>. Defaults to B<3>.

=item B<C<start_time_clean_job_hour>>

Passed to L<set_start_time_clean_job_hour()>. Defaults to B<0>.

=item B<C<start_time_clean_job_minute>>

Passed to L<set_start_time_clean_job_minute()>. Defaults to B<0>.

=item B<C<type>>

Passed to L<set_type()>.

=back

Options for C<OPT_HASH_REF> inherited through package B<C<HH::Unispool::Config::Entry>> may include:

=over

=item B<C<name>>

Passed to L<set_name()>. Mandatory option.

=back

=item new_from_tokenizer(TOKENIZER)

This method is an implementation from package C<'HH::Unispool::Config::Entry'>. Constructs a new C<HH::Unispool::Config::Entry> object using tokens. C<TOKENIZER> is an C<HH::Unispool::Config::File::Tokenizer> reference. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item diff(TO [, DIFF_NUMBER])

This method is overloaded from package C<'HH::Unispool::Config::Entry'>. Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown. Paremeter C<DIFF_NUMBER> if specified, overrules the value of C<get_diff_number>.

=item write(FILE_HANDLE)

This method is an implementation from package C<'HH::Unispool::Config::Entry'>. Writes the entry to the specified file handle. C<FILE_HANDLE> is an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item set_central_console_node(VALUE)

Set the name of the system on which the console messages must be displayed. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_central_console_node()

Returns the name of the system on which the console messages must be displayed.

=item set_clean_on_weekdays_only(VALUE)

State that saved printfiles are deleted on weekdays only. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_clean_on_weekdays_only()

Returns whether saved printfiles are deleted on weekdays only or not.

=item set_date_format(VALUE)

Set the format in which UNISPOOL will show and accept date information. C<VALUE> is the value. Default value at initialization is C<HH::Unispool::Config::DateFormat-E<gt>new( { date_format => 'DD/MM/YY' } )>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::DateFormat

=back

=back

=item get_date_format()

Returns the format in which UNISPOOL will show and accept date information.

=item set_default_printer(VALUE)

Set the printer to be used when no other one is specified. C<VALUE> is the value. Default value at initialization is C<'lp'>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_default_printer()

Returns the printer to be used when no other one is specified.

=item set_device( [ VALUE ... ] )

Set the list of devices for the system absolutely using values. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurences of the same key yield in the last occuring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::Device

=back

=back

=item add_device( [ VALUE ... ] )

Add additional values on the list of devices for the system. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurences of the same key yield in the last occuring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::Device

=back

=back

=item delete_device(ARRAY)

Delete elements from the list of devices for the system. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item exists_device(ARRAY)

Returns the count of items in C<ARRAY> that are in the list of devices for the system.

=item keys_device()

Returns an C<ARRAY> containing the keys of the list of devices for the system.

=item values_device( [ KEY_ARRAY ] )

Returns an C<ARRAY> containing the values of the list of devices for the system. If C<KEY_ARRAY> contains one or more C<KEY>s the values related to the C<KEY>s are returned. If no C<KEY>s specified all values are returned.

=item set_diff_number(VALUE)

State that L<diff()> should consider the C<number> attribtutes. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item is_diff_number()

Returns whether L<diff()> should consider the C<number> attribtutes or not.

=item set_local_system_name(VALUE)

Set the name of the system UNISPOOL is running on. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_local_system_name()

Returns the name of the system UNISPOOL is running on.

=item set_maximum_delay_time(VALUE)

Set the number of seconds the UNISPOOL main process is allowed to sleep between consecutive scans for printfiles. C<VALUE> is the value. Default value at initialization is C<15>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_maximum_delay_time()

Returns the number of seconds the UNISPOOL main process is allowed to sleep between consecutive scans for printfiles.

=item set_maximum_print_file_space(VALUE)

Set the maximum number of bytes available to store UNISPOOL printfiles. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_maximum_print_file_space()

Returns the maximum number of bytes available to store UNISPOOL printfiles.

=item set_maximum_save_file_space(VALUE)

Set the maximum number of bytes available to store saved printfiles. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_maximum_save_file_space()

Returns the maximum number of bytes available to store saved printfiles.

=item set_network_name(VALUE)

Set the network name of the system. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item get_network_name()

Returns the network name of the system.

=item set_os(VALUE)

Set the operating system running on this system. C<VALUE> is the value. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::OS

=back

=back

=item get_os()

Returns the operating system running on this system.

=item set_remote_system( [ VALUE ... ] )

Set the list of remote systems for the system absolutely using values. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurences of the same key yield in the last occuring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::RemoteSystem

=back

=back

=item add_remote_system( [ VALUE ... ] )

Add additional values on the list of remote systems for the system. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurences of the same key yield in the last occuring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::RemoteSystem

=back

=back

=item delete_remote_system(ARRAY)

Delete elements from the list of remote systems for the system. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item exists_remote_system(ARRAY)

Returns the count of items in C<ARRAY> that are in the list of remote systems for the system.

=item keys_remote_system()

Returns an C<ARRAY> containing the keys of the list of remote systems for the system.

=item values_remote_system( [ KEY_ARRAY ] )

Returns an C<ARRAY> containing the values of the list of remote systems for the system. If C<KEY_ARRAY> contains one or more C<KEY>s the values related to the C<KEY>s are returned. If no C<KEY>s specified all values are returned.

=item set_save_groups(VALUE)

Set the number of savegroups (not found in UNISPOOL C<config -screen>). C<VALUE> is the value. Default value at initialization is C<''>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d*$

=back

=back

=item get_save_groups()

Returns the number of savegroups (not found in UNISPOOL C<config -screen>).

=item set_save_time_in_days(VALUE)

Set the number of days saved printfiles will be kept on disk before they are automatically removed. C<VALUE> is the value. Default value at initialization is C<3>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_save_time_in_days()

Returns the number of days saved printfiles will be kept on disk before they are automatically removed.

=item set_start_time_clean_job_hour(VALUE)

Set the hour part of the time that the clean job must be started on a 24-hour clock. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_start_time_clean_job_hour()

Returns the hour part of the time that the clean job must be started on a 24-hour clock.

=item set_start_time_clean_job_minute(VALUE)

Set the minute part of the time that the clean job must be started on a 24-hour clock. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item get_start_time_clean_job_minute()

Returns the minute part of the time that the clean job must be started on a 24-hour clock.

=item set_type(VALUE)

Set the system type. C<VALUE> is the value. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a one of:

=over

=item bcs

=item cc

=item cs

=back

=back

=item get_type()

Returns the system type.

=back

=head1 INHERITED METHODS FROM HH::Unispool::Config::Entry

=over

=item To access attribute named B<C<name>>:

set_name(), get_name()

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
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::_initialize, first argument must be 'HASH' reference.");

    # Check/allow exceptional situations
    if ($opt->{name} eq '_Network_') {
        $opt->{network_name} = '[Network]';
        $opt->{local_system_name} = 'BOGUS';
        require HH::Unispool::Config::OS;
        $opt->{os} = HH::Unispool::Config::OS->new( { os => 'Solaris' } );
    }

    # central_console_node, SINGLE, with default value
    $self->set_central_console_node( exists( $opt->{central_console_node} ) ? $opt->{central_console_node} : $DEFAULT_VALUE{central_console_node} );

    # clean_on_weekdays_only, BOOLEAN, with default value
    $self->set_clean_on_weekdays_only( exists( $opt->{clean_on_weekdays_only} ) ? $opt->{clean_on_weekdays_only} : $DEFAULT_VALUE{clean_on_weekdays_only} );

    # date_format, SINGLE, with default value
    $self->set_date_format( exists( $opt->{date_format} ) ? $opt->{date_format} : HH::Unispool::Config::DateFormat->new( { date_format => 'DD/MM/YY' } ) );

    # default_printer, SINGLE, with default value
    $self->set_default_printer( exists( $opt->{default_printer} ) ? $opt->{default_printer} : $DEFAULT_VALUE{default_printer} );

    # device, MULTI
    if ( exists( $opt->{device} ) ) {
        ref( $opt->{device} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::_initialize, specified value for option 'device' must be an 'ARRAY' reference.");
        $self->set_device( @{ $opt->{device} } );
    }
    else {
        $self->set_device();
    }

    # diff_number, BOOLEAN, with default value
    $self->set_diff_number( exists( $opt->{diff_number} ) ? $opt->{diff_number} : $DEFAULT_VALUE{diff_number} );

    # local_system_name, SINGLE, mandatory
    exists( $opt->{local_system_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::_initialize, option 'local_system_name' is mandatory.");
    $self->set_local_system_name( $opt->{local_system_name} );

    # maximum_delay_time, SINGLE, with default value
    $self->set_maximum_delay_time( exists( $opt->{maximum_delay_time} ) ? $opt->{maximum_delay_time} : $DEFAULT_VALUE{maximum_delay_time} );

    # maximum_print_file_space, SINGLE, with default value
    $self->set_maximum_print_file_space( exists( $opt->{maximum_print_file_space} ) ? $opt->{maximum_print_file_space} : $DEFAULT_VALUE{maximum_print_file_space} );

    # maximum_save_file_space, SINGLE, with default value
    $self->set_maximum_save_file_space( exists( $opt->{maximum_save_file_space} ) ? $opt->{maximum_save_file_space} : $DEFAULT_VALUE{maximum_save_file_space} );

    # network_name, SINGLE, mandatory
    exists( $opt->{network_name} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::_initialize, option 'network_name' is mandatory.");
    $self->set_network_name( $opt->{network_name} );

    # os, SINGLE, mandatory
    exists( $opt->{os} ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::_initialize, option 'os' is mandatory.");
    $self->set_os( $opt->{os} );

    # remote_system, MULTI
    if ( exists( $opt->{remote_system} ) ) {
        ref( $opt->{remote_system} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::_initialize, specified value for option 'remote_system' must be an 'ARRAY' reference.");
        $self->set_remote_system( @{ $opt->{remote_system} } );
    }
    else {
        $self->set_remote_system();
    }

    # save_groups, SINGLE, with default value
    $self->set_save_groups( exists( $opt->{save_groups} ) ? $opt->{save_groups} : $DEFAULT_VALUE{save_groups} );

    # save_time_in_days, SINGLE, with default value
    $self->set_save_time_in_days( exists( $opt->{save_time_in_days} ) ? $opt->{save_time_in_days} : $DEFAULT_VALUE{save_time_in_days} );

    # start_time_clean_job_hour, SINGLE, with default value
    $self->set_start_time_clean_job_hour( exists( $opt->{start_time_clean_job_hour} ) ? $opt->{start_time_clean_job_hour} : $DEFAULT_VALUE{start_time_clean_job_hour} );

    # start_time_clean_job_minute, SINGLE, with default value
    $self->set_start_time_clean_job_minute( exists( $opt->{start_time_clean_job_minute} ) ? $opt->{start_time_clean_job_minute} : $DEFAULT_VALUE{start_time_clean_job_minute} );

    # type, SINGLE
    exists( $opt->{type} ) && $self->set_type( $opt->{type} );

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

        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = $from->SUPER::diff($to);

    # Diff the central console node
    if ( $from->get_central_console_node() ne $to->get_central_console_node() ) {
        my $ref = ref($from);
        my $vf = $from->get_central_console_node();
        my $vt = $to->get_central_console_node();
        my $name = $from->get_name();
        $diff .= "$ref/$name: central console node difference: $vf <-> $vt\n";
    }

    # Diff the clean on weekdays only state
    if ( $from->is_clean_on_weekdays_only() != $to->is_clean_on_weekdays_only() ) {
        my $ref = ref($from);
        my $vf = $from->is_clean_on_weekdays_only();
        my $vt = $to->is_clean_on_weekdays_only();
        my $name = $from->get_name();
        $diff .= "$ref/$name: clean on weekdays only difference: $vf <-> $vt\n";
    }

    # Diff the date format
    $diff .= $from->get_date_format()->diff( $to->get_date_format() );

    # Diff the default printer
    if ( $from->get_default_printer() ne $to->get_default_printer() ) {
        my $ref = ref($from);
        my $vf = $from->get_default_printer();
        my $vt = $to->get_default_printer();
        my $name = $from->get_name();
        $diff .= "$ref/$name: default printer difference: $vf <-> $vt\n";
    }

    # Diff the local system name
    if ( $from->get_local_system_name() ne $to->get_local_system_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_local_system_name();
        my $vt = $to->get_local_system_name();
        my $name = $from->get_name();
        $diff .= "$ref/$name: local system name difference: $vf <-> $vt\n";
    }

    # Diff the maximum delay time
    if ( $from->get_maximum_delay_time() ne $to->get_maximum_delay_time() ) {
        my $ref = ref($from);
        my $vf = $from->get_maximum_delay_time();
        my $vt = $to->get_maximum_delay_time();
        my $name = $from->get_name();
        $diff .= "$ref/$name: maximum delay time difference: $vf <-> $vt\n";
    }

    # Diff the maximum print file space
    if ( $from->get_maximum_print_file_space() ne $to->get_maximum_print_file_space() ) {
        my $ref = ref($from);
        my $vf = $from->get_maximum_print_file_space();
        my $vt = $to->get_maximum_print_file_space();
        my $name = $from->get_name();
        $diff .= "$ref/$name: maximum print file space difference: $vf <-> $vt\n";
    }

    # Diff the maximum save file space
    if ( $from->get_maximum_save_file_space() ne $to->get_maximum_save_file_space() ) {
        my $ref = ref($from);
        my $vf = $from->get_maximum_save_file_space();
        my $vt = $to->get_maximum_save_file_space();
        my $name = $from->get_name();
        $diff .= "$ref/$name: maximum save file space difference: $vf <-> $vt\n";
    }

    # Diff the network name
    if ( $from->get_network_name() ne $to->get_network_name() ) {
        my $ref = ref($from);
        my $vf = $from->get_network_name();
        my $vt = $to->get_network_name();
        my $name = $from->get_name();
        $diff .= "$ref/$name: network name difference: $vf <-> $vt\n";
    }

    # Diff the os
    if ( defined( $from->get_os() ) && defined( $to->get_os() ) ) {
        $diff .= $from->get_os()->diff( $to->get_os() );
    }
    elsif ( defined( $from->get_os() ) ) {
        my $ref = ref($from);
        my $vf = $from->get_os()->get_os();
        my $name = $from->get_name();
        $diff .= "$ref/$name: os missing in TO: $vf\n";
    }
    elsif ( defined( $to->get_os() ) ) {
        my $ref = ref($to);
        my $vt = $to->get_os()->get_os();
        my $name = $from->get_name();
        $diff .= "$ref/$name: os missing in FROM: $vt\n";
    }

    # Diff the save groups
    if ( $from->get_save_groups() ne $to->get_save_groups() ) {
        my $ref = ref($from);
        my $vf = $from->get_save_groups();
        my $vt = $to->get_save_groups();
        my $name = $from->get_name();
        $diff .= "$ref/$name: save groups difference: $vf <-> $vt\n";
    }

    # Diff the save time in days
    if ( $from->get_save_time_in_days() ne $to->get_save_time_in_days() ) {
        my $ref = ref($from);
        my $vf = $from->get_save_time_in_days();
        my $vt = $to->get_save_time_in_days();
        my $name = $from->get_name();
        $diff .= "$ref/$name: save time in days difference: $vf <-> $vt\n";
    }

    # Diff the start time clean job hour
    if ( $from->get_start_time_clean_job_hour() ne $to->get_start_time_clean_job_hour() ) {
        my $ref = ref($from);
        my $vf = $from->get_start_time_clean_job_hour();
        my $vt = $to->get_start_time_clean_job_hour();
        my $name = $from->get_name();
        $diff .= "$ref/$name: start time clean job hour difference: $vf <-> $vt\n";
    }

    # Diff the start time clean job minute
    if ( $from->get_start_time_clean_job_minute() ne $to->get_start_time_clean_job_minute() ) {
        my $ref = ref($from);
        my $vf = $from->get_start_time_clean_job_minute();
        my $vt = $to->get_start_time_clean_job_minute();
        my $name = $from->get_name();
        $diff .= "$ref/$name: start time clean job minute difference: $vf <-> $vt\n";
    }

    # Diff the type
    if ( $from->get_type() ne $to->get_type() ) {
        my $ref = ref($from);
        my $vf = $from->get_type();
        my $vt = $to->get_type();
        my $name = $from->get_name();
        $diff .= "$ref/$name: type difference: $vf <-> $vt\n";
    }

    # Diff the remote system
    foreach my $kf ( sort( $from->keys_remote_system() ) ) {
        if ( $to->exists_remote_system($kf) ) {
            $diff .= ( $from->values_remote_system($kf) )[0]->diff(
                ( $to->values_remote_system($kf) )[0], $diff_number);
        }
        else {
            my $ref = ref($from);
            my $name = $from->get_name();
            $diff .= "$ref/$name: remote system missing in TO: $kf\n";
        }
    }
    foreach my $kt ( sort( $to->keys_remote_system() ) ) {
        if ( $from->exists_remote_system($kt) ) {
            next;
        }
        else {
            my $ref = ref($from);
            my $name = $from->get_name();
            $diff .= "$ref/$name: remote system missing in FROM: $kt\n";
        }
    }

    # Diff the device
    foreach my $kf ( sort( $from->keys_device() ) ) {
        if ( $to->exists_device($kf) ) {
            $diff .= ( $from->values_device($kf) )[0]->diff(
                ( $to->values_device($kf) )[0], $diff_number);
        }
        else {
            my $ref = ref($from);
            my $name = $from->get_name();
            $diff .= "$ref/$name: device missing in TO: $kf\n";
        }
    }
    foreach my $kt ( sort( $to->keys_device() ) ) {
        if ( $from->exists_device($kt) ) {
            next;
        }
        else {
            my $ref = ref($from);
            my $name = $from->get_name();
            $diff .= "$ref/$name: device missing in FROM: $kt\n";
        }
    }

    # Return diff
    return($diff);
}

sub new_from_tokenizer {
    my $class = shift;
    my $tokenizer = shift;

    # First token must be a HH::Unispool::Config::File::Token::Comment::Misc
    my $cm = $tokenizer->get();
    my $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($cm, 'HH::Unispool::Config::File::Token::Comment::Misc') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a first token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Comment::Misc' on or directly after line '$line'.");

    # Second token must be a HH::Unispool::Config::File::Token::Unnumbered::Host
    my $h = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($h,
                'HH::Unispool::Config::File::Token::Unnumbered::Host') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a second token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::Host' on or directly after line '$line'.");

    # Prepare the initialization option hash
    my %opt = ();

    # Add the Misc comment related options
    $opt{name} = $cm->get_net_desc();

    # Add the 'H' related options
    $opt{network_name} = $h->get_name();
    if ( $h->get_os() ) {
        require HH::Unispool::Config::OS;
        $opt{os} = $h->get_os();
    }

    # Expect M and L tokens
    if ($opt{name} ne '_Network_') {
        my $m = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($m,
                    'HH::Unispool::Config::File::Token::Unnumbered::Misc') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a second token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::Misc' on or directly after line '$line'.");

        # Add the 'M' related options
        $opt{clean_on_weekdays_only} = $m->is_clean_on_weekdays_only()
            if ( defined( $m->is_clean_on_weekdays_only() ) );
        $opt{date_format} = $m->get_date_format()
            if ( defined( $m->get_date_format() ) );
        $opt{default_printer} = $m->get_default_printer()
            if ( $m->get_default_printer() );
        $opt{local_system_name} = $m->get_local_system_name();
        $opt{maximum_delay_time} = $m->get_maximum_delay_time()
            if ( defined( $m->get_maximum_delay_time() ) );
        $opt{maximum_print_file_space} = $m->get_maximum_print_file_space()
            if ( $m->get_maximum_print_file_space() );
        $opt{maximum_save_file_space} = $m->get_maximum_save_file_space()
            if ( $m->get_maximum_save_file_space() );
        $opt{save_groups} = $m->get_save_groups()
            if ( $m->get_save_groups() );
        $opt{save_time_in_days} = $m->get_save_time_in_days()
            if ( $m->get_save_time_in_days() );
        $opt{start_time_clean_job_hour} = $m->get_start_time_clean_job_hour()
            if ( $m->get_start_time_clean_job_hour() );
        $opt{start_time_clean_job_minute} =
            $m->get_start_time_clean_job_minute()
                if ( $m->get_start_time_clean_job_minute() );

        my $l = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($l,
                    'HH::Unispool::Config::File::Token::Unnumbered::CSN') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a second token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Unnumbered::CSN' on or directly after line '$line'.");

        # Add the 'L' related options
        $opt{central_console_node} = $l->get_central_console_node()
            if ( $l->get_central_console_node() );
    }

    # Construct a new object
    my $self = HH::Unispool::Config::Entry::System->new(\%opt);

    # Next token must be a HH::Unispool::Config::File::Token::Comment::RSys
    my $cr = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($cr,
                'HH::Unispool::Config::File::Token::Comment::RSys') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a token from 'TOKENIZER' of class 'HH::Unispool::Config::File::Token::Comment::RSys' on or directly after line '$line'.");

    # The cm and cr net descriptors must be identical
    ( $cm->get_net_desc() eq $cr->get_net_desc() ) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, the network descriptor name in the comment 'Remote system' line differs from the name in the comment 'Miscellaneous' line on or directly after line '$line'.");

    # Read all remote systems
    while ( my $tok =  $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Unget the token as it is not processed inside this loop
        $tokenizer->unget();

        # Only process HH::Unispool::Config::File::Token::Numbered::System
        if (! $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System') ) {
            last;
        }

        # Make the remote system
        my $rsys = undef;
        if ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::3') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::3;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::3->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::6') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::6;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::6->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::7') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::7;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::7->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::System::8') ) {
            require HH::Unispool::Config::Entry::RemoteSystem::8;
            $rsys = HH::Unispool::Config::Entry::RemoteSystem::8->
                         new_from_tokenizer($tokenizer);
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, unexpected 'HH::Unispool::Config::File::Token::Numbered::System'  subclass obtained from 'TOKENIZER' on or directly after line '$line'.");
        }

        # Add the remote system
        my $name =  $rsys->get_name();
        $self->exists_remote_system($name) &&
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, remote system named '$name' defined twice somewhere around '$line'.");
        $self->add_remote_system( $rsys );
    }

    # Expect a HH::Unispool::Config::File::Token::Comment::Device
    my $cd = $tokenizer->get();
    &UNIVERSAL::isa( $cd,
        'HH::Unispool::Config::File::Token::Comment::Device') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a 'HH::Unispool::Config::File::Token::Comment::Device' line on or directly after line '$line'.");

    # The cm and cd net descriptors must be identical
    ( $cm->get_net_desc() eq $cd->get_net_desc() ) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, the network descriptor name in the comment 'Device' line differs from the name in the comment 'Miscellaneous' line on or directly after line '$line'.");

    # Read all devices
    my %dev3 = ();
    while ( my $tok =  $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Unget the token as it is not processed inside this loop
        $tokenizer->unget();

        # Only process HH::Unispool::Config::File::Token::Numbered::Device
        if (! $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device') ) {
            last;
        }

        # Make the device
        my $dev = undef;
        if ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::0') ) {
            require HH::Unispool::Config::Entry::Device::0;
            $dev = HH::Unispool::Config::Entry::Device::0->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::1') ) {
            require HH::Unispool::Config::Entry::Device::1;
            $dev = HH::Unispool::Config::Entry::Device::1->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::2') ) {
            require HH::Unispool::Config::Entry::Device::2;
            $dev = HH::Unispool::Config::Entry::Device::2->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::3') ) {
            require HH::Unispool::Config::Entry::Device::3;
            $dev = HH::Unispool::Config::Entry::Device::3->
                         new_from_tokenizer($tokenizer);
            my $number = $dev->get_number();
            exists($dev3{$number}) &&
                throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, type 3 device with number '$number' defined twice somewhere around '$line'.");
            $dev3{$number} = [ $dev, $line ];
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::4') ) {
            require HH::Unispool::Config::Entry::Device::4;
            $dev = HH::Unispool::Config::Entry::Device::4->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::5') ) {
            require HH::Unispool::Config::Entry::Device::5;
            $dev = HH::Unispool::Config::Entry::Device::5->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::6') ) {
            require HH::Unispool::Config::Entry::Device::6;
            $dev = HH::Unispool::Config::Entry::Device::6->
                         new_from_tokenizer($tokenizer);
        }
        elsif ( $tok->isa(
                'HH::Unispool::Config::File::Token::Numbered::Device::7') ) {
            require HH::Unispool::Config::Entry::Device::7;
            $dev = HH::Unispool::Config::Entry::Device::7->
                         new_from_tokenizer($tokenizer);
        }
        else {
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, unexpected 'HH::Unispool::Config::File::Token::Numbered::Device'  subclass obtained from 'TOKENIZER' on or directly after line '$line'.");
        }

        # Add the device
        my $name =  $dev->get_name();
        $self->exists_device($name) &&
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, device named '$name' defined twice somewhere around '$line'.");
        $self->add_device($dev);
    }

    # Expect a HH::Unispool::Config::File::Token::Comment::Group
    my $cg = $tokenizer->get();
    &UNIVERSAL::isa( $cg,
        'HH::Unispool::Config::File::Token::Comment::Group') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, expected a 'HH::Unispool::Config::File::Token::Comment::Group' line on or directly after line '$line'.");

    # The cm and cg net descriptors must be identical
    ( $cm->get_net_desc() eq $cg->get_net_desc() ) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, the network descriptor name in the comment 'Group' line differs from the name in the comment 'Miscellaneous' line on or directly after line '$line'.");

    # Read all groups
    while ( my $tok =  $tokenizer->get() ) {
        # Get the last read line number
        $line = $tokenizer->input_line_number();

        # Unget the token as it is not processed inside this loop
        $tokenizer->unget();

        # Process untile there are still
        # tokens HH::Unispool::Config::File::Token::Numbered::Device::Group
        $tok->isa(
            'HH::Unispool::Config::File::Token::Numbered::Device::Group') ||
                last;

        # Check if the group token has a corresponding device
        my $number = $tok->get_number();
        exists( $dev3{$number} ) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, no device defined for 'Group' token with number '$number' before line '$line'.");

        # Check if the group token is already processed for the device
        defined( $dev3{$number} ) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, 'Group' token with number '$number' was processed before line '$line'.");

        # Add the group tokens to the device
        $dev3{$number}[0]->add_members_from_tokenizer($tokenizer);

        # Mark group device as processed
        $dev3{$number} = undef;
    }

    # Check if all group devices were processed
    foreach my $number (sort (keys (%dev3) ) ) {
        # Next if group device was processed
        defined( $dev3{$number} ) || next;

        # Throw exception
        throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::new_from_tokenizer, 'Group' device with number '$number' did not have any group tokens attached to it see line '$dev3{$number}[1]'.");
    }

    # Return self
    return($self);
}

sub write {
    my $self = shift;
    my $fh = shift;

    # Make and write the Misc comment token
    require HH::Unispool::Config::File::Token::Comment::Misc;
    my $tok = HH::Unispool::Config::File::Token::Comment::Misc->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Make and write the H token
    my %opt = ( name => $self->get_network_name() );
    $opt{os} = $self->get_os() if ( $self->get_name() ne '_Network_' );
    require HH::Unispool::Config::File::Token::Unnumbered::Host;
    $tok = HH::Unispool::Config::File::Token::Unnumbered::Host->new(\%opt);
    $fh->print( $tok->write_string() );

    # Make and write the M and L tokens
    if ($self->get_name() ne '_Network_') {
        %opt = (
            clean_on_weekdays_only => $self->is_clean_on_weekdays_only(),
            date_format => $self->get_date_format(),
            default_printer => $self->get_default_printer(),
            local_system_name => $self->get_local_system_name(),
            maximum_delay_time => $self->get_maximum_delay_time(),
            maximum_print_file_space => $self->get_maximum_print_file_space(),
            maximum_save_file_space => $self->get_maximum_save_file_space(),
            save_groups => $self->get_save_groups(),
            save_time_in_days => $self->get_save_time_in_days(),
            start_time_clean_job_hour => $self->get_start_time_clean_job_hour(),
            start_time_clean_job_minute =>
                                    $self->get_start_time_clean_job_minute(),
        );
        require HH::Unispool::Config::File::Token::Unnumbered::Misc;
        $tok = HH::Unispool::Config::File::Token::Unnumbered::Misc->new(\%opt);
        $fh->print( $tok->write_string() );

        %opt = (
            central_console_node => $self->get_central_console_node(),
        );
        require HH::Unispool::Config::File::Token::Unnumbered::CSN;
        $tok = HH::Unispool::Config::File::Token::Unnumbered::CSN->new(\%opt);
        $fh->print( $tok->write_string() );
    }

    # Empty line
    $fh->print( "\n" );

    # Make and write the Remote system comment token
    require HH::Unispool::Config::File::Token::Comment::RSys;
    $tok = HH::Unispool::Config::File::Token::Comment::RSys->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Write the remote systems
    my $i = 0;
    foreach my $name ( sort( $self->keys_remote_system() ) ) {
        $i ++;
        my $rsys = ($self->values_remote_system($name))[0];
        $rsys->set_number($i);
        $rsys->write($fh);
    }

    # Empty line
    $fh->print( "\n" );

    # Make and write the Device comment token
    require HH::Unispool::Config::File::Token::Comment::Device;
    $tok = HH::Unispool::Config::File::Token::Comment::Device->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Write the devices
    $i = 0;
    foreach my $name ( sort( $self->keys_device() ) ) {
        $i ++;
        my $dev = ($self->values_device($name))[0];
        $dev->set_number($i);
        $dev->write($fh);
    }

    # Empty line
    $fh->print( "\n" );

    # Make and write the Group comment token
    require HH::Unispool::Config::File::Token::Comment::Group;
    $tok = HH::Unispool::Config::File::Token::Comment::Group->new( {
        net_desc => $self->get_name(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print( "\n" );

    # Write the group devices tokens
    foreach my $name ( sort( $self->keys_device() ) ) {
        my $dev = ($self->values_device($name))[0];
        $dev->isa('HH::Unispool::Config::Entry::Device::3') || next;
        $dev->write_group($fh);
    }

    # Empty lines
    $fh->print( "\n" );
    $fh->print( "\n" );
}

sub set_central_console_node {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'central_console_node', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_central_console_node, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{central_console_node} = $val;
}

sub get_central_console_node {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{central_console_node} );
}

sub set_clean_on_weekdays_only {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_System}{clean_on_weekdays_only} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_System}{clean_on_weekdays_only} = 0;
    }
}

sub is_clean_on_weekdays_only {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_System}{clean_on_weekdays_only} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_date_format {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'date_format', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_date_format, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{date_format} = $val;
}

sub get_date_format {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{date_format} );
}

sub set_default_printer {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'default_printer', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_default_printer, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{default_printer} = $val;
}

sub get_default_printer {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{default_printer} );
}

sub set_device {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'device', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_device, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config_Entry_System}{device} = {};

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Entry_System}{device}{ $val->get_name() } = $val;
    }
}

sub add_device {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'device', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::add_device, one or more specified value(s) '@_' is/are not allowed.");

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Entry_System}{device}{ $val->get_name() } = $val;
    }
}

sub delete_device {
    my $self = shift;

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config_Entry_System}{device}{$val} ) || next;
        delete( $self->{HH_Unispool_Config_Entry_System}{device}{$val} );
        $del ++;
    }
    return($del);
}

sub exists_device {
    my $self = shift;

    # Count occurences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config_Entry_System}{device}{$val} );
    }
    return($count);
}

sub keys_device {
    my $self = shift;

    # Return all keys
    return( keys( %{ $self->{HH_Unispool_Config_Entry_System}{device} } ) );
}

sub values_device {
    my $self = shift;

    if ( scalar(@_) ) {
        my @ret = ();
        foreach my $key (@_) {
            exists( $self->{HH_Unispool_Config_Entry_System}{device}{$key} ) && push( @ret, $self->{HH_Unispool_Config_Entry_System}{device}{$key} );
        }
        return(@ret);
    }
    else {
        # Return all values
        return( values( %{ $self->{HH_Unispool_Config_Entry_System}{device} } ) );
    }
}

sub set_diff_number {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config_Entry_System}{diff_number} = 1;
    }
    else {
        $self->{HH_Unispool_Config_Entry_System}{diff_number} = 0;
    }
}

sub is_diff_number {
    my $self = shift;

    if ( $self->{HH_Unispool_Config_Entry_System}{diff_number} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub set_local_system_name {
    my $self = shift;
    my $val = shift;

    # Value for 'local_system_name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_local_system_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'local_system_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_local_system_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{local_system_name} = $val;
}

sub get_local_system_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{local_system_name} );
}

sub set_maximum_delay_time {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'maximum_delay_time', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_maximum_delay_time, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{maximum_delay_time} = $val;
}

sub get_maximum_delay_time {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{maximum_delay_time} );
}

sub set_maximum_print_file_space {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'maximum_print_file_space', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_maximum_print_file_space, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{maximum_print_file_space} = $val;
}

sub get_maximum_print_file_space {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{maximum_print_file_space} );
}

sub set_maximum_save_file_space {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'maximum_save_file_space', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_maximum_save_file_space, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{maximum_save_file_space} = $val;
}

sub get_maximum_save_file_space {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{maximum_save_file_space} );
}

sub set_network_name {
    my $self = shift;
    my $val = shift;

    # Value for 'network_name' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_network_name, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'network_name', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_network_name, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{network_name} = $val;
}

sub get_network_name {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{network_name} );
}

sub set_os {
    my $self = shift;
    my $val = shift;

    # Value for 'os' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_os, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'os', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_os, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{os} = $val;
}

sub get_os {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{os} );
}

sub set_remote_system {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'remote_system', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_remote_system, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config_Entry_System}{remote_system} = {};

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Entry_System}{remote_system}{ $val->get_name() } = $val;
    }
}

sub add_remote_system {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'remote_system', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::add_remote_system, one or more specified value(s) '@_' is/are not allowed.");

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config_Entry_System}{remote_system}{ $val->get_name() } = $val;
    }
}

sub delete_remote_system {
    my $self = shift;

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config_Entry_System}{remote_system}{$val} ) || next;
        delete( $self->{HH_Unispool_Config_Entry_System}{remote_system}{$val} );
        $del ++;
    }
    return($del);
}

sub exists_remote_system {
    my $self = shift;

    # Count occurences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config_Entry_System}{remote_system}{$val} );
    }
    return($count);
}

sub keys_remote_system {
    my $self = shift;

    # Return all keys
    return( keys( %{ $self->{HH_Unispool_Config_Entry_System}{remote_system} } ) );
}

sub values_remote_system {
    my $self = shift;

    if ( scalar(@_) ) {
        my @ret = ();
        foreach my $key (@_) {
            exists( $self->{HH_Unispool_Config_Entry_System}{remote_system}{$key} ) && push( @ret, $self->{HH_Unispool_Config_Entry_System}{remote_system}{$key} );
        }
        return(@ret);
    }
    else {
        # Return all values
        return( values( %{ $self->{HH_Unispool_Config_Entry_System}{remote_system} } ) );
    }
}

sub set_save_groups {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'save_groups', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_save_groups, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{save_groups} = $val;
}

sub get_save_groups {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{save_groups} );
}

sub set_save_time_in_days {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'save_time_in_days', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_save_time_in_days, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{save_time_in_days} = $val;
}

sub get_save_time_in_days {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{save_time_in_days} );
}

sub set_start_time_clean_job_hour {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'start_time_clean_job_hour', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_start_time_clean_job_hour, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{start_time_clean_job_hour} = $val;
}

sub get_start_time_clean_job_hour {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{start_time_clean_job_hour} );
}

sub set_start_time_clean_job_minute {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'start_time_clean_job_minute', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_start_time_clean_job_minute, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{start_time_clean_job_minute} = $val;
}

sub get_start_time_clean_job_minute {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{start_time_clean_job_minute} );
}

sub set_type {
    my $self = shift;
    my $val = shift;

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'type', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::Entry::System::set_type, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config_Entry_System}{type} = $val;
}

sub get_type {
    my $self = shift;

    return( $self->{HH_Unispool_Config_Entry_System}{type} );
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

