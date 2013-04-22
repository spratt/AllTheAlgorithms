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
			  amortization \
			  random_select \
			  prob_approx \
			  license \
			  acknowledgements


MAIN_TEX	= ${ASSIGN}.tex

PARTS_TEX	= ${addsuffix .tex,${PARTS}} 

PDF     = ${ASSIGN}.pdf

FIGURES = heapTreeArray.pdf

TEX     = pdflatex
TEXOPTS = -halt-on-error

open: ${PDF}
	open $< || gnome-open $<

${PDF}: ${MAIN_TEX} ${PARTS_TEX} ${FIGURES}
	${TEX} ${TEXOPTS} $< 
	${TEX} ${TEXOPTS} $<

clean:
	rm -f *.log *.aux *.dvi ${PDF}
