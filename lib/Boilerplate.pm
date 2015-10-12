package Boilerplate;

use warnings;
use strict;

use Module::Pluggable search_path => ['Boilerplate::Bundle'], sub_name => '_bundles';

sub bundles {
    map { s/Boilerplate::Bundle:://; $_} _bundles();
}

=head1 NAME

Boilerplate - The great new Boilerplate!

=head1 VERSION

Version 0.10

=cut

our $VERSION = '0.10';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Boilerplate;

    my $foo = Boilerplate->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head1 AUTHOR

James Rouzier, C<< <rouzier at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-boilerplate at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Boilerplate>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Boilerplate


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Boilerplate>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Boilerplate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Boilerplate>

=item * Search CPAN

L<http://search.cpan.org/dist/Boilerplate/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2015 James Rouzier.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Boilerplate
