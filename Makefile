TITLE="2019_srp"

.PHONY : all
all: poster clean

poster:
	pdflatex --enable-write18 $(TITLE).tex
	bibtex $(TITLE)
	pdflatex $(TITLE).tex
	pdflatex $(TITLE).tex

clean:
	rm -f $(addprefix $(TITLE), .aux .log .nav .out .snm .toc .vrb .bbl .blg)

web:
	scp $(TITLE).pdf \
		nhejazi@arwen.berkeley.edu:/mirror/data/pub/users/nhejazi/posters/$(TITLE).pdf
	ssh nhejazi@arwen.berkeley.edu \
		'chmod go+r /mirror/data/pub/users/nhejazi/posters/$(TITLE).pdf'
