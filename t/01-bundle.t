#!perl

use Test::More tests => 6;

BEGIN {
    use_ok( 'Boilerplate::Bundle' );
}

use FindBin qw($Bin);
use lib $Bin;
use TestData;
use Test::NoWarnings;

my $data = <<'EOS';
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
EOS

is(TestData->extract_data_section,$data,"Extracting the section properly");

my $data_map = {
    'lib/${classname}.pm' => <<'EOS'
package [% classname %];
use strict;
use warnings;

1;
EOS
    ,'t/${classname}.t' => <<'EOS'
use Test::More tests => 2;

BEGIN {
    use_ok( '[% classname %]' );
}
1;
EOS

};

is_deeply(TestData->get_data_map, $data_map,"Get the data map");

is_deeply(TestData->get_default_include_paths, ["$Bin/inc", "$Bin/boilerplate"]);

is(TestData->get_bundle_base_path, $Bin);
