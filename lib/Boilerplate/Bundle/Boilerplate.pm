package Boilerplate::Bundle::Boilerplate;

=head1 NAME

Boilerplate::Bundle::Boilerplate - The boilerplate for creating boilerplate

=head1 DESCRIPTION

Boilerplate::Bundle::Boilerplate

=head1 SYNOPSIS

=cut

use strict;
use warnings;
use base qw(Boilerplate::Bundle);

=head1 AUTHOR

James Rouzier, C<< <rouzier at gmail.com> >>

=head1 COPYRIGHT

Copyright (C) 2015 James Rouzier

=head1 LICENSE

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA.

=cut

1;
__DATA__
=== lib/${classpath}.pm ===
package [% fullclassname %];
use strict;
use warnings;
use base qw(Boilerplate::Bundle);

1;
__DATA__
[%%]=== lib/${classpath}.pm ===
package ${fullclassname}

=head1 NAME

${fullclassname} -

=cut

=head1 DESCRIPTION

Boilerplate::Bundle::Boilerplate

=cut

use strict;
use warnings;
