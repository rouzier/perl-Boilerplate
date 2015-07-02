use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Boilerplate',
    AUTHOR              => q{James Rouzier <rouzier@gmail.com>},
    VERSION_FROM        => 'lib/Boilerplate.pm',
    ABSTRACT_FROM       => 'lib/Boilerplate.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Boilerplate-*' },
);
