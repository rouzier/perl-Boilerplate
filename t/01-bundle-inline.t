#!perl

use Test::More tests => 6;

BEGIN {
    use_ok( 'Boilerplate::BundleInline' );
}

use FindBin qw($Bin);
use lib $Bin;
use TestDataInline;
use Test::NoWarnings;

my $data = <<'EOS';
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
EOS

is(TestDataInline->extract_data_section,$data,"Extracting the section properly");

my $data_map = {
    'lib/__classname__.pm' => <<'EOS'
package [% classname %];
use strict;
use warnings;

1;
EOS
    ,'t/__classname__.t' => <<'EOS'
use Test::More tests => 2;

BEGIN {
    use_ok( '[% classname %]' );
}
1;
EOS

};

is_deeply(TestDataInline->get_data_map, $data_map,"Get the data map");

is_deeply(TestDataInline->get_default_include_paths, ["$Bin/inc", "$Bin/boilerplate"]);

is(TestDataInline->get_bundle_base_path, $Bin);
