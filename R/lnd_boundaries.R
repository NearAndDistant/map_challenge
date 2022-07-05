# london boundaries
library(dplyr)
library(sf)

#london boundaries, here: https://s3-eu-west-1.amazonaws.com/londondatastore-upload/statistical-gis-boundaries-london.zip

# create temp files
temp_map <- tempfile(fileext = ".zip")
unzip_temp_map <- tempfile()

# download zip file into tempfile using hyperlink
download.file(url = "https://s3-eu-west-1.amazonaws.com/londondatastore-upload/statistical-gis-boundaries-london.zip", destfile = temp_map)

# unzip the tempfile to extract the shp file we need
unzip_temp_map <- unzip(temp_map)

# read shp file using read_sf
lnd_shp <-
  read_sf('statistical-gis-boundaries-london/ESRI/London_Borough_Excluding_MHW.shp') %>%
  janitor::clean_names() %>%
  select(name , code_ons = gss_code , geometry)

## Now, add the data files to the package

library(usethis)

use_data(lnd_shp, overwrite = TRUE)
