report:
	latex report.tex
	latex report.tex
	bibtex report.aux
	latex report.tex
	latex report.tex
	dvips report.dvi
	ps2pdf report.ps
	#Clean-up
	mv *.log *.blg *.bbl *.gummi Logs/

	rm report.dvi
	rm report.ps
	rm report.aux

mac:
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex report.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex report.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/bibtex report.aux
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex report.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/latex report.tex
	/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin/dvips report.dvi
	ps2pdf report.ps
	#Clean-up
	mv *.log *.blg *.bbl *.gummi Logs/

	rm report.dvi
	rm report.ps
	rm report.aux
