use LaTeXML::Util::Test;
use File::Copy qw(copy);

# Ok i'll guess this is a realy dirty workaround, but hmmm

my $latexmlc = `which latexmlc`;
chomp $latexmlc;
my $pwd = `pwd`;
chomp $pwd;
my $cwd = $pwd . "/blib/script/latexmlc";
symlink $latexmlc, $cwd || die "symlink doesn't work";

latexml_tests($pwd . "/t/mws_range", requires => {mwsq=>'dvipsnam.def'});

1;
