#!/usr/bin/env perl
#===============================================================================
#
#         FILE: x.pl
#
#        USAGE: ./x.pl
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
#      CREATED: 10/04/16 06:10:27 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use c;

use Data::Dumper;

my $c= c->new;

print Dumper($c->a),"\n";
