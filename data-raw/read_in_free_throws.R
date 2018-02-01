library(readr)

## Read in the raw data
free_throws <- read_csv("free_throws.csv")



## Add to package
saveRDS(free_throws, "free_throws.rds")
devtools::use_data(free_throws, overwrite = TRUE)








