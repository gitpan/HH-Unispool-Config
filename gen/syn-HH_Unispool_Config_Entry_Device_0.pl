# Information on device type 0 is obtained through an informal document.
# I guess this device type is out of fashion...

use strict;

use HH::Unispool::Config;
use HH::Unispool::Config::OS;
use HH::Unispool::Config::Scope;
use HH::Unispool::Config::Entry::System;
use HH::Unispool::Config::Entry::Device::0;

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

# Add a type 0 device to _Local_
my $dev = HH::Unispool::Config::Entry::Device::0->new( {
    name => 'lp',
    filter_name => 'cat',
    device_file => '/dev/lp0',
} );
$sysn->add_device($dev);

# Write the configuration
$conf->write('t/config.sample.d0.out');
1;
