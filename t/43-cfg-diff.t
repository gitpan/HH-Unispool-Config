use Test;
BEGIN { plan tests => 3 };

use strict;
use IO::File;
require 't/filediff.pl';

use HH::Unispool::Config;

my $f1 = 't/config.sample';
use IO::File;
use HH::Unispool::Config::File::Tokenizer;
my $conf1 = HH::Unispool::Config->new_from_file($f1);
my $conf2 = HH::Unispool::Config->new_from_file($f1);
ok( $conf1->isa('HH::Unispool::Config') );
ok( $conf2->isa('HH::Unispool::Config') );
ok(! $conf1->diff($conf2) );
