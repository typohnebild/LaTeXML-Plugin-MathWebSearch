use strict;
use warnings;

use Test::More tests => 3;

my $eval_return = eval {
  use LaTeXML;
  use LaTeXML::Converter;
  use LaTeXML::Util::Config;
  1;
};

ok($eval_return && !$@, 'LaTeXML modules loaded successfully.');

# Fermat's theorem
my $tex_input = '?a^?n + ?b^?n=?c^?n';
my $config = LaTeXML::Util::Config->new(profile=>'mwsquery');
my $converter = LaTeXML::Converter->get_converter($config);

my $response = $converter->convert("literal:".$tex_input);

my $content_query = <<'EOQ';
<?xml version="1.0"?>
<mws:query xmlns:mws="http://search.mathweb.org/ns" xmlns:m="http://www.w3.org/1998/Math/MathML" limitmin="0" answsize="30">
  <mws:expr>
    <m:apply xml:id="p1.1.m1.1.9.cmml" xref="p1.1.m1.1.9">
      <m:eq xml:id="p1.1.m1.1.6.cmml" xref="p1.1.m1.1.6"/>
      <m:apply xml:id="p1.1.m1.1.9.1.cmml" xref="p1.1.m1.1.9.1">
        <m:plus xml:id="p1.1.m1.1.3.cmml" xref="p1.1.m1.1.3"/>
        <m:apply xml:id="p1.1.m1.1.9.1.1.cmml" xref="p1.1.m1.1.9.1.1">
          <m:csymbol cd="ambiguous" xml:id="p1.1.m1.1.9.1.1.1.cmml">superscript</m:csymbol>
          <m:csymbol cd="latexml" xml:id="p1.1.m1.1.1.cmml" xref="p1.1.m1.1.1">qvar</m:csymbol>
          <m:csymbol cd="latexml" xml:id="p1.1.m1.1.2.1.cmml" xref="p1.1.m1.1.2.1">qvar</m:csymbol>
        </m:apply>
        <m:apply xml:id="p1.1.m1.1.9.1.2.cmml" xref="p1.1.m1.1.9.1.2">
          <m:csymbol cd="ambiguous" xml:id="p1.1.m1.1.9.1.2.1.cmml">superscript</m:csymbol>
          <m:csymbol cd="latexml" xml:id="p1.1.m1.1.4.cmml" xref="p1.1.m1.1.4">qvar</m:csymbol>
          <m:csymbol cd="latexml" xml:id="p1.1.m1.1.5.1.cmml" xref="p1.1.m1.1.5.1">qvar</m:csymbol>
        </m:apply>
      </m:apply>
      <m:apply xml:id="p1.1.m1.1.9.2.cmml" xref="p1.1.m1.1.9.2">
        <m:csymbol cd="ambiguous" xml:id="p1.1.m1.1.9.2.1.cmml">superscript</m:csymbol>
        <m:csymbol cd="latexml" xml:id="p1.1.m1.1.7.cmml" xref="p1.1.m1.1.7">qvar</m:csymbol>
        <m:csymbol cd="latexml" xml:id="p1.1.m1.1.8.1.cmml" xref="p1.1.m1.1.8.1">qvar</m:csymbol>
      </m:apply>
    </m:apply>
  </mws:expr>
</mws:query>
EOQ

is($response->{status_code},0,'Conversion was problem-free.');
is($response->{result},$content_query,'Content query successfully generated');

