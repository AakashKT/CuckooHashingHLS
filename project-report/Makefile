project-report.pdf: *.tex references.bib 
	pdflatex project-report.tex 
	bibtex project-report
	pdflatex project-report.tex 
	pdflatex project-report.tex 

clean:
	rm *.bbl *.log *.aux *.blg

