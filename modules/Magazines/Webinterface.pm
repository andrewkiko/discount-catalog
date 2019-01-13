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
  foreach my $magazine (@$list) {
    $magazines_card .=
      qq{
<div class="card mx-auto mb-2 " style="max-width: 250px;">
                <!-- Изображение -->
                <img class="card-img-top" src="https://s3.amazonaws.com/heroku-www-files/customers/logos/thumb/zenrez.png" alt="...">
                <!-- Текстовый контент -->
                <div class="card-body">
                   <h5 class="card-title">$magazine->{name}</h5>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text">$magazine->{description}</p>
                    <a href="?magazine=$magazine->{id}" class="btn btn-primary">Перейти</a>
                </div>
            </div><!-- Конец карточки -->
};
  }
  return $magazines_card
}
1;