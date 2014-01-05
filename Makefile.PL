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
  VERSION => "0.1",
  PREREQ_PM => { 
    'LaTeXML'=>0,
  });