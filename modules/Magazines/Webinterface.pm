package Magazines::Webinterface;

use strict;
use warnings FATAL => 'all';
use Magazines::Logic;

my $LOGIC = Magazines::Logic->new();

#**********************************************************
=head2 magazines_test()
  
=cut
#**********************************************************
sub magazines_test {
  return $LOGIC->get_name();;
}
1;