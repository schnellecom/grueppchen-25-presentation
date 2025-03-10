$pdflatex = 'pdflatex --recorder --synctex=1 --shell-escape -halt-on-error %O %S ; mkdir ./pdf ; cp %D ./pdf/%R.pdf';
$lualatex = 'lualatex --recorder --synctex=1 --shell-escape -halt-on-error %O %S ; mkdir ./pdf ; cp %D ./pdf/%R.pdf';
$xelatex = 'xelatex --recorder --synctex=1 --shell-escape -halt-on-error %O %S ; mkdir ./pdf ; cp %D ./pdf/%R.pdf';

$pdf_mode = 1;
$out_dir = "build";

$ENV{'TEXMFHOME'} = "~/.local/share/texlive";
$ENV{'TEXMFCONFIG'} = "~/.config/texlive";
$ENV{'TEXMFVAR'} = "~/.cache/texlive";

push @generated_exts, qw/thm/;

# Custom dependency and function for nomencl package
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
	system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}