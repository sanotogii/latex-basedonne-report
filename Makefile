# Makefile pour la compilation du rapport LaTeX
# Usage : make        → compile complète
#         make clean  → supprime les fichiers temporaires
#         make view   → ouvre le PDF (Linux : xdg-open)

MAIN   = rapport
LATEX  = pdflatex
BIBER  = biber
FLAGS  = -interaction=nonstopmode -halt-on-error

.PHONY: all clean view

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib
	$(LATEX) $(FLAGS) $(MAIN)
	$(BIBER) $(MAIN)
	$(LATEX) $(FLAGS) $(MAIN)
	$(LATEX) $(FLAGS) $(MAIN)

clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).bcf $(MAIN).blg \
	       $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).lof $(MAIN).log \
	       $(MAIN).lot $(MAIN).out $(MAIN).run.xml $(MAIN).toc \
	       $(MAIN).synctex.gz

view: $(MAIN).pdf
	xdg-open $(MAIN).pdf &
