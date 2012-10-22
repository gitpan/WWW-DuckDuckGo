package WWW::DDG;
BEGIN {
  $WWW::DDG::AUTHORITY = 'cpan:GETTY';
}
{
  $WWW::DDG::VERSION = '0.014';
}
# ABSTRACT: Short alias for L<WWW::DuckDuckGo>

use Moo;

extends 'WWW::DuckDuckGo';

1;

__END__

=pod

=head1 NAME

WWW::DDG - Short alias for L<WWW::DuckDuckGo>

=head1 VERSION

version 0.014

=head1 AUTHORS

=over 4

=item *

Torsten Raudssus <torsten@raudssus.de>

=item *

Michael Smith <crazedpsyc@duckduckgo.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by L<Raudssus Social Software|http://www.raudssus.de/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
