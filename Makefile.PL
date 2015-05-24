#======================================================================
# Makefile Maker for LaTeXML::MathSyntax
# d.ginev@jacobs-university.de
#======================================================================
use ExtUtils::MakeMaker;
use strict;
use warnings;

#======================================================================
# Use "perl Makefile.PL <options>"
#======================================================================
WriteMakefile(
  NAME => 'LaTeXML::Plugin::MathWebSearch',
  AUTHOR => 'Deyan Ginev <d.ginev@jacobs-university.de>',
  ABSTRACT => "A LaTeXML extension for generatiing MathWebSearch queries from TeX",
  VERSION => "0.2",
  PREREQ_PM => { 
    'LaTeXML'=>'0.8.0',
  },
  (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
    'meta-spec' => { version => 2 },
      resources => {
        repository => {
          type => 'git',
          url => 'https://github.com/KWARC/LaTeXML-Plugin-MathWebSearch.git',
          web => 'https://github.com/KWARC/LaTeXML-Plugin-MathWebSearch',
        }}})
  : ()),
);