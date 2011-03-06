package WWW::DuckDuckGo::Link;
BEGIN {
  $WWW::DuckDuckGo::Link::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $WWW::DuckDuckGo::Link::VERSION = '0.001';
}
# ABSTRACT: A DuckDuckGo Link definition

use Moo;
use WWW::DuckDuckGo::Icon;
use URI;

sub by {
	my ( $class, $link_result ) = @_;
	my %params;
	$params{result} = $link_result->{Result} if $link_result->{Result};
	$params{first_url} = URI->new($link_result->{FirstURL}) if $link_result->{FirstURL};
	$params{icon} = $class->_icon_class->by($link_result->{Icon}) if %{$link_result->{Icon}};
	$params{text} = $link_result->{Text} if $link_result->{Text};
	__PACKAGE__->new(%params);
}

sub _icon_class { 'WWW::DuckDuckGo::Icon' }

has result => (
	is => 'ro',
	predicate => 'has_result',
);

has first_url => (
	is => 'ro',
	predicate => 'has_first_url',
);

has icon => (
	is => 'ro',
	predicate => 'has_icon',
);

has text => (
	is => 'ro',
	predicate => 'has_text',
);

1;
__END__
=pod

=head1 NAME

WWW::DuckDuckGo::Link - A DuckDuckGo Link definition

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

