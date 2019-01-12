package Magazines::Db;
use strict;
use warnings FATAL => 'all';

#**********************************************************
=head2 new()

=cut
#**********************************************************
sub new {
  my $class = shift;
  my $self = {
    name => "Magazines DB",
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

1;