package TestData;
use base qw(Boilerplate::Bundle);

1;
__DATA__
=== lib/${classname}.pm ===
package [% classname %];
use strict;
use warnings;

1;
=== t/${classname}.t ===
use Test::More tests => 2;

BEGIN {
    use_ok( '[% classname %]' );
}
1;
