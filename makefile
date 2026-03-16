all: main.pdf

main.pdf: *.tex main.bib tex/*
	-pdflatex -interaction=nonstopmode main
	-bibtex main
	-pdflatex -interaction=nonstopmode main
	-pdflatex -interaction=nonstopmode main


cleancache:
	rm -f *.blg *.aux *.log *.bbl

clean:
	rm -f *.blg *.dvi *.ps *.aux *.log *.bbl main.pdf 
