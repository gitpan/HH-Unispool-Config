use Test;
BEGIN { plan tests => 16 };

use strict;
use IO::File;
require 't/filediff.pl';

use HH::Unispool::Config::File::Tokenizer;
use HH::Unispool::Config::Entry::Device::0;
use HH::Unispool::Config::Entry::Device::1;
use HH::Unispool::Config::Entry::Device::2;
use HH::Unispool::Config::Entry::Device::3;
use HH::Unispool::Config::Entry::Device::4;
use HH::Unispool::Config::Entry::Device::5;
use HH::Unispool::Config::Entry::Device::6;
use HH::Unispool::Config::Entry::Device::7;

my $f1 = 't/config.sample.dev0'; my $f2 = "$f1.out";
my $tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
my $entry = HH::Unispool::Config::Entry::Device::0->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::0') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev1'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::1->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::1') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev2'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::2->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::2') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev3'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::3->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::3') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev4'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::4->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::4') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev5'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::5->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::5') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev6'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::6->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::6') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );


$f1 = 't/config.sample.dev7'; $f2 = "$f1.out";
$tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
$entry = HH::Unispool::Config::Entry::Device::7->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Device::7') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );
