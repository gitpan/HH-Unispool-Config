use Test;
BEGIN { plan tests => 2 };

use strict;
use IO::File;
require 't/filediff.pl';

use HH::Unispool::Config::File::Tokenizer;
use HH::Unispool::Config::Entry::System;

my $f1 = 't/config.sample.sys-net'; my $f2 = "$f1.out";
my $tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
my $entry = HH::Unispool::Config::Entry::System->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::System') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );
