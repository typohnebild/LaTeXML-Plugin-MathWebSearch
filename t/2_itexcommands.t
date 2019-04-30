use strict;
use warnings;
use utf8;

use Test::More tests => 337;

my $testfile="t/itex_test";

open(IN, '<', $testfile) || die "Cannot open $testfile";
# open(OUT, '>:utf8', 't/itex_test.xml') || die "Cannot open file";
# print OUT "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
# print OUT "<root>\n";

my $eval_return = eval {
  use LaTeXML;
  use LaTeXML::Common::Config;
  1;
};

ok($eval_return && !$@, 'LaTeXML modules loaded successfully.');

my $config = LaTeXML::Common::Config->new(paths=>['blib/lib/LaTeXML/resources/Profiles','blib/lib/LaTeXML/resources/XSLT','blib/lib/LaTeXML/Package'],profile=>'mwsq');
my $converter = LaTeXML->get_converter($config);

my $i = 0;
foreach my $line (<IN>){
    chomp($line);
    my $response = $converter->convert("literal:$line");
    is($response->{status_code},0,'Conversion was problem-free.');
    # print OUT $response->{result};
    # print OUT "\n";
}

close(IN);
# print OUT "</root>";
# close(OUT);
