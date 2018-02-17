#!/usr/bin/env perl
#===============================================================================
#
#         FILE: find_files_in_lib.pl
#
#        USAGE: ./find_files_in_lib.pl
#
#  DESCRIPTION:
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (),
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 09/04/16 11:30:44 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use lib qw(t);
require Boilerplate::Bundle::Test;

print _findBasePathFromClass("Boilerplate::Bundle::Test"),"\n";

sub _findBasePathFromClass {
    my ($class) = @_;
    $class =~ s#::#/#g;
    $class .= '.pm';
    if (exists $INC{$class}) {
        my $path = $INC{$class};
        $path =~ s/.pm$//;
        return $path;
    }
    return;
}
