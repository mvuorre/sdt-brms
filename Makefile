SOURCE = index.qmd

all: renv render

renv:
	Rscript -e "renv::restore()"

render: docs/index.html

docs/index.html: $(SOURCE)
	quarto render $<

ms.docx: $(SOURCE)
	quarto render $< --to docx --output $@

clean:
	rm -rf *_cache *_files _freeze docs/

.PHONY: renv clean
