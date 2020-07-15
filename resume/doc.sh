#!/bin/bash

PDF_FILE=$1.pdf
#pandoc resume.md -f markdown-implicit_figures -V geometry:margin=1.5cm --toc  -o $PDF_FILE
pandoc resume.md -f markdown-implicit_figures -V geometry:margin=1.5cm -o $PDF_FILE
