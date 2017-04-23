OUTPUT_FILENAME = polyglot_programming
OUTPUT_DIR = ./output
INPUT_FILENAME = src/index.adoc

.PHONY: html pdf

clean:
	rm -rf $(OUTPUT_DIR)/*

html:
	asciidoc -b html5 -d book -a toc -o $(OUTPUT_DIR)/$(OUTPUT_FILENAME).html $(INPUT_FILENAME)

pdf:
	a2x -f pdf -a toc -L -D $(OUTPUT_DIR) $(INPUT_FILENAME)

default: html
