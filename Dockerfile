## Start with the shiny docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

RUN apt-get install -y \
    texlive-latex-recommended \
    texlive-fonts-extra \
    texinfo \
    libqpdf-dev \
    && apt-get clean

ADD . /home/rstudio/MangoTest

RUN Rscript -e 'devtools::install_deps("home/rstudio/MangoTest")'

RUN Rscript -e 'devtools::install("home/rstudio/MangoTest")'
