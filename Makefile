OUTPUT_FILENAME = polyglot_programming
OUTPUT_EXT =
OUTPUT_DIR = output
OUTPUT_PATH = ./$(OUTPUT_DIR)
INPUT_FILENAME = src/index.adoc

# OS-specific commands
ifeq ($(OS),Windows_NT)
    CLEAN = del /Q .\$(OUTPUT_DIR)
else
    CLEAN = rm -rf $(OUTPUT_PATH)/*
endif

.PHONY: help html html-asciidoc pdf pdf-a2x default

clean:
	$(CLEAN)

help:
	@echo Makefile used to build the book in HTML or PDF format.
	@echo I have done my best to make this cross-platform, but Windows users may
	@echo still experience difficulties.
	@echo.
	@echo The book can be built using any of this installed software, which must
	@echo already be installed:
	@echo   * AsciiDoctor - for HTML output (default)
	@echo     https://asciidoctor.org/#installation
	@echo   * asciidoctor-pdf - for PDF output (default)
	@echo     https://asciidoctor.org/docs/asciidoctor-pdf/
	@echo   * asciidoc - for HTML output, and PDF output using a2x
	@echo     http://asciidoc.org/INSTALL.html
	@echo.
	@echo Usage: make [target]
	@echo.
	@echo Targets:
	@echo   clean: Cleans out all previous output.
	@echo   html: Create HTML5 output using AsciiDoctor.
	@echo   html-asciidoc: Create HTML5 output using asciidoc.
	@echo   pdf: Create PDF output using AsciiDoctor.
	@echo   pdf-a2x: Create HTML5 output using the asciidoc a2x command.
	@echo   default: Cleans all previous output and creates HTML5 output.
	@echo            This is the default target.
	@echo.
	@echo All output files will be placed into $(OUTPUT_PATH).

html html-asciidoc: $(eval OUTPUT_EXT = html)
pdf pdf-a2x: $(eval OUTPUT_EXT = pdf)

html:
	asciidoctor -b html5 -d book -a toc -o $(OUTPUT_PATH)/$(OUTPUT_FILENAME).$(OUTPUT_EXT) $(INPUT_FILENAME)

html-asciidoc:
	asciidoc -b html5 -d book -a toc -o $(OUTPUT_PATH)/$(OUTPUT_FILENAME).$(OUTPUT_EXT) $(INPUT_FILENAME)

pdf:
	asciidoctor-pdf -d book -a toc -a allow-uri-read -o $(OUTPUT_PATH)/$(OUTPUT_FILENAME).$(OUTPUT_EXT) $(INPUT_FILENAME)

pdf-a2x:
	a2x -f pdf -a toc -L -D $(OUTPUT_PATH) $(INPUT_FILENAME)

.DEFAULT_GOAL :=
default: | clean html
