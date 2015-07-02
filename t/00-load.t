#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Boilerplate' ) || print "Bail out!
";
}

diag( "Testing Boilerplate $Boilerplate::VERSION, Perl $], $^X" );
