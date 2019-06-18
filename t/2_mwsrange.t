use LaTeXML::Util::Test;
use File::Copy qw(copy);

# Ok i'll guess this is a realy dirty workaround, but hmmm

my $latexmlc = `which latexmlc`;
chomp $latexmlc;
my $cwd = `pwd`;
chomp $cwd;
$cwd = $cwd . "/blib/script/latexmlc";
symlink $latexmlc, $cwd || die "symlink doesn't work";

latexml_tests("t/mws_range", requires =>{mwsq=>'dvipsnam.def'});

1;
