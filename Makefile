.PHONY: open clean 

ASSIGN		= notes

PARTS		= dfs \
			  graphs \
			  heaps \
			  integer_multiplication \
			  mst \
			  recurrences \
			  selection \
			  union_find \
			  complexity_classes \
			  dynamic_programming \
			  np_complete \
			  shortest_path \
			  approximation \
			  probability \
			  records \
			  random_select \
			  amortization \
			  splay_trees \
			  prob_approx \
			  license \
			  acknowledgements


MAIN_TEX	= ${ASSIGN}.tex

PARTS_TEX	= ${addsuffix .tex,${PARTS}} 

PDF     = ${ASSIGN}.pdf

FIGURES = heapTreeArray.pdf

TEX     = pdflatex
TEXOPTS = -halt-on-error

BIBTEX  	= bibtex

open: ${PDF}
	open $< || gnome-open $<

${PDF}: ${MAIN_TEX} ${PARTS_TEX} ${FIGURES}

# should probably use a tool like rubber, but this works
%.pdf:	%.tex
	${TEX} ${TEXOPTS} $(basename $<) > /dev/null
	${BIBTEX} $(basename $<) || ${TEX} ${TEXOPTS} $(basename $<) > /dev/null
	${TEX} ${TEXOPTS} $(basename $<) > /dev/null
	${TEX} ${TEXOPTS} $(basename $<) > /dev/null

clean:
	rm -f *.log *.aux *.dvi ${PDF}
