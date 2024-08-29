# code to prepare datasets

# locations
ch_locations <- read.csv("data-raw/locations.csv")

# this avoids R CMD check complained about non-ASCII characters
ch_locations$name <- iconv(ch_locations$name, from = "UTF-8", to = "UTF-8")

usethis::use_data(ch_locations, overwrite = TRUE)

# flows
ch_flows <- read.csv("data-raw/flows.csv")

usethis::use_data(ch_flows, overwrite = TRUE)
