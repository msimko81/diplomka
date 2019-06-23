MAIN = main
TEMP = temp

# pouzity LaTeX
TEX	= pdflatex
IDX = makeindex

# prehliadace
DVI_VIEWER = xdvi
PDF_VIEWER = evince

# docasne subory LaTeXu
LATEX_TMP = ${MAIN}.dvi ${MAIN}.pdf ${TEMP}.dvi\
	*.aux *.log *.toc *.idx *.ind *.ilg *.bbl *.blg *.out *.gz


all: clean pdf

# vymazanie docasnych suborov
clean:
	rm -rf ${LATEX_TMP}

pdf: clean
	${TEX} ${TEMP}.tex
	${TEX} ${MAIN}.tex
	${TEX} ${MAIN}.tex
	${IDX} ${MAIN}.idx 
	${TEX} ${MAIN}.tex

pdfreader: pdf
	${PDF_VIEWER} ${MAIN}.pdf
