package Magazines::Db;
use strict;
use warnings FATAL => 'all';

use DBI;

my $dsn = 'DBI:mysql:discount_catalog:localhost';
my $db_user_name = 'dc';
my $db_password = 'dc';
my $dbh = DBI->connect($dsn, $db_user_name, $db_password);

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

#**********************************************************
=head2 get_magazines_list()

=cut
#**********************************************************
sub get_magazines_list {
  my $self = shift;
  my @list = ();
  my $sth = $dbh->prepare(qq{select id, name, description from test });
  $sth->execute();
  my $i = 0;
  while (my ($id, $name, $description) = $sth->fetchrow_array())  # делать выборку данных
  # пока ничего не останется
  {
    push @list, {id => $id, name => $name, description => $description};
  }
  $sth->finish();
  return \@list;
}

1;