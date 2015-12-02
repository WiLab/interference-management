paper:
	latex paper.tex
	latex paper.tex
	bibtex paper.aux
	latex paper.tex
	latex paper.tex
	dvips paper.dvi
	ps2pdf paper.ps
	#Clean-up
	rm paper.dvi
	rm paper.ps
	rm paper.aux
	rm paper.blg
	# rm paper.fls
	# Save logs
	+@[ -d Logs ] && mkdir -p Logs
	-@[ -e *.log ] && mv -f *.log Logs/
	# {mkdir Logs} || {mv *.log Logs/} || {mv *.blg Logs/} || {mv *.bbl Logs/} || {mv *.gummi Logs/}
	#mv *.log *.blg *.bbl *.gummi Logs/

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
