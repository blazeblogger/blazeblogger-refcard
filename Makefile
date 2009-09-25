# makefile for blazeblogger-refcard, a reference card for BlazeBlogger
# Copyright (C) 2009 Jaromir Hradilek

# This program is  free software:  you can redistribute it and/or modify it
# under  the terms  of the  GNU General Public License  as published by the
# Free Software Foundation, version 3 of the License.
#
# This program  is  distributed  in the hope  that it will  be useful,  but
# WITHOUT  ANY WARRANTY;  without  even the implied  warranty of MERCHANTA-
# BILITY  or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
# License for more details.
#
# You should have received a copy of the  GNU General Public License  along
# with this program. If not, see <http://www.gnu.org/licenses/>.

# General settings; feel free to modify according to your situation:
SHELL    = /bin/sh
PDFLATEX = pdflatex
LATEX    = latex
DVIPS    = dvips -t a4 -t landscape
SRC      = blazeblogger-refcard.tex
PDF     := $(patsubst %.tex, %.pdf, $(SRC))
DVI     := $(patsubst %.tex, %.dvi, $(SRC))
PS      := $(patsubst %.tex, %.ps,  $(SRC))

# Make rules;  please do not edit these unless you really know what you are
# doing:
.PHONY: pdf dvi ps clean

pdf: $(PDF)

dvi: $(DVI)

ps: $(PS)

clean:
	-rm -f *.aux *.log *.out $(PDF) $(DVI) $(PS)

$(PDF): $(SRC)
	$(PDFLATEX) $(SRC)

$(DVI): $(SRC)
	$(LATEX) $(SRC)

$(PS): $(DVI)
	$(DVIPS) $(DVI)

