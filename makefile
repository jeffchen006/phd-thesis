all: main

main: *.tex main.bib tex/* 
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main


cleancache:
	rm -f *.blg *.aux *.log *.bbl

clean:
	rm -f *.blg *.dvi *.ps *.aux *.log *.bbl main.pdf 
