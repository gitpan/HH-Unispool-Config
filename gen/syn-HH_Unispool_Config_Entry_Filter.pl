use strict;

use HH::Unispool::Config;
use HH::Unispool::Config::OS;
use HH::Unispool::Config::FilterType;
use HH::Unispool::Config::Entry::Filter;
use HH::Unispool::Config::Entry::System;
use HH::Unispool::Config::Entry::RemoteSystem::8;

# Create a config from scratch
my $conf3 = HH::Unispool::Config->new();

# Create a filter and add it to the configuration
my $flt = HH::Unispool::Config::Entry::Filter->new( {
    name => 'cat',
    file => '/usr/bin/cat',
} );
$conf3->add_filter($flt);

# Create another filter and add it to the configuration
$flt = HH::Unispool::Config::Entry::Filter->new( {
    name => 'lpcat',
    file => '/my/bin/dir/lpcat',
    type => HH::Unispool::Config::FilterType->new( {
        type => 'lp',
    } ),
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

# Create the foo.bar.org system and add it to the configuration
my $sysf = HH::Unispool::Config::Entry::System->new( {
    name => 'foo.bar.org',
    local_system_name => 'foo',
    network_name => 'foo.bar.org',
    os => HH::Unispool::Config::OS->new( { os => 'Solaris' } ),
    type => 'cs',
} );
$conf3->add_system($sysf);

# Write the configuration
$conf3->write('t/config.sample.flt.out');
1;
