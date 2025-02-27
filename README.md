
MangoTest
=========

R package containing answers to the following Mango Solutions recruitment questions. See `docs/index.html` for package documentation.

Questions
---------

### Data analysis

-   Read in the csv containing NBA free throws.
    -   See `data-raw/read_in_free_throws.R`.
-   Visualise some aspect of the data you find interesting, e.g., the average number of free throws per period for the regular season and the playoffs.
    -   See `vignettes/data_analysis.Rmd` and `vignettes/drafts/data_analysis/data_analysis.html`.

### Programming

#### Function

-   Write a function that will draw random numbers from a given distribution. The function should take one argument for the number of samples and a second argument which specifies the distribution (Normal, Poisson or Binomial). The function should be able to handle additional parameters depending on the distribution chosen, e.g., a `lambda` for Poisson samples.
    -   See `R/sample_dist.R` for the function, `tests/testhat/sample_dist.R` for function tests, and `docs/reference/sample_dist.html` for examples.

#### Object-oriented programming

-   Use the class system of your choice to create a summary method for the output of your function.
    -   See `R/summary.sample_dist`, `tests/testhat/summary.sample_dist` for function tests, and `docs/reference/summary.sample_dist.html` for examples.

#### Package

-   Build a package containing the functions above. Use any tools as necessary.
    -   See repo.

Installation
------------

Install the package using devtools with the following code.

``` r
# install.packages("devtools")
devtools::install_github("seabbs/MangoTest")
```

Development Environment
-----------------------

This package has been developed in docker based on the`rocker/tidyverse` image, to access the development environment enter the following at the command line in the package directory (with an active docker daemon running),

``` bash
docker docker . -t MangoTest
docker run -d -p 8787:8787 -e USER=MangoTest -e PASSWORD=MangoTest --name MangoTest MangoTest
```

The rstudio client can be accessed on port 8787 at localhost (or your machines ip). The default username is MangoTest and the default password is MangoTest.

If a package rebuild is required this can be achieved using `make`, as follows;

``` bash
make
```

Notes
-----

The travis and appveyor set up is for information only and has not been linked to their online services. Badges outlining the build status, along with code coverage and activity status of the repository would be added to the top of this package when made public.
