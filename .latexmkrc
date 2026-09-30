# upLaTeX + dvipdfmx for Japanese textbook publishing
$pdf_mode = 3;
$latex = 'uplatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$pdflatex = 'uplatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$dvipdf = 'dvipdfmx -o %D %S';
$bibtex = 'upbibtex %O %B';
$makeindex = 'upmendex %O -o %D %S';
$max_repeat = 5;
