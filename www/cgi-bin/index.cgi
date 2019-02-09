#!/usr/bin/perl
use warnings;
use strict;

BEGIN {
  push @INC, '../../modules/';
  push @INC, '../../lib/';
}

use Template;
use Magazines::Webinterface;
use Base;
use Data::Dumper;

print "Content-type: text/html\n\n";

our (%FORM, %CONFIG);

%FORM = Base::parse_form();
do "../../data/config.pl";

# some useful options (see below for full list)
my $template_config = {
  INCLUDE_PATH => '../../main_templates', # or list ref
  INTERPOLATE  => 1,             # expand "$var" in plain text
  POST_CHOMP   => 1,             # cleanup whitespace
  PRE_PROCESS  => 'header.html', # prefix each template
  POST_PROCESS => 'footer.html', # prefix each template
  EVAL_PERL    => 1,             # evaluate Perl code blocks
};

# create Template object
my $template = Template->new($template_config);

my $magazines_ = Magazines::Webinterface::magazines_list({%FORM});

my $chat = '';
my $template_chat = Template->new({
    INCLUDE_PATH => '../../main_templates', # or list ref
    INTERPOLATE  => 1,             # expand "$var" in plain text
     });
    $template_chat->process('chat.html', { SPEAKER => 'admin', CHAT_IP => $CONFIG{CHAT_IP}}, \$chat);


$template->process('main.html', {
    MAGAZINES_CARDS => $magazines_,
    CHAT => $chat,
});
