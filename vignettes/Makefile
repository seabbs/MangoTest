default: all
RDIR = .
VIG_DRAFTS_DIR = $(RDIR)/drafts

#Update data analysis
DATA_ANALYSIS = $(VIG_DRAFTS_DIR)/data_analysis/data_analysis.html

all: $(DATA_ANALYSIS)

$(DATA_ANALYSIS): data_analysis.Rmd
			Rscript -e 'rmarkdown::render("data_analysis.Rmd", c("html_document"), output_dir = "drafts/data_analysis", output_options = list())'
