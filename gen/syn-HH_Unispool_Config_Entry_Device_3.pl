use strict;

use HH::Unispool::Config;
use HH::Unispool::Config::OS;
use HH::Unispool::Config::Scope;
use HH::Unispool::Config::Entry::System;
use HH::Unispool::Config::Entry::Device::3;
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
    name => 'lp1',
    filter_name => 'cat',
    remote_node_name => 'lp1.foo.bar.org',
    description => 'lp1',
} );
$sysn->add_device($dev);

# Add another type 6 device to _Local_
$dev = HH::Unispool::Config::Entry::Device::6->new( {
    name => 'lp2',
    filter_name => 'cat',
    remote_node_name => 'lp2.foo.bar.org',
    description => 'lp2',
} );
$sysn->add_device($dev);

# Add a type 3 device to _Local_
$dev = HH::Unispool::Config::Entry::Device::3->new( {
    name => 'lp',
    filter_name => 'cat',
    member_device_name => [ qw( lp1 lp2 ) ],
    description => 'lp',
} );
$sysn->add_device($dev);

# Write the configuration
$conf->write('t/config.sample.d3.out');
1;
