package HH::Unispool::Config;

use 5.006;
use strict;
use warnings;
use AutoLoader qw(AUTOLOAD);
use Error qw(:try);
use HH::Unispool::Config::Scope;

# Used by _value_is_allowed
our %ALLOW_ISA = (
    'filter' => [ 'HH::Unispool::Config::Entry::Filter' ],
    'scope' => [ 'HH::Unispool::Config::Scope' ],
    'system' => [ 'HH::Unispool::Config::Entry::System' ],
);

# Used by _value_is_allowed
our %ALLOW_REF = (
);

# Used by _value_is_allowed
our %ALLOW_RX = (
    'host' => [ '^.+$' ],
    'time' => [ '^\d+$' ],
    'version' => [ '^.+$' ],
);

# Used by _value_is_allowed
our %ALLOW_VALUE = (
);

# Used by _initialize
our %DEFAULT_VALUE = (
    'diff_host' => 0,
    'diff_number' => 0,
    'diff_time' => 0,
    'diff_version' => 0,
    # See _initialize for 'host' default value
    'scope' => HH::Unispool::Config::Scope->new(),
    # See _initialize for 'time' default value
    # See _initialize for 'version' default value
);

# Package version
our ($VERSION) = '$Revision: 0.3 $' =~ /\$Revision:\s+([^\s]+)/;

1;

__END__

=head1 NAME

HH::Unispool::Config - HollandHouse' UNISPOOL configuration

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

HollandHouse' UNISPOOL configuration

=head1 DESCRIPTION

C<HH::Unispool::Config> manages HollandHouse' UNISPOOL configuration files. Files can be read, written, generated from scratch and C<diff>-ed.

=head1 CONSTRUCTOR

=over

=item new( [ OPT_HASH_REF ] )

Creates a new C<HH::Unispool::Config> object. C<OPT_HASH_REF> is a hash reference used to pass initialization options. On error an exception C<Error::Simple> is thrown.

Options for C<OPT_HASH_REF> may include:

=over

=item B<C<diff_host>>

Passed to L<set_diff_host()>. Defaults to B<0>.

=item B<C<diff_number>>

Passed to L<set_diff_number()>. Defaults to B<0>.

=item B<C<diff_time>>

Passed to L<set_diff_time()>. Defaults to B<0>.

=item B<C<diff_version>>

Passed to L<set_diff_version()>. Defaults to B<0>.

=item B<C<filter>>

Passed to L<set_filter()>. Must be an C<ARRAY> reference.

=item B<C<host>>

Passed to L<set_host()>. Defaults to the first part of C<&Sys::Hostname::hostname()>.

=item B<C<scope>>

Passed to L<set_scope()>. Defaults to B<HH::Unispool::Config::Scope-E<gt>new()>.

=item B<C<system>>

Passed to L<set_system()>. Must be an C<ARRAY> reference.

=item B<C<time>>

Passed to L<set_time()>. Defaults to B<'time()'>.

=item B<C<version>>

Passed to L<set_version()>. Defaults to the version number of the installed UNISPOOL instance or C<0>.

=back

=item new_from_file(FILE)

Constructs a new C<HH::Unispool::Config> object using a file. C<FILE> is either a file name or an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item new_from_unispool()

Dumps the configuration of the UNISPOOL instance running on this machine into a temporary file, creates a new C<HH::Unispool::Config> object using the temporary file and cleans up the temporary file. On error an exception C<Error::Simple> is thrown.

=back

=head1 METHODS

=over

=item add_filter( [ VALUE ... ] )

Add additional values on the list of filters. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurrences of the same key yield in the last occurring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::Filter

=back

=back

=item add_system( [ VALUE ... ] )

Add additional values on the list of systems. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurrences of the same key yield in the last occurring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::System

=back

=back

=item delete_filter(ARRAY)

Delete elements from the list of filters. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item delete_system(ARRAY)

Delete elements from the list of systems. Returns the number of deleted elements. On error an exception C<Error::Simple> is thrown.

=item diff(TO)

Finds differences between two objects. In C<diff> terms, the object is the B<from> object and the specified C<TO> parameter the B<to> object. C<TO> is a reference to an identical object class. Returns an empty string if no difference found and a difference descritpion string otherwise. On error an exception C<Error::Simple> is thrown.

=item exists_filter(ARRAY)

Returns the count of items in C<ARRAY> that are in the list of filters.

=item exists_system(ARRAY)

Returns the count of items in C<ARRAY> that are in the list of systems.

=item get_host()

Returns the host in the comment.

=item get_scope()

Returns not described option.

=item get_time()

Returns the date in the comment in Unix time.

=item get_version()

Returns the version in the comment.

=item is_diff_host()

Returns whether L<diff()> should consider the C<host> attribtute or not.

=item is_diff_number()

Returns whether L<diff()> should consider the C<number> attribtutes of devices and remote systems or not.

=item is_diff_time()

Returns whether L<diff()> should consider the C<time> attribtute or not.

=item is_diff_version()

Returns whether L<diff()> should consider the C<version> attribtute or not.

=item keys_filter()

Returns an C<ARRAY> containing the keys of the list of filters.

=item keys_system()

Returns an C<ARRAY> containing the keys of the list of systems.

=item set_diff_host(VALUE)

State that L<diff()> should consider the C<host> attribtute. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_diff_number(VALUE)

State that L<diff()> should consider the C<number> attribtutes of devices and remote systems. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_diff_time(VALUE)

State that L<diff()> should consider the C<time> attribtute. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_diff_version(VALUE)

State that L<diff()> should consider the C<version> attribtute. C<VALUE> is the value. Default value at initialization is C<0>. On error an exception C<Error::Simple> is thrown.

=item set_filter( [ VALUE ... ] )

Set the list of filters absolutely using values. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurrences of the same key yield in the last occurring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::Filter

=back

=back

=item set_host(VALUE)

Set the host in the comment. C<VALUE> is the value. Default value at initialization is the first part of C<&Sys::Hostname::hostname()>. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item set_scope(VALUE)

Set not described option. C<VALUE> is the value. Default value at initialization is C<HH::Unispool::Config::Scope-E<gt>new()>. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must be a (sub)class of:

=over

=item HH::Unispool::Config::Scope

=back

=back

=item set_system( [ VALUE ... ] )

Set the list of systems absolutely using values. Each C<VALUE> is an object out of which the id is obtained through method C<get_name()>. The obtained B<key> is used to store the value and may be used for deletion and to fetch the value. 0 or more values may be supplied. Multiple occurrences of the same key yield in the last occurring key to be inserted and the rest to be ignored. Each key of the specified values is allowed to occur only once. On error an exception C<Error::Simple> is thrown.

=over

=item The values in C<ARRAY> must be a (sub)class of:

=over

=item HH::Unispool::Config::Entry::System

=back

=back

=item set_time(VALUE)

Set the date in the comment in Unix time. C<VALUE> is the value. Default value at initialization is C<time()>. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^\d+$

=back

=back

=item set_version(VALUE)

Set the version in the comment. C<VALUE> is the value. Default value at initialization is the version number of the installed UNISPOOL instance or C<0>. C<VALUE> may not be C<undef>. On error an exception C<Error::Simple> is thrown.

=over

=item VALUE must match regular expression:

=over

=item ^.+$

=back

=back

=item values_filter( [ KEY_ARRAY ] )

Returns an C<ARRAY> containing the values of the list of filters. If C<KEY_ARRAY> contains one or more C<KEY>s the values related to the C<KEY>s are returned. If no C<KEY>s specified all values are returned.

=item values_system( [ KEY_ARRAY ] )

Returns an C<ARRAY> containing the values of the list of systems. If C<KEY_ARRAY> contains one or more C<KEY>s the values related to the C<KEY>s are returned. If no C<KEY>s specified all values are returned.

=item write(FILE)

Writes the object to file. C<FILE> is either a file name or an C<IO::Handle> reference. On error an exception C<Error::Simple> is thrown.

=item write_to_unispool()

Writes the object to file and loads the file into UNISPOOL using C<config -load>. On error an exception C<Error::Simple> is thrown.

=back

=head1 SEE ALSO

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

sub new_from_file {
    my $class = shift;
    my $file = shift;

    # The file handle
    my $fh;

    # Check if we already have a file handle
    if ( ref($file) ) {
        $file->isa('IO::Handle') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, specified 'FILE' parameter is not an 'IO::Handle' object.");
        $fh = $file;
    } else {
        require IO::File;
        $fh = IO::File->new("< $file");
        defined($fh) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, failed to open file '$file' for reading.");
    }

    # The option hash to eventually create the object
    my %opt = ();

    # Make a tokenizer
    require HH::Unispool::Config::File::Tokenizer;
    my $tokenizer = HH::Unispool::Config::File::Tokenizer->new( { file => $fh } );

    # Expect a comment header
    my $ch = $tokenizer->get();
    my $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($ch, 'HH::Unispool::Config::File::Token::Comment::Head') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Head' on or directly after line '$line'.");

    # Options 'host' and 'version'
    $opt{host} = $ch->get_host();
    $opt{version} = $ch->get_version();

    # Expect a comment date
    my $cd = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($cd, 'HH::Unispool::Config::File::Token::Comment::Date') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Date' on or directly after line '$line'.");

    # Option 'time'
    $opt{time} = $cd->get_time();

    # Expect a comment scope
    my $tcs = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($tcs,
                        'HH::Unispool::Config::File::Token::Comment::Scope') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Scope' on or directly after line '$line'.");

    # Option 'scope'
    $opt{scope} = $tcs->get_scope();

    # Check for configuration server info comment
    my $cs = undef;
    my %bcs = ();
    if ( $tcs->get_scope()->exists_scope('_Server_') ) {
        # Expect HH::Unispool::Config::File::Token::Comment::Cs token
        my $csc = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($csc,
                    'HH::Unispool::Config::File::Token::Comment::Cs') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Cs' on or directly after line '$line'.");

        # Expect ONE HH::Unispool::Config::File::Token::Unnumbered::Cs token
        my $csrv = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($csrv,
                    'HH::Unispool::Config::File::Token::Unnumbered::Cs') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Unnumbered::Cs' on or directly after line '$line'.");
        $cs = $csrv->get_hostname();

        # Expect 0 or more HH::Unispool::Config::File::Token::Unnumbered::Bcs
        # tokens
        while ( my $bsrv = $tokenizer->get() ) {
            # Break on different token
            if (! $bsrv->isa(
                    'HH::Unispool::Config::File::Token::Unnumbered::Bcs') ) {
                $tokenizer->unget();
                last;
            }

            # Check if this hostname is defined as CS
            ( $bsrv->get_hostname() eq $cs ) &&
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, token of class 'HH::Unispool::Config::File::Token::Unnumbered::Bcs' contains the value of the HH::Unispool::Config::File::Token::Unnumbered::Cs token on or directly after line '$line'.");

            # Check if this hostname is defined as BCS
            exists( $bcs{ $bsrv->get_hostname() } ) &&
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, token of class 'HH::Unispool::Config::File::Token::Unnumbered::Bcs' defined twice with same host name on or directly after line '$line'.");

            # Remember the BCS
            $bcs{ $bsrv->get_hostname() } = 1;
        }

        # Check if more than 7 bcs-es are defined
        if ( scalar( keys(%bcs) ) > 7 ) {
            my $bcs = join( '\', \'', sort( keys(%bcs) ) );
            throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, too many backup configuration servers declared '$bcs' on or directly after line '$line'.");
        }
    }

    # Check for filter file info comment
    my %filter = ();
    if ( $tcs->get_scope()->exists_scope('_Script_') ) {
        # Expect HH::Unispool::Config::File::Token::Comment::Filter token
        my $csc = $tokenizer->get();
        $line = $tokenizer->input_line_number();
        &UNIVERSAL::isa($csc,
                    'HH::Unispool::Config::File::Token::Comment::Filter') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Filter' on or directly after line '$line'.");

        # Expect 1 or more HH::Unispool::Config::File::Token::Unnumbered::Filter
        # tokens
        while ( my $tok = $tokenizer->get() ) {
            # Get the last read line number
            $line = $tokenizer->input_line_number();

            # Unget the token as it is not processed inside this loop
            $tokenizer->unget();

            # Only process HH::Unispool::Config::File::Token::Unnumbered::Filter
            if (! $tok->isa(
                    'HH::Unispool::Config::File::Token::Unnumbered::Filter') ) {
                last;
            }

            # Read the filter
            require HH::Unispool::Config::Entry::Filter;
            my $filter = HH::Unispool::Config::Entry::Filter->
                                                new_from_tokenizer($tokenizer);

            # Check if this filter is already defined
            my $name = $filter->get_name();
            exists( $filter{$name} ) &&
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, token of class 'HH::Unispool::Config::File::Token::Unnumbered::Filter' defined twice with same name '$name' on or directly after line '$line'.");

            # Remember the filter
            $filter{$name} = $filter;
        }

        # Check for at least 1 filter
        scalar(%filter) ||
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected at least one token of class 'HH::Unispool::Config::File::Token::Unnumbered::Filter' on or directly after line '$line'.");

        # Option 'filter'
        $opt{filter} = [ values(%filter) ];
    }

    # Read all systems
    if ( $tcs->get_scope()->exists_scope('_Network_') ||
         $tcs->get_scope()->exists_scope('_Local_') ||
         $tcs->get_scope()->exists_scope('System=*') ) {

        my %system = ();
        while(my $tok = $tokenizer->get() ) {
            # Get the last read line number
            $line = $tokenizer->input_line_number();

            # Unget the token as it is not processed inside this loop
            $tokenizer->unget();

            # Only process HH::Unispool::Config::File::Token::Comment::Misc
            if ( ! $tok->isa(
                        'HH::Unispool::Config::File::Token::Comment::Misc') ) {
                last;
            }

            # Read the system
            require HH::Unispool::Config::Entry::System;
            my $system = HH::Unispool::Config::Entry::System->
                                                new_from_tokenizer($tokenizer);

            # Check if the system is expected
            my $name = $system->get_name();
            if ( $name eq '_Network_' ) {
                $tcs->get_scope()->exists_scope('_Network_') ||
                    throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, found system named '_Network_' without '_Network_' scope on or directly after line '$line'.");
            }
            elsif ( $name eq '_Local_' ) {
                $tcs->get_scope()->exists_scope('_Local_') ||
                    throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, found system named '_Local_' without '_Local_' scope on or directly after line '$line'.");
            }
            elsif ( ! $tcs->get_scope()->exists_scope('System=*') ) {
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, found system named '$name' without 'System=*' scope on or directly after line '$line'.");
            }
            elsif ( exists($system{$name} ) ) {
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, multiple declarations of system named '$name' on or directly after line '$line'.");
            }

            # Remember system
            $system{$name} = $system;
        }

        # Check if the CS/BCS entries made sense. Also set the system types.
        if ( $tcs->get_scope()->exists_scope('_Server_') ) {
            # Check CS
            exists( $system{$cs} ) ||
                throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, system named '$cs' defined as configuration server but no system entry found further on.");

            # Check BCSes
            foreach my $bcs ( sort( keys(%bcs) ) ) {
                exists( $system{$bcs} ) ||
                    throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, system named '$bcs' defined as backup configuration server but no system entry found further on.");
            }

            # Set the system types
            foreach my $system ( keys(%system) ) {
                if ( ($system{$system})->get_name() eq $cs ) {
                    $system{$system}->set_type('cs');
                }
                elsif ( exists( $bcs{ $system{$system}->get_name() } ) ) {
                    $system{$system}->set_type('bcs');
                }
                else {
                    $system{$system}->set_type('cc');
                }
            }
        }

        # Option 'system'
        $opt{system} = [ values(%system) ];
    }

    # Expect a comment tail
    my $ct = $tokenizer->get();
    $line = $tokenizer->input_line_number();
    &UNIVERSAL::isa($ct, 'HH::Unispool::Config::File::Token::Comment::Tail') ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, expected token of class 'HH::Unispool::Config::File::Token::Comment::Tail' on or directly after line '$line'.");

    # Check if host name in head and tail is identical
    if ( $ch->get_host() ne $ct->get_host() ) {
        my $hh = $ch->get_host();
        my $ht = $ct->get_host();
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_file, host names in head ('$hh') and tail ('$ht') comment differ on or directly after line '$line'.");
    }

    # Create object and return it
    return( HH::Unispool::Config->new(\%opt) );
}

sub new_from_unispool {
    my $class = shift;

    # Throw an exception if no unispool user on system
    my @pw = getpwnam('unispool');
    scalar(@pw) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_unispool, you don't have a 'unisppol' user on this system.");

    # Make a temporary file
    use IO::File;
    use POSIX qw (tmpnam);
    my $fn = '';
    my $fh = undef;
    while (!defined ($fh)) {
        $fn = tmpnam();
        $fh = IO::File->new ($fn, O_RDWR|O_CREAT|O_EXCL);
        $fh->close();
    }

    # Issue a utility command and try to dump the configuration
    my $cmd = "echo y | $pw[7]/bin/utility 'config -dump $fn' -1 1>/dev/null 2>&1";
    system($cmd);
    my $ex = $?>>8;
    if ($ex) {
        unlink($fn);
        throw Error::Simple("ERROR: HH::Unispool::Config::new_from_unispool, command '$cmd' exited with code '$ex'.");
    }

    # Create a config file using new_from_file()
    my $cfg;
    try {
        $cfg = HH::Unispool::Config->new_from_file( $fn );
    }
    catch Error::Simple with {
        my $e = shift;
        unlink($fn);
        throw Error::Simple($e->{-text});
    };
    return($cfg);
}

sub _initialize {
    my $self = shift;
    my $opt = defined($_[0]) ? shift : {};

    # Check $opt
    ref($opt) eq 'HASH' || throw Error::Simple("ERROR: HH::Unispool::Config::_initialize, first argument must be 'HASH' reference.");

    # diff_host, BOOLEAN, with default value
    $self->set_diff_host( exists( $opt->{diff_host} ) ? $opt->{diff_host} : $DEFAULT_VALUE{diff_host} );

    # diff_number, BOOLEAN, with default value
    $self->set_diff_number( exists( $opt->{diff_number} ) ? $opt->{diff_number} : $DEFAULT_VALUE{diff_number} );

    # diff_time, BOOLEAN, with default value
    $self->set_diff_time( exists( $opt->{diff_time} ) ? $opt->{diff_time} : $DEFAULT_VALUE{diff_time} );

    # diff_version, BOOLEAN, with default value
    $self->set_diff_version( exists( $opt->{diff_version} ) ? $opt->{diff_version} : $DEFAULT_VALUE{diff_version} );

    # filter, MULTI
    if ( exists( $opt->{filter} ) ) {
        ref( $opt->{filter} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::_initialize, specified value for option 'filter' must be an 'ARRAY' reference.");
        $self->set_filter( @{ $opt->{filter} } );
    }
    else {
        $self->set_filter();
    }

    # host, SINGLE
    if ( ! exists( $opt->{host} ) ) {
       require Sys::Hostname;
       $opt->{host} = &Sys::Hostname::hostname();
       $opt->{host} =~ s/\..*//;
    }
    $self->set_host( $opt->{host} );

    # scope, SINGLE, with default value
    $self->set_scope( exists( $opt->{scope} ) ? $opt->{scope} : $DEFAULT_VALUE{scope} );

    # system, MULTI
    if ( exists( $opt->{system} ) ) {
        ref( $opt->{system} ) eq 'ARRAY' || throw Error::Simple("ERROR: HH::Unispool::Config::_initialize, specified value for option 'system' must be an 'ARRAY' reference.");
        $self->set_system( @{ $opt->{system} } );
    }
    else {
        $self->set_system();
    }

    # time, SINGLE, with default value
    $self->set_time( exists( $opt->{time} ) ? $opt->{time} : time() );

    # version, SINGLE, with default value
    $self->set_version( exists( $opt->{version} ) ?
                            $opt->{version} : &_mk_default_version() );

    # Return $self
    return($self);
}

sub _mk_default_version {
    # Return 0 if no unispool user on system
    my @pw = getpwnam('unispool');
    scalar(@pw) || return(0);

    # Issue an operator command and try to obtain the version number from its
    # output
    my $cmd = "$pw[7]/bin/operator -1 2>/dev/null < /dev/null";
    use IO::File;
    my $fh = IO::File->new("$cmd |");
    my $line = $fh->getline();
    my ($vers) = $line =~ /UNISPOOL\s*<(\S+)>/;

    # Return the version
    return($vers || 0);
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

sub add_filter {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'filter', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::add_filter, one or more specified value(s) '@_' is/are not allowed.");

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config}{filter}{ $val->get_name() } = $val;
    }
}

sub add_system {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'system', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::add_system, one or more specified value(s) '@_' is/are not allowed.");

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config}{system}{ $val->get_name() } = $val;
    }
}

sub delete_filter {
    my $self = shift;

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config}{filter}{$val} ) || next;
        delete( $self->{HH_Unispool_Config}{filter}{$val} );
        $del ++;
    }
    return($del);
}

sub delete_system {
    my $self = shift;

    # Delete values
    my $del = 0;
    foreach my $val (@_) {
        exists( $self->{HH_Unispool_Config}{system}{$val} ) || next;
        delete( $self->{HH_Unispool_Config}{system}{$val} );
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

        throw Error::Simple("ERROR: HH::Unispool::Config::diff, FROM ($rf) and TO ($rt) reference types differ.");
    }

    # Diff message
    my $diff = '';

    # Diff the versions
    if ( $from->is_diff_version() &&
                                $from->get_version() ne $to->get_version() ) {
        my $vf = $from->get_version();
        my $vt = $to->get_version();
        $diff .= "Versions differ: $vf <-> $vt\n";
    }

    # Diff the dump hosts
    if ( $from->is_diff_host() && $from->get_host() ne $to->get_host() ) {
        my $vf = $from->get_host();
        my $vt = $to->get_host();
        $diff .= "Dump hosts differ: $vf <-> $vt\n";
    }

    # Diff the dump times
    if ( $from->is_diff_time() && $from->get_time() ne $to->get_time() ) {
        my $vf = $from->get_time();
        my $vt = $to->get_time();
        $diff .= "Dump times differ: $vf <-> $vt\n";
    }

    # Diff scopes
    my $scope_diff = $from->get_scope()->diff( $to->get_scope() );
    $diff .= $scope_diff;

    # Stop now the diff if the dump scopes differ
    ($scope_diff) && return($diff);

    # Diff filters
    if ( $from->get_scope()->exists_scope('_Script_') ) {
        foreach my $name ( $from->keys_filter() ) {
            if ( ! $to->exists_filter($name) ) {
                $diff .= "Filter '$name' not in 'TO' configuration.\n";
                next;
            }
            $diff .= ( $from->values_filter($name) )[0]->diff(
                                            ( $to->values_filter($name) )[0]);
        }
        foreach my $name ( $to->keys_filter() ) {
            if ( ! $from->exists_filter($name) ) {
                $diff .= "Filter '$name' not in 'from' configuration.\n";
                next;
            }
        }
    }

    # Diff systems
    if ( $from->get_scope()->exists_scope('_Network_') ||
         $from->get_scope()->exists_scope('_Local_') ||
         $from->get_scope()->exists_scope('System=*') ) {
        foreach my $name ( sort( $from->keys_system() ) ) {
            if ( ! $to->exists_system($name) ) {
                $diff .= "System '$name' not in 'TO' configuration.\n";
                next;
            }

            my $vf = ( $from->values_system($name) )[0];
            my $vt = ( $to->values_system($name) )[0];
            my $rf = ref($vf);
            my $rt = ref($vt);

            if ( $rf ne $rt ) {
                $diff .= "Reference type for system '$name' differ on from ('$rf') and on 'TO' ('$rt') system.\n";
                next;
            }
            $diff .= $vf->diff( $vt );
        }
        foreach my $name ( $to->keys_system() ) {
            if ( ! $from->exists_system($name) ) {
                $diff .= "System '$name' not in 'from' configuration.\n";
                next;
            }
        }
    }

    # Return diff
    return($diff);
}

sub exists_filter {
    my $self = shift;

    # Count occurrences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config}{filter}{$val} );
    }
    return($count);
}

sub exists_system {
    my $self = shift;

    # Count occurrences
    my $count = 0;
    foreach my $val (@_) {
        $count += exists( $self->{HH_Unispool_Config}{system}{$val} );
    }
    return($count);
}

sub get_host {
    my $self = shift;

    return( $self->{HH_Unispool_Config}{host} );
}

sub get_scope {
    my $self = shift;

    return( $self->{HH_Unispool_Config}{scope} );
}

sub get_time {
    my $self = shift;

    return( $self->{HH_Unispool_Config}{time} );
}

sub get_version {
    my $self = shift;

    return( $self->{HH_Unispool_Config}{version} );
}

sub is_diff_host {
    my $self = shift;

    if ( $self->{HH_Unispool_Config}{diff_host} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub is_diff_number {
    my $self = shift;

    if ( $self->{HH_Unispool_Config}{diff_number} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub is_diff_time {
    my $self = shift;

    if ( $self->{HH_Unispool_Config}{diff_time} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub is_diff_version {
    my $self = shift;

    if ( $self->{HH_Unispool_Config}{diff_version} ) {
        return(1);
    }
    else {
        return(0);
    }
}

sub keys_filter {
    my $self = shift;

    # Return all keys
    return( keys( %{ $self->{HH_Unispool_Config}{filter} } ) );
}

sub keys_system {
    my $self = shift;

    # Return all keys
    return( keys( %{ $self->{HH_Unispool_Config}{system} } ) );
}

sub set_diff_host {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config}{diff_host} = 1;
    }
    else {
        $self->{HH_Unispool_Config}{diff_host} = 0;
    }
}

sub set_diff_number {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config}{diff_number} = 1;
    }
    else {
        $self->{HH_Unispool_Config}{diff_number} = 0;
    }
}

sub set_diff_time {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config}{diff_time} = 1;
    }
    else {
        $self->{HH_Unispool_Config}{diff_time} = 0;
    }
}

sub set_diff_version {
    my $self = shift;

    if (shift) {
        $self->{HH_Unispool_Config}{diff_version} = 1;
    }
    else {
        $self->{HH_Unispool_Config}{diff_version} = 0;
    }
}

sub set_filter {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'filter', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::set_filter, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config}{filter} = {};

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config}{filter}{ $val->get_name() } = $val;
    }
}

sub set_host {
    my $self = shift;
    my $val = shift;

    # Value for 'host' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::set_host, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'host', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::set_host, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config}{host} = $val;
}

sub set_scope {
    my $self = shift;
    my $val = shift;

    # Value for 'scope' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::set_scope, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'scope', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::set_scope, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config}{scope} = $val;
}

sub set_system {
    my $self = shift;

    # Check if isas/refs/rxs/values are allowed
    &_value_is_allowed( 'system', @_ ) || throw Error::Simple("ERROR: HH::Unispool::Config::set_system, one or more specified value(s) '@_' is/are not allowed.");

    # Empty list
    $self->{HH_Unispool_Config}{system} = {};

    # Add keys/values
    foreach my $val (@_) {
        $self->{HH_Unispool_Config}{system}{ $val->get_name() } = $val;
    }
}

sub set_time {
    my $self = shift;
    my $val = shift;

    # Value for 'time' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::set_time, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'time', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::set_time, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config}{time} = $val;
}

sub set_version {
    my $self = shift;
    my $val = shift;

    # Value for 'version' is not allowed to be empty
    defined($val) || throw Error::Simple("ERROR: HH::Unispool::Config::set_version, value may not be empty.");

    # Check if isa/ref/rx/value is allowed
    &_value_is_allowed( 'version', $val ) || throw Error::Simple("ERROR: HH::Unispool::Config::set_version, the specified value '$val' is not allowed.");

    # Assignment
    $self->{HH_Unispool_Config}{version} = $val;
}

sub values_filter {
    my $self = shift;

    if ( scalar(@_) ) {
        my @ret = ();
        foreach my $key (@_) {
            exists( $self->{HH_Unispool_Config}{filter}{$key} ) && push( @ret, $self->{HH_Unispool_Config}{filter}{$key} );
        }
        return(@ret);
    }
    else {
        # Return all values
        return( values( %{ $self->{HH_Unispool_Config}{filter} } ) );
    }
}

sub values_system {
    my $self = shift;

    if ( scalar(@_) ) {
        my @ret = ();
        foreach my $key (@_) {
            exists( $self->{HH_Unispool_Config}{system}{$key} ) && push( @ret, $self->{HH_Unispool_Config}{system}{$key} );
        }
        return(@ret);
    }
    else {
        # Return all values
        return( values( %{ $self->{HH_Unispool_Config}{system} } ) );
    }
}

sub write {
    my $self = shift;
    my $file = shift;

    # The file handle
    my $fh;

    # Check if we already have a file handle
    if ( ref($file) ) {
        $file->isa('IO::Handle') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, specified 'FILE' parameter is not an 'IO::Handle' object.");
        $fh = $file;
    } else {
        require IO::File;
        $fh = IO::File->new("> $file");
        defined($fh) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, failed to open file '$file' for writing.");
    }

    # Write a HH::Unispool::Config::File::Token::Comment::Head
    require HH::Unispool::Config::File::Token::Comment::Head;
    my $tok = HH::Unispool::Config::File::Token::Comment::Head->new( {
        host => $self->get_host(),
        version => $self->get_version(),
    } );
    $fh->print( $tok->write_string() );

    # Empty line
    $fh->print("\n");

    # Write a HH::Unispool::Config::File::Token::Comment::Date
    require HH::Unispool::Config::File::Token::Comment::Date;
    $tok = HH::Unispool::Config::File::Token::Comment::Date->new( {
        time => $self->get_time(),
    } );
    $fh->print( $tok->write_string() );

    # Write a HH::Unispool::Config::File::Token::Comment::Scope
    require HH::Unispool::Config::File::Token::Comment::Scope;
    $tok = HH::Unispool::Config::File::Token::Comment::Scope->new( {
        scope => $self->get_scope(),
    } );
    $fh->print( $tok->write_string() );

    # Empty lines
    $fh->print("\n");
    $fh->print("\n");

    # Write configuration server info comment
    if ( $self->get_scope()->exists_scope('_Server_') ) {
        my $cs = undef;
        my %bcs = ();

        # Search the config server and the backup config server(s)
        foreach my $system ( $self->values_system() ) {
            if ( defined( $system->get_type() ) && $system->get_type() eq 'cs' ) {
                if ( defined($cs) ) {
                    my $cs1 = $cs->get_name();
                    my $cs2 = $system->get_name();
                    throw Error::Simple("ERROR: HH::Unispool::Config::write, multiple configuration servers declared like '$cs1' and '$cs2'.");
                }
                $cs = $system;
            }
            elsif ( $system->get_type() eq 'bcs' ) {
                $bcs{ $system->get_name() } = $system;
            }
        }

        # Check if the cs is defined
        if ( ! defined($cs) ) {
            throw Error::Simple("ERROR: HH::Unispool::Config::write, scope '_Server_' set but no configuration server declared.");
        }

        # Check if more than 7 bcs-es are defined
        if ( scalar( keys(%bcs) ) > 7 ) {
            my $bcs = join( '\', \'', sort( keys(%bcs) ) );
            throw Error::Simple("ERROR: HH::Unispool::Config::write, too many backup configuration servers declared '$bcs'.");
        }

        # Write configuration server comment token
        require HH::Unispool::Config::File::Token::Comment::Cs;
        $tok = HH::Unispool::Config::File::Token::Comment::Cs->new( {
            net_desc => '_Network_',
        } );
        $fh->print( $tok->write_string() );

        # Empty line
        $fh->print("\n");

        # Write configuration server token
        require HH::Unispool::Config::File::Token::Unnumbered::Cs;
        $tok = HH::Unispool::Config::File::Token::Unnumbered::Cs->new( {
            hostname => $cs->get_name(),
        } );
        $fh->print( $tok->write_string() );

        # Write backup configuration server token(s)
        foreach my $bcs (sort (keys (%bcs) ) ) {
            require HH::Unispool::Config::File::Token::Unnumbered::Bcs;
            $tok = HH::Unispool::Config::File::Token::Unnumbered::Bcs->new( {
                hostname => $bcs{$bcs}->get_name(),
            } );
            $fh->print( $tok->write_string() );

        }

        # Empty line
        $fh->print("\n");
    }

    # Write filter file info comment
    if ( $self->get_scope()->exists_scope('_Script_') ) {
        # Write filter file info comment token
        require HH::Unispool::Config::File::Token::Comment::Filter;
        $tok = HH::Unispool::Config::File::Token::Comment::Filter->new( {
            net_desc => '_Network_',
        } );
        $fh->print( $tok->write_string() );

        # Empty line
        $fh->print("\n");

        # Write filter entries
        foreach my $name (sort ( $self->keys_filter() ) ) {
            ( $self->values_filter($name) )[0]->write($fh);
        }

        # Empty line
        $fh->print("\n");
    }

    # Empty line
    $fh->print("\n");

    # Check if the _Network_ system is desired and write it
    if ( $self->get_scope()->exists_scope('_Network_') ) {
        $self->exists_system('_Network_') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Network_' defined in scope but no '_Network_' system defined in the configuration.");

        ( $self->values_system('_Network_') )[0]->write($fh);
    }
    else {
        $self->exists_system('_Network_') &&
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Network_' not defined in scope but a '_Network_' system is defined in the configuration.");
    }

    # Check if the _Local_ system is desired and write it
    if ( $self->get_scope()->exists_scope('_Local_') ) {
        $self->exists_system('_Local_') ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Local_' defined in scope but no '_Local_' system defined in the configuration.");

        ( $self->values_system('_Local_') )[0]->write($fh);
    }
    else {
        $self->exists_system('_Local_') &&
            throw Error::Simple("ERROR: HH::Unispool::Config::write, '_Local_' not defined in scope but a '_Local_' system is defined in the configuration.");
    }

    # Write the system entries
    if ( $self->get_scope()->exists_scope('System=*') ) {
        my $count = 0;
        foreach my $name ( sort( $self->keys_system() ) ) {
            # Skip _Network_ and _Local_
            ( $name eq '_Network_' ) && next;
            ( $name eq '_Local_' ) && next;

            # Count one up
            $count ++ ;

            # Write the system
            ( $self->values_system($name) )[0]->write($fh);
        }

        # Check if at least one system was written
        ( $count ) ||
            throw Error::Simple("ERROR: HH::Unispool::Config::write, 'System=*' is defined in scope not a single 'System=*' system is defined in the configuration.");
    }

    # Empty line
    $fh->print("\n");

    # Write a HH::Unispool::Config::File::Token::Comment::Tail
    require HH::Unispool::Config::File::Token::Comment::Tail;
    $tok = HH::Unispool::Config::File::Token::Comment::Tail->new( {
        host => $self->get_host(),
    } );
    $fh->print( $tok->write_string() );
}

sub write_to_unispool {
    my $self = shift;

    # Throw an exception if no unispool user on system
    my @pw = getpwnam('unispool');
    scalar(@pw) ||
        throw Error::Simple("ERROR: HH::Unispool::Config::write_to_unispool, you don't have a 'unisppol' user on this system.");

    # Make a temporary file
    use IO::File;
    use POSIX qw (tmpnam);
    my $fn = '';
    my $fh = undef;
    while (!defined ($fh)) {
        $fn = tmpnam();
        $fh = IO::File->new ($fn, O_RDWR|O_CREAT|O_EXCL);
        $fh->close();
    }

    # Write the configuration to the temporary file
    try {
        $self->write( $fn );
    }
    catch Error::Simple with {
        my $e = shift;
        unlink($fn);
        throw Error::Simple($e->{-text});
    };

    # Issue a utility command and try to load the configuration
    my $cmd = "$pw[7]/bin/utility 'config -load -s $fn' -1 1>/dev/null 2>&1";
    system($cmd);
    my $ex = $?>>8;
    unlink($fn);
    ($ex) &&
        throw Error::Simple("ERROR: HH::Unispool::Config::write_to_unispool, command '$cmd' exited with code '$ex'.");
}

