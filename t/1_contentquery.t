use strict;
use warnings;

use Test::More tests => 3;

my $eval_return = eval {
  use LaTeXML;
  use LaTeXML::Common::Config;
  1;
};

ok($eval_return && !$@, 'LaTeXML modules loaded successfully.');

# Fermat's theorem
my $tex_input = '?a^?n + ?b^?n=?c^?n';
my $config = LaTeXML::Common::Config->new(paths=>['blib/lib/LaTeXML/resources/Profiles','blib/lib/LaTeXML/resources/XSLT','blib/lib/LaTeXML/Package'],profile=>'mwsquery');
my $converter = LaTeXML->get_converter($config);

my $response = $converter->convert("literal:$tex_input");

my $content_query = <<'EOQ';
<?xml version="1.0"?>
<mws:query xmlns:mws="http://search.mathweb.org/ns" xmlns:m="http://www.w3.org/1998/Math/MathML" limitmin="0" answsize="30">
  <mws:expr>
    <m:apply xml:id="p1.1.m1.1.9.cmml" xref="p1.1.m1.1.9">
      <m:eq xml:id="p1.1.m1.1.6.cmml" xref="p1.1.m1.1.6"/>
      <m:apply xml:id="p1.1.m1.1.9.1.cmml" xref="p1.1.m1.1.9.1">
        <m:plus xml:id="p1.1.m1.1.3.cmml" xref="p1.1.m1.1.3"/>
        <m:apply xml:id="p1.1.m1.1.9.1.1.cmml" xref="p1.1.m1.1.9.1.1">
          <m:csymbol cd="ambiguous" xml:id="p1.1.m1.1.9.1.1.1.cmml" xref="p1.1.m1.1.9.1.1">superscript</m:csymbol>
          <mws:qvar>a</mws:qvar>
          <mws:qvar>n</mws:qvar>
        </m:apply>
        <m:apply xml:id="p1.1.m1.1.9.1.2.cmml" xref="p1.1.m1.1.9.1.2">
          <m:csymbol cd="ambiguous" xml:id="p1.1.m1.1.9.1.2.1.cmml" xref="p1.1.m1.1.9.1.2">superscript</m:csymbol>
          <mws:qvar>b</mws:qvar>
          <mws:qvar>n</mws:qvar>
        </m:apply>
      </m:apply>
      <m:apply xml:id="p1.1.m1.1.9.2.cmml" xref="p1.1.m1.1.9.2">
        <m:csymbol cd="ambiguous" xml:id="p1.1.m1.1.9.2.1.cmml" xref="p1.1.m1.1.9.2">superscript</m:csymbol>
        <mws:qvar>c</mws:qvar>
        <mws:qvar>n</mws:qvar>
      </m:apply>
    </m:apply>
  </mws:expr>
</mws:query>
EOQ


is($response->{status_code},0,'Conversion was problem-free.');
is($response->{result},$content_query,'Content query successfully generated');
