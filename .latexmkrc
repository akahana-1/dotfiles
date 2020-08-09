#! /usr/bin/env perl
$latex = 'uplatex -kanji=utf8 -kanji-internal=utf8';
$latex_silent = 'uplatex -kanji=utf8 -kanji-internal=utf8 -interaction=batchmode';
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode -shell-escape -file-line-error -halt-in-error %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$max_repeat = 3;
$pdf_mode = 4;
