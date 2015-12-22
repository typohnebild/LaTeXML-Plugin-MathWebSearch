use strict;
use warnings;

use Test::More tests => 3;

my $eval_return = eval {
  use LaTeXML;
  use LaTeXML::Common::Config;
  1;
};

ok($eval_return && !$@, 'LaTeXML modules loaded successfully.');

# Definable Closure
my $tex_input = '\simto{a}{dcl}(?a) \exact{:=} ?f';
my $config = LaTeXML::Common::Config->new(paths=>['blib/lib/LaTeXML/resources/Profiles','blib/lib/LaTeXML/Package'],profile=>'mwsquery');
my $converter = LaTeXML->get_converter($config);

my $response = $converter->convert("literal:$tex_input");

my $content_query = <<'EOQ';
<?xml version="1.0"?>
<mws:query xmlns:mws="http://search.mathweb.org/ns" xmlns:m="http://www.w3.org/1998/Math/MathML" limitmin="0" answsize="30">
  <mws:expr>
   <m:apply xml:id="m1.1.10" xref="m1.1.10.pmml">
     <mws:exact>
      <m:csymbol cd="latexml" xml:id="m1.1.8" xref="m1.1.8.pmml">assign</m:csymbol>
     </mws:exact>
     <m:apply xml:id="m1.1.10.1" xref="m1.1.10.1.pmml">
       <m:times xml:id="m1.1.10.1.1" xref="m1.1.10.1.1.pmml"/>
       <mws:simto name="a">
        <m:ci xml:id="m1.1.1" xref="m1.1.1.pmml">d</m:ci>
        <m:ci xml:id="m1.1.2" xref="m1.1.2.pmml">c</m:ci>
        <m:ci xml:id="m1.1.3" xref="m1.1.3.pmml">l</m:ci>
       </mws:simto>
       <mws:qvar xmlns:mws="http://search.mathweb.org/ns" name="a"/>
     </m:apply>
     <mws:qvar xmlns:mws="http://search.mathweb.org/ns" name="f"/>
   </m:apply>
  </mws:expr>
</mws:query>
EOQ

is($response->{status_code},0,'Conversion was problem-free.');
is($response->{result},$content_query,'Content query successfully generated');

