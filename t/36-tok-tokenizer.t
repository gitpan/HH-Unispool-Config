use Test;
BEGIN { plan tests => 1 };

use HH::Unispool::Config::File::Tokenizer;

use IO::File;
my $fh = IO::File->new("< t/config.sample");
my $tokenizer = HH::Unispool::Config::File::Tokenizer->new( {file => $fh} );
while (my $tok = $tokenizer->get() ) {
}
ok(1);
