use Test;
BEGIN { plan tests => 2 };

use strict;
use IO::File;
require 't/filediff.pl';

use HH::Unispool::Config;

my $f1 = 't/config.sample'; my $f2 = "$f1.out";
my $conf = HH::Unispool::Config->new_from_file($f1);
ok( $conf->isa('HH::Unispool::Config') );
$conf->write($f2);
ok( ! &filediff($f1, $f2) );
