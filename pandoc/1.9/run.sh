# docker run \
#   -v $(pwd)/works:/source \
#   one/pandoc:1.9 \
#   -f markdown -t html5 \
#   readme.md \
#   -o myfile.html
docker run \
  -v $(pwd)/works:/source \
  one/pandoc:1.9 \
  --toc --toc-depth=3 ls.md --latex-engine=xelatex \
	-o ls.pdf \
	--template=my.tex
