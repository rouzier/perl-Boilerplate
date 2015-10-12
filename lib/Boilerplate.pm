package Boilerplate;

use warnings;
use strict;

use Module::Pluggable
  search_path => ['Boilerplate::Bundle'],
  sub_name    => '_bundles';

sub list_bundles {
    my ($class) = @_;
    print join( "\n", $class->bundles(), "" );
    return 0;
}

sub create_bundle_from_files {
    my ( $class, $name, @files ) = @_;
    my $bundle_header =<<"EOS";
package Boilerplate::Bundle::$name;

=head1 NAME

Boilerplate::Bundle::$name - The boilerplate for $name

=head1 DESCRIPTION

Boilerplate::Bundle::$name

=head1 SYNOPSIS

=cut

use strict;
use warnings;
use base qw(Boilerplate::Bundle);

1;
__DATA__
EOS
    my $content = $bundle_header;
    for my $file (@files) {
        $content .= "=== $file ===\n";
        my $file_content = slurp_file($file);
        unless (defined $file_content) {
            print STDERR "error reading from file '$file'\n";
            return 1;
        }
        $content .= $file_content;
    }
    print $content;
    return 0;
}

sub create_boilerplate {
    my ( $class, $bundle_name, @options ) = @_;
    my $bundle_module = $bundle_name;
    unless ( $bundle_module =~ s/^\+// ) {
        $bundle_module = "Boilerplate::Bundle::$bundle_module";
    }
    eval { load($bundle_module); };

    if ($@) {
        print STDERR "Cannot load the bundle $bundle_name\n";
        return 1;
    }
    my $bundle = $bundle_module->new(@options);
    $bundle_module->output_bundle();
    return 0;
}

sub bundles {
    map { s/Boilerplate::Bundle:://; $_ } _bundles();
}

sub slurp_file {
    my ($file) = @_;
    local $/ = undef;
    open(my $fh, "<$file") or return undef;
    my $content = <$fh>;
    close($fh);
    return $content;
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

1;    # End of Boilerplate
