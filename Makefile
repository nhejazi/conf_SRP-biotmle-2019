TITLE="2019_srp"

.PHONY : all
all: poster clean web

poster:
	pdflatex --enable-write18 $(TITLE).tex
	bibtex $(TITLE)
	pdflatex $(TITLE).tex
	pdflatex $(TITLE).tex

clean:
	rm -f $(addprefix $(TITLE), .aux .log .nav .out .snm .toc .vrb .bbl .blg)

web:
	rsync --chmod=go+r $(TITLE).pdf \
		nhejazi@arwen.berkeley.edu:/mirror/data/pub/users/nhejazi/posters/$(TITLE).pdf
