use strict;

use HH::Unispool::Config;
use HH::Unispool::Config::OS;
use HH::Unispool::Config::Scope;
use HH::Unispool::Config::Entry::System;
use HH::Unispool::Config::Entry::Device::4;
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
    name => 'lp',
    filter_name => 'cat',
    remote_node_name => 'lp.foo.bar.org',
    description => 'lp',
} );
$sysn->add_device($dev);

# Add a type 4 device to _Local_
$dev = HH::Unispool::Config::Entry::Device::4->new( {
    name => 'lp-pipe',
    filter_name => 'cat',
    trailer_name => 'PIPE_PROC',
    destination_device => 'lp',
    description => 'lp-pipe',
} );
$sysn->add_device($dev);

# Write the configuration
$conf->write('t/config.sample.d4.out');
1;
