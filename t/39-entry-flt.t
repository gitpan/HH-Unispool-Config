use Test;
BEGIN { plan tests => 2 };

use strict;
use IO::File;
require 't/filediff.pl';

use HH::Unispool::Config::File::Tokenizer;
use HH::Unispool::Config::Entry::Filter;

my $f1 = 't/config.sample.flt'; my $f2 = "$f1.out";
my $tokenizer = HH::Unispool::Config::File::Tokenizer->new( {
    file => IO::File->new("< $f1"),
} );
my $entry = HH::Unispool::Config::Entry::Filter->new_from_tokenizer($tokenizer);
ok( $entry->isa('HH::Unispool::Config::Entry::Filter') );
$entry->write( IO::File->new("> $f2") );
ok( ! &filediff($f1, $f2) );
