MD_FILES = \
        ./src/preliminaries/outline.md \
        ./src/programming_overview/outline.md \
        ./src/from_hardware_to_software/outline.md \
        ./src/from_source_code_to_execution/outline.md \
        ./src/documenting_code/outline.md

OUTPUT_FILENAME = polyglot_programming
OUTPUT_DIR = ./output
LATEX_ENGINE =

.PHONY: html mkdirp

clean:
	rm -r $(OUTPUT_DIR)

mkdirp:
	mkdir -p $(OUTPUT_DIR)

html: mkdirp
	pandoc -o $(OUTPUT_DIR)/$(OUTPUT_FILENAME).html $(MD_FILES)

pdf: mkdirp
	pandoc --toc -o $(OUTPUT_DIR)/$(OUTPUT_FILENAME).pdf $(MD_FILES)

default: html
