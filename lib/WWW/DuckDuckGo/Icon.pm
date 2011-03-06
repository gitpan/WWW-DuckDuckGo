package WWW::DuckDuckGo::Icon;
BEGIN {
  $WWW::DuckDuckGo::Icon::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $WWW::DuckDuckGo::Icon::VERSION = '0.001';
}
# ABSTRACT: A DuckDuckGo Icon definition

use Moo;
use URI;

sub by {
	my ( $class, $icon_result ) = @_;
	my %params;
	$params{url} = URI->new($icon_result->{URL}) if $icon_result->{URL};
	$params{height} = $icon_result->{Height} if $icon_result->{Height};
	$params{width} = $icon_result->{Width} if $icon_result->{Width};
	__PACKAGE__->new(%params);
}

has url => (
	is => 'ro',
	predicate => 'has_url',
);

has width => (
	is => 'ro',
	predicate => 'has_width',
);

has height => (
	is => 'ro',
	predicate => 'has_height',
);

1;
__END__
=pod

=head1 NAME

WWW::DuckDuckGo::Icon - A DuckDuckGo Icon definition

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

