package Base;
use strict;
use warnings FATAL => 'all';
our (%FORM);

#**********************************************************
=head2 parse_form()

=cut
#**********************************************************
sub parse_form {
  
  my $buffer = '';
  $ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
  if ($ENV{'REQUEST_METHOD'} eq "POST") {
    read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    my @pairs = split(/&/, $buffer);
    foreach my $pair (@pairs) {
      my ($name, $value) = split(/=/, $pair);
      $value =~ tr/+/ /;
      $value =~ s/%(..)/pack("C", hex($1))/eg;
      $FORM{$name} = $value;
    }
    return \%FORM;
  }
  else{
    my @form_pairs = split("\&", $ENV{'QUERY_STRING'});
    foreach my $pair (@form_pairs){
      my ($key, $value) = split('=', $pair);
      $FORM{$key} = $value;
    }
    return \%FORM;
  }
}


#**********************************************************
=head2 get_cookie()

  Arguments:
     -
    
  Returns:
  
=cut
#**********************************************************
sub get_cookie {
  return () unless ( $ENV{'HTTP_COOKIE'} );
  
  my $cookie_data=$ENV{'HTTP_COOKIE'};
  
  my @cookies = split ('; ',$cookie_data);
  my %COOKIE = ();
  foreach my $item (@cookies){
    my ($item_key,$item_val)=split('=', $item);
    $COOKIE{$item_key}=$item_val;
  };
  return \%COOKIE;
}

#**********************************************************
=head2 set_cookie()

  Arguments:
     -
    
  Returns:
  
=cut
#**********************************************************
sub set_cookie {
  my ($attr) = @_;
  print "Set-Cookie: sid=$attr->{sid}; path=admin/;\n";
}
1;