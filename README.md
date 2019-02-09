# LaTex docker image to build a thesis
[![Build Status](https://travis-ci.org/gkuiper/docker-latex-thesis.svg?branch=master)](https://travis-ci.org/gkuiper/docker-latex-thesis)
[Thesis template of Jochem Rutgers](https://sites.google.com/site/jochemrutgers/publications/phd-thesis)

# Usage
Install [Docker](https://www.docker.com/)

To view the possible commands of the themplate run:
```bash
docker run -it -v $(pwd):/data guusk/docker-latex-thesis make help
```

To build the template run:
```bash
docker run -it -v $(pwd):/data guusk/docker-latex-thesis make fonts acrotex all
```

# Create outline fonts

[Reference awnser on stackoverflow](https://stackoverflow.com/questions/28797418/replace-all-font-glyphs-in-a-pdf-by-converting-them-to-outline-shapes/28798374#28798374)

## Ghostscript < 9.15
```bash
gs -o file.ps -dNOCACHE -sDEVICE=pswrite file.pdf
gs -o file-with-outlines.pdf -sDEVICE=pdfwrite file.ps
rm file.ps
```

## Ghostscript >= 9.15
```bash
gs -o file-with-outlines.pdf -dNoOutputFonts -sDEVICE=pdfwrite file.pdf
```

