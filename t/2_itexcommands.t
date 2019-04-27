#!/bin/perl -w

use strict;
use warnings;
use Test::More tests => 377;

open(IN, '<', 'itex_test') || die "Cannot open file";
# open(OUT, '>', 'output') || die "Cannot open file";

my $eval_return = eval {
  use LaTeXML;
  use LaTeXML::Common::Config;
  1;
};

ok($eval_return && !$@, 'LaTeXML modules loaded successfully.');

my $config = LaTeXML::Common::Config->new(paths=>['blib/lib/LaTeXML/resources/Profiles','blib/lib/LaTeXML/resources/XSLT','blib/lib/LaTeXML/Package'],profile=>'mwsq');
my $converter = LaTeXML->get_converter($config);

foreach my $line (<IN>){
    chomp($line);
    print $line;
    my $response = $converter->convert("literal:$line");
    is($response->{status_code},0,'Conversion was problem-free.');
    # print OUT $response->{result};
    # print OUT "\n";
}

close(IN);
# close(OUT);
