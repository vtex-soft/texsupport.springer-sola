# texsupport.springer-sola

LaTeX author support files for the journal 
[Solar Physics](https://www.springer.com/journal/11207).

## Contents

The following files are given in the repository (or directly in `.zip` archive):

### Sample

-   `sola_example_6.tex` - sample paper. It contains useful information about 
    typesetting article with `spr-sola` class file.
-   `sola_example_6.pdf` - output after LaTeX compilation:

        latex sola_example_6.tex
        bibtex sola_example_6.aux
        latex sola_example_6.tex
        latex sola_example_6.tex
        dvips sola_example_6.dvi
        ps2pdf sola_example_6.ps

### Files included at compilation

-   Four figures: `fig1a.eps`, `fig1b.eps`, `fig1c.eps`, `fig1d.eps`
-   [ORCID](https://orcid.org/) logo: `orcid.eps`.
    ([SVG](https://figshare.com/articles/ORCID_iD_icon_graphics/5008697)&rarr;[PS](https://cairosvg.org/)&rarr;[EPS](https://www.ghostscript.com/doc/Devices.htm#EPS)).
-   Bibliography: `sola_bibliography_example.bib`.


### Extra information

-   `sola_keyword_list.txt`

### Formatting files  

-   `spr-sola.cls`

### Template

-   `template.tex`

## Setup

-   Clone the repository or download the `.zip` archive.
-   Install LaTeX style files (`spr-sola.cls`, `spr-mp-sola.bst`) 
    in your TeX system or place them in the same directory where your `*.tex` file is.
-   Read the instructions (`sola_example_6.pdf`) for the preparation of your LaTeX document.
-   Use the template file `template.tex` to prepare your manuscript.

## Notifications

-   `spr-sola` has option "linksfromyear"
    and when `hyperref` is loaded it makes a hyperlink only 
    from year component of the cite command. This solves 
    the problem of overfull boxes when dvips driver is used.
    Citation style should be an author-year, and the hyperref 
    should be loaded somewhere in preamble.
    Use "nolinksfromyear" if you want to disable it.
-   `spr-sola` loads a `natbib` package. 
    Use "nonatbib" option if you don't want to load it.
-   Option "showbiblabels" outputs `\bibitem` label on every 
    bibitem end (command `\endbibitem`). This option should be used 
    just for compatibility while citing a document.

## Troubleshooting

-   If you are using `bibtex8` version, don't forget an option `-w` ("wolfgang"). 
    Otherwise, You'll get an error:

        Sorry---you've exceeded BibTeX's wizard-defined function space 3000

-   If You are getting error like:

        Sorry---you've exceeded BibTeX's number of string global-variables

    that means Your `bibtex` version is too old. You should download latest 
    version 0.99d. This version fixes all limitation issues. 
    (One of the binaries location is [here](http://ftp.math.utah.edu/pub/texlive-utah/bin/)).
    

## Bug reports

Please submit bug reports and/or feature requests
at [GitHub page](https://github.com/vtex-soft/texsupport.springer-sola/issues) or 
[latex-support@vtex.lt](mailto:latex-support@vtex.lt).


