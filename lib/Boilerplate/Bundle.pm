package Boilerplate::Bundle;

use warnings;
use strict;
use Template;

=head1 NAME

Boilerplate - The great new Boilerplate!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
our %CACHED_DATA;

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

=head2 new

TODO: documention

=cut

sub new {
    my ($proto) = @_;
    my $class = ref($proto) || $proto;
    return bless {}, $class;
}

=head2 extract_data_section

Extract the data section from a module

=cut

sub extract_data_section {
    my ($self) = @_;
    no strict 'refs';
    my $class = ref($self) || $self;
    if(exists $CACHED_DATA{$class}) {
        return $CACHED_DATA{$class};
    }
    my $glob = *{"${class}::DATA"};
    local $/ = undef;
    my $data = <$glob>;
    $data = '' unless defined $data;
    $CACHED_DATA{$class} = $data;
    return $data;
}


=head2 get_data_map

=cut

sub get_data_map {
    my ($self) = @_;
    my $data = $self->extract_data_section;
    my @files = split /^=== *(.+?) *===r?\n/m, $data;
    shift @files;
    my %data = @files;
    return \%data;
}

=head2 output_bundle

TODO: documention

=cut

sub output_bundle {
    my ($self, $vars) = @_;
    my $map = $self->get_data_map;
    my $tt = Template->new;
    while(my ($file_path_template,$template) = each %$map) {
        my $outfile = $self->process_file_path($file_path_template,$vars);
        $tt->process(\$template, $vars, $outfile);
    }
}

=head2 process_file_path

TODO: documention

=cut

sub process_file_path {
    my ($self, $file_path_template, $vars) = @_;
    my $file_path = $file_path_template;
    $file_path =~ s/\$\{([a-zA-Z0-9_]+)\}/$vars->{$1}/g;
    return $file_path;
}

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

1;
