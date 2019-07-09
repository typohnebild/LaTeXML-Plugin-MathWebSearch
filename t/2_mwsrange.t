use LaTeXML::Util::Test;

# Ok I'll guess this is a really dirty workaround, but hmmm
# it seems still necessary to make test from this context possible.
# Because the test programm expects a latexmlc executable in blib/scripts
# but were here in the Plugin context so this the way I found to provide this

my $latexmlc = `which latexmlc`;
chomp $latexmlc;
my $pwd = `pwd`;
chomp $pwd;
my $cwd = $pwd . "/blib/script/latexmlc";
symlink $latexmlc, $cwd || die "symlink doesn't work";

latexml_tests($pwd . "/t/mws_range", requires => {mwsq=>'dvipsnam.def'});

1;
