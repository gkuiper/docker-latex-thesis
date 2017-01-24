# LaTex docker image to build a thesis
[Thesis template of Jochem Rutgers](https://sites.google.com/site/jochemrutgers/publications/phd-thesis)

# Usage
Install [Docker](https://www.docker.com/)

To view the possible commands of the themplate run:
```bash
docker run -it -v $(pwd):/data guusk/docker-latex-thesis make help
```

To build the template run:
```bash
docker run -it -v $(pwd):/data guusk/docker-latex-thesis make fonts all
```
