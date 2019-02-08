#!/usr/bin/perl
use warnings;
use strict;

BEGIN {
  push @INC, '../../../modules/';
  push @INC, '../../../lib/';
}

use Template;
use Magazines::Webinterface;
use Base;
use Data::Dumper;



our (%FORM, %CONFIG);

%FORM = %{Base::parse_form()};
do "../../../data/config.pl";

# some useful options (see below for full list)
my $template_config = {
  INCLUDE_PATH => '../../../main_templates', # or list ref
  INTERPOLATE  => 1,             # expand "$var" in plain text
  POST_CHOMP   => 1,             # cleanup whitespace
  PRE_PROCESS  => 'admin_header.html', # prefix each template
  POST_PROCESS => 'admin_footer.html', # prefix each template
  EVAL_PERL    => 1,             # evaluate Perl code blocks
};

# create Template object
my $template = Template->new($template_config);

my $cookie = Base::get_cookie();

if($cookie->{sid}){

}
elsif(($FORM{login} && $FORM{login} eq 'q') &&  ($FORM{password} && $FORM{password} eq 'q')){
  Base::set_cookie({sid => 'sid'});
}
else{
  print "Content-type: text/html\n\n";
  
  $template->process('login.html', {});
  exit;
}

print "Content-type: text/html\n\n";


my %TEMPLATE_ARGS = ();
if($FORM{test} == 1){
  my $magazines_web = Magazines::Webinterface::magazines_web({%FORM});
  $TEMPLATE_ARGS{MAGAZINES_WEB} = $magazines_web;
  $TEMPLATE_ARGS{ACTIVE_1} = 'active';
}
elsif($FORM{test} == 2){
  my $chat = '';
  $template->process('chat.html', { SPEAKER => 'user'}, \$chat);
  $TEMPLATE_ARGS{CHAT} = $chat;
  $TEMPLATE_ARGS{ACTIVE_2} = 'active';
}

$template->process('dashboard.html', {
  %TEMPLATE_ARGS
  });

exit;