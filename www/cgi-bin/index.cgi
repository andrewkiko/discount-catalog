#!/usr/bin/perl
use warnings;
use strict;

print "Content-type: text/html\n\n";
use Template;

# some useful options (see below for full list)
my $config = {
  INCLUDE_PATH => '/usr/discount_catalog/main_templates', # or list ref
  INTERPOLATE  => 1,             # expand "$var" in plain text
  POST_CHOMP   => 1,             # cleanup whitespace
  PRE_PROCESS  => 'header.html', # prefix each template
  POST_PROCESS => 'footer.html', # prefix each template
  EVAL_PERL    => 1,             # evaluate Perl code blocks
};

# create Template object
my $template = Template->new($config);


$template->process('main.html',);