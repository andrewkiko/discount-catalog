package Magazines::Logic;
use strict;
use warnings FATAL => 'all';
use Magazines::Db;

my $DB = Magazines::Db->new();
#**********************************************************
=head2 new()

=cut
#**********************************************************
sub new {
  my $class = shift;
  my $self = {
    name => "Magazines Logic",
  };
  
  bless $self, $class;
  
  return $self;
}

#**********************************************************
=head2 get_name()

=cut
#**********************************************************
sub get_name {
  my $self = shift;
  
  return $self->{name};
}

#**********************************************************
=head2 magazines_listing()

=cut
#**********************************************************
sub magazines_listing {
  my $self = shift;
  my $list = $DB->get_magazines_list();
  
  return $list;
}
1;