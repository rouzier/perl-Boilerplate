package TestDataInline;
use base qw(Boilerplate::BundleInline);

1;
__DATA__
=== lib/__classname__.pm ===
package [% classname %];
use strict;
use warnings;

1;
=== t/__classname__.t ===
use Test::More tests => 2;

BEGIN {
    use_ok( '[% classname %]' );
}
1;
