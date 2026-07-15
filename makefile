all: main.pdf roadmap.pdf

main.pdf: main.tex main.bib tex/*
	-pdflatex -interaction=nonstopmode main
	-bibtex main
	-pdflatex -interaction=nonstopmode main
	-pdflatex -interaction=nonstopmode main

# Section "Completed Work and Remaining Work" (former 1.4) is not part of the
# thesis; it is compiled separately into roadmap.pdf via `make roadmap`.
roadmap: roadmap.pdf

roadmap.pdf: roadmap.tex main.bib
	-pdflatex -interaction=nonstopmode roadmap
	-bibtex roadmap
	-pdflatex -interaction=nonstopmode roadmap
	-pdflatex -interaction=nonstopmode roadmap

cleancache:
	rm -f *.blg *.aux *.log *.bbl

clean:
	rm -f *.blg *.dvi *.ps *.aux *.log *.bbl main.pdf roadmap.pdf

.PHONY: all roadmap cleancache clean
