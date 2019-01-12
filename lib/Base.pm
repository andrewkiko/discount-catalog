package Base;
use strict;
use warnings FATAL => 'all';
our (%FORM);
#**********************************************************
=head2 parse_form()

=cut
#**********************************************************
sub parse_form {
  if ( $ENV{'QUERY_STRING'} ) {
    my @form_pairs = split("\&", $ENV{'QUERY_STRING'});
    foreach my $pair (@form_pairs){
      my ($key, $value) = split('=', $pair);
      $FORM{$key} = $value;
    }
    return %FORM;
  }
}

1;