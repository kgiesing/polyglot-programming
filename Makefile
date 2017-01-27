OUTPUT_FILENAME = polyglot_programming
OUTPUT_DIR = ./output
INPUT_FILENAME = src/index.adoc

.PHONY: html mkdirp

clean:
	rm -rf $(OUTPUT_DIR)

mkdirp: clean
	mkdir -p $(OUTPUT_DIR)

html: mkdirp
	asciidoc -b html5 -d book -a toc -o $(OUTPUT_DIR)/$(OUTPUT_FILENAME).html $(INPUT_FILENAME)

pdf: mkdirp
	a2x -f pdf -a toc -L -D $(OUTPUT_DIR) $(INPUT_FILENAME)

default: html
