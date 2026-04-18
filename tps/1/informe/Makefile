DOCNAME=informe

all: informe

.PHONY: clean

informe:
	pdflatex $(DOCNAME).tex

open: informe
	nohup zathura $(DOCNAME).pdf > /dev/null 2>&1 &

clean:
	rm *.aux *.log *.out *.toc 2>/dev/null
