use Test;
BEGIN { plan tests => 1 };

use strict;
use Error qw (:try);
foreach my $syn ( <gen/syn*.pl> ) {
    require $syn;
}
ok(1);
