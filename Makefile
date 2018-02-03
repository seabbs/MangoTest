default: all
MAN =  man
DOCS = docs
DOCS_ART = $(DOCS)/articles

all: build_data document package build_vignettes README.md package_site


#Update data
.PHONY: build_data
build_data:
		cd data-raw && make

#Build update documents and build package
document:
     R -e 'devtools::document()'

package:
		 R CMD INSTALL --no-multiarch --with-keep.source .

#Update readme
README.md: README.Rmd
		R -e 'rmarkdown::render("README.Rmd")'
		rm README.html

#Update vignettes
.PHONY: build_vignettes
build_vignettes:
		cd vignettes && make

##Make the package site
package_site:
		R -e 'pkgdown::build_site()'
