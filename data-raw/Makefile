default: all
RDIR = .

all: free_throws.rds

## Extract offer rate data
free_throws.rds: read_in_free_throws.R
			Rscript read_in_free_throws.R
