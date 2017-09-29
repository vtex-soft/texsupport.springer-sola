
default: sola_example_6.pdf

%.pdf: %.ps
	ps2pdf $<

%.ps: %.dvi
	dvips  $*

%.dvi: %.tex
	latex $*
	bibtex $*

clean:
	rm -rf *.aux *.blg *.out *.log
