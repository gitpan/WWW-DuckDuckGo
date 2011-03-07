package WWW::DuckDuckGo::ZeroClickInfo;
BEGIN {
  $WWW::DuckDuckGo::ZeroClickInfo::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $WWW::DuckDuckGo::ZeroClickInfo::VERSION = '0.003';
}
# ABSTRACT: A DuckDuckGo Zero Click Info definition

use Moo;
use WWW::DuckDuckGo::Link;
use URI;

sub by {
	my ( $class, $result ) = @_;
	my @related_topics;
	for (@{$result->{RelatedTopics}}) {
		push @related_topics, $class->_link_class->by($_) if %{$_};
	}
	my @results;
	for (@{$result->{Results}}) {
		push @results, $class->_link_class->by($_) if %{$_};
	}
	my %params;
	$params{abstract} = $result->{Abstract} if $result->{Abstract};
	$params{abstract_text} = $result->{AbstractText} if $result->{AbstractText};
	$params{abstract_source} = $result->{AbstractSource} if $result->{AbstractSource};
	$params{abstract_url} = URI->new($result->{AbstractURL}) if $result->{AbstractURL};
	$params{image} = URI->new($result->{Image}) if $result->{Image};
	$params{heading} = $result->{Heading} if $result->{Heading};
	$params{answer} = $result->{Answer} if $result->{Answer};
	$params{answer_type} = $result->{AnswerType} if $result->{AnswerType};
	$params{definition} = $result->{Definition} if $result->{Definition};
	$params{definition_source} = $result->{DefinitionSource} if $result->{DefinitionSource};
	$params{definition_url} = URI->new($result->{DefinitionURL}) if $result->{DefinitionURL};
	$params{related_topics} = \@related_topics if @related_topics;
	$params{results} = \@results if @results;
	$params{type} = $result->{Type} if $result->{Type};
	__PACKAGE__->new(%params);
}

sub _link_class { 'WWW::DuckDuckGo::Link' }

has abstract => (
	is => 'ro',
	predicate => 'has_abstract',
);

has abstract_text => (
	is => 'ro',
	predicate => 'has_abstract_text',
);

has abstract_source => (
	is => 'ro',
	predicate => 'has_abstract_source',
);

has abstract_url => (
	is => 'ro',
	predicate => 'has_abstract_url',
);

has image => (
	is => 'ro',
	predicate => 'has_image',
);

has heading => (
	is => 'ro',
	predicate => 'has_heading',
);

has answer => (
	is => 'ro',
	predicate => 'has_answer',
);

has answer_type => (
	is => 'ro',
	predicate => 'has_answer_type',
);

has definition => (
	is => 'ro',
	predicate => 'has_definition',
);

has definition_source => (
	is => 'ro',
	predicate => 'has_definition_source',
);

has definition_url => (
	is => 'ro',
	predicate => 'has_definition_url',
);

has related_topics => (
	is => 'ro',
	predicate => 'has_related_topics',
);

has results => (
	is => 'ro',
	predicate => 'has_results',
);

has type => (
	is => 'ro',
	predicate => 'has_type',
);

has type_long_definitions => (
	is => 'ro',
	lazy => 1,
	default => sub {{
		A => 'article',
		D => 'disambiguation',
		C => 'category',
		N => 'name',
		E => 'exclusive',
	}},
);

sub type_long {
	my ( $self ) = @_;
	return if !$self->type;
	$self->type_long_definitions->{$self->type};
}

1;


__END__
=pod

=head1 NAME

WWW::DuckDuckGo::ZeroClickInfo - A DuckDuckGo Zero Click Info definition

=head1 VERSION

version 0.003

=head1 SYNOPSIS

  use WWW::DuckDuckGo;

  my $zci = WWW::DuckDuckGo->new->zci('duck duck go');
  
  print "Heading: ".$zci->heading if $zci->has_heading;
  
  print "The answer is: ".$zci->answer if $zci->has_answer;

=head1 DESCRIPTION

This package reflects the result of a zeroclickinfo API request.

=head1 METHODS

=head2 has_abstract

=head2 abstract

=head2 has_abstract_text

=head2 abstract_text

=head2 has_abstract_source

=head2 abstract_source

=head2 has_abstract_url

=head2 abstract_url

Gives back a URI::http

=head2 has_image

=head2 image

Gives back a URI::http

=head2 has_heading

=head2 heading

=head2 has_answer

=head2 answer

=head2 has_answer_type

=head2 answer_type

=head2 has_definition

=head2 definition

=head2 has_definition_source

=head2 definition_source

=head2 has_definition_url

=head2 definition_url

Gives back a URI::http

=head2 has_related_topics

=head2 related_topics

Gives back an array reference of L<WWW::DuckDuckGo::Link> objects.

=head2 has_results

=head2 results

Gives back an array reference of L<WWW::DuckDuckGo::Link> objects.

=head2 has_type

=head2 type

=head2 type_long

Gives back a longer version of the type.

=encoding utf8

=head1 METHODS

=head1 SUPPORT

IRC

  Join #duckduckgo on irc.freenode.net. Highlight Getty for fast reaction :).

Repository

  http://github.com/Getty/p5-www-duckduckgo
  Pull request and additional contributors are welcome

Issue Tracker

  http://github.com/Getty/p5-www-duckduckgo/issues

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

