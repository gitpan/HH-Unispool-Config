use Test;
BEGIN { plan tests => 8 };

use strict;
use IO::File;
require 't/filediff.pl';

use HH::Unispool::Config::File::Tokenizer;
use HH::Unispool::Config::Entry::RemoteSystem::3;
use HH::Unispool::Config::Entry::RemoteSystem::6;
use HH::Unispool::Config::Entry::RemoteSystem::7;
use HH::Unispool::Config::Entry::RemoteSystem::8;


my $f1 = 't/config.sample.rsys3'; my $f2 = "$f1.out";
my $tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
my $entry = HH::Unispool::Config::Entry::RemoteSystem::3->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::RemoteSystem::3') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.rsys6'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::RemoteSystem::6->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::RemoteSystem::6') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.rsys7'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::RemoteSystem::7->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::RemoteSystem::7') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.rsys8'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::RemoteSystem::8->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::RemoteSystem::8') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );
