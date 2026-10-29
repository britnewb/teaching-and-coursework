# Makefile

# Define targets

DOCS = Nonlinear/project Homeomorphic_flows/kinematic

#Build targets

PDFS = $(DOCS:.tex=.pdf)

all: $(PDFS)

%.pdf: %.tex
	cd $(dir $<) && \
	pdflatex -interaction=nonstopmode $(notdir $<) && \
	bibtex $(notdir $<) && \
	pdflatex -interaction=nonstopmode $(notdir $<) && \
	pdflatex -interaction=nonstopmode $(notdir $<) && \

clean:
	@for f in $(DOCS); do \
		rm -f $$f.aux $$f.bbl $$f.blg $$f.log $$f.out $$f.toc; \
	done

.PHONY: all clean

 
