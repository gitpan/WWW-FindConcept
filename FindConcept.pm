# $Id: FindConcept.pm,v 1.5 2004/01/05 16:59:20 cvspub Exp $
package WWW::FindConcept;

use strict;

use WWW::FindConcept::Sources;
use WWW::Mechanize;
use Data::Dumper;
use Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(find_concept);

our $VERSION = '0.01';

sub extract {
    my ($pattern, $text, $concept) = @_;
#    print $pattern.$/;
    while($text =~ /$pattern/g){
	$concept->{$1} = 1;
    }
}

sub get_concept {
    die unless caller eq __PACKAGE__;
    my ($url, $template) = @{shift()};
    my ($query) = shift;
    my ($concept) = shift;
    $url =~ s/\Q{%query%}\E/$query/o;

    my $a = WWW::Mechanize->new(
				env_proxy => 1,
				timeout => 10,
				);
    $a->agent_alias( 'Windows IE 6' );
    $a->get( $url );
    if($a->success){
	extract($template, $a->content, $concept);
    }
}

sub find_concept {
    my $query = shift;
    my %concept;

    foreach my $src ( keys %WWW::FindConcept::Sources::source ){
#	next if $WWW::FindConcept::Sources::source{$src}->[-1] eq 'to_skip';
	get_concept($WWW::FindConcept::Sources::source{$src}, $query, \%concept);
    }

    keys %concept;
}

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

WWW::FindConcept - Finding terms of related concepts

=head1 SYNOPSIS

  use WWW::FindConcept;

  find_concept('Perl');

=head1 DESCRIPTION

This module is aimed at retrieving terms of related concepts from various search engines. Function I<find_concept> is auto-exported and it returns a list of the related terms. The module can be used to expand the vocabulary when doing searching on web or other conceivable things.

A command-line script L<bin/find-concept.pl> is also distributed with the module.

=head1 COPYRIGHT

xern E<lt>xern@cpan.orgE<gt>

This module is free software; you can redistribute it or modify it under the same terms as Perl itself.

=cut
