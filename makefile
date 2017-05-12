.PHONY:main.pdf	all clean

all:main.pdf

%.tex:%.raw
	./raw2tex $< > $@
%.tex:%.dat
	./dat2tex $< > $@	
main.pdf:main.tex
	latexmk	--verbose -pdf -pdflatex="xelatex -interaction=nonstopmode -shell-escape" -use-make main.tex 2>&1 | grep --color=auto -E ".*"
clean:
	rm -rf *.bbl *.loa *.backup *.pytxcode *.'gz(busy)' *.ptc *.run.xml *.acn *.alg *.glg *.glo *.gls *.glsdefs *.ist *.xdy *.acr *.bbl *.blg *.aux *.dvi *.log *.lot *.idx *.toc *.lof *.brf *.out *.pyg *.fdb_latexmk *.ind *.fls *.ilg *.pdf

debug:
	latexmk	--verbose -pdf -pdflatex="xelatex -shell-escape" -use-make main.tex 2>&1 | grep --color=auto -E ".*"
