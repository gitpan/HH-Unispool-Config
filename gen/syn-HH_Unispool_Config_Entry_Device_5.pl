use strict;

use HH::Unispool::Config;
use HH::Unispool::Config::OS;
use HH::Unispool::Config::Entry::Filter;
use HH::Unispool::Config::Entry::System;
use HH::Unispool::Config::Entry::Device::5;
use HH::Unispool::Config::Entry::Device::6;
use HH::Unispool::Config::Entry::RemoteSystem::8;

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
$conf3->write('t/config.sample.d5.out');
1;
