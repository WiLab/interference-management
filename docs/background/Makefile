paper:
	latex paper.tex
	latex paper.tex
	bibtex paper.aux
	latex paper.tex
	latex paper.tex
	dvips paper.dvi
	ps2pdf paper.ps
	#Clean-up
	mv *.log *.blg *.bbl *.gummi Logs/

	rm paper.dvi
	rm paper.ps
	rm paper.aux

mac:
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex paper.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex paper.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/bibtex paper.aux
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex paper.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex paper.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/dvips paper.dvi
	ps2pdf paper.ps
	#Clean-up
	mv *.log *.blg *.bbl *.gummi Logs/

	rm paper.dvi
	rm paper.ps
	rm paper.aux
