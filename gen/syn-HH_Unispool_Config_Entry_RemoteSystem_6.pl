use strict;

use HH::Unispool::Config;
use HH::Unispool::Config::OS;
use HH::Unispool::Config::Scope;
use HH::Unispool::Config::Entry::System;
use HH::Unispool::Config::Entry::RemoteSystem::6;

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

# Add a type 6 remote system to _Local_
my $dev = HH::Unispool::Config::Entry::RemoteSystem::6->new( {
    name => 'rsys6',
    remote_node_name => 'barney.bedrock.org',
    os => HH::Unispool::Config::OS->new( {
        os => 'Solaris',
    } ),
} );
$sysn->add_remote_system($dev);

# Write the configuration
$conf->write('t/config.sample.r6.out');
1;
