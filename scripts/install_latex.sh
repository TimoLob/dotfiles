#!/bin/bash
yay -S texlive texstudio inkscape biber

# For svg support set pdflatex command in Texstudio -> Settings -> Commands to `pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %.tex`
