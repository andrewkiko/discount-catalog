package Magazines::Webinterface;

use strict;
use warnings FATAL => 'all';
use Magazines::Logic;

my $LOGIC = Magazines::Logic->new();

#**********************************************************
=head2 magazines_test()
  
=cut
#**********************************************************
sub magazines_list {
  my $magazines_card = '';
  my $list = $LOGIC->magazines_listing();
  my $i = 0;
  foreach my $magazine (@$list) {
    if ($i % 4 == 0) {
      $magazines_card .= "</div>" if ($i != 0);
      $magazines_card .= "<div class='row my-4'>";
    }

    $magazines_card .= qq{
    <div class="card">
        <div class="card-header">
          Featured
        </div>
        <!-- Изображение -->
        <!-- Текстовый контент -->
        <div class="card-body bg-info ">
        <img class="card-img-top" src="https://s3.amazonaws.com/heroku-www-files/customers/logos/thumb/zenrez.png" alt="...">
        </div>
    </div><!-- Конец карточки -->
};
    $i++;
  }
  $magazines_card .= "</div>";
  return $magazines_card
}

#**********************************************************
=head2 magazines_web()

  Arguments:
     -
    
  Returns:
  
=cut
#**********************************************************
sub magazines_web {
  return "Hello world";
}

1;

#<h5 class="card-title">$magazine->{name}</h5>
#          <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
#  <p class="card-text">$magazine->{description}</p>
#          <a href="?magazine=$magazine->{id}" class="btn btn-primary">Перейти</a>