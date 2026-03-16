TEX_FILES := $(wildcard *.tex)
PDF_FILES := $(TEX_FILES:.tex=.pdf)

ifeq ($(wildcard main.tex),main.tex)
DEFAULT_PDF := main.pdf
else
DEFAULT_PDF := $(PDF_FILES)
endif

.PHONY: all clean cleancache

all: $(DEFAULT_PDF)

%.pdf: %.tex ut-thesis.cls
	pdflatex -interaction=nonstopmode "$*"
	@if grep -q '\\bibdata' "$*.aux"; then bibtex "$*"; fi
	pdflatex -interaction=nonstopmode "$*"
	pdflatex -interaction=nonstopmode "$*"

cleancache:
	rm -f *.aux *.bbl *.blg *.fdb_latexmk *.fls *.lof *.log *.lot *.out *.toc *.synctex.gz

clean: cleancache
	rm -f *.pdf
