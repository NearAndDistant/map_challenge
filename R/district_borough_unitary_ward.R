# boundaries
# boundary source: https://osdatahub.os.uk/downloads/open/BoundaryLine

library(sf)
library(geogrid)
library(rgdal)

uk_bound <-
  readOGR(
    dsn = here::here("raw_data/bdline_essh_gb/Data/GB"),
    layer = "district_borough_unitary_ward_region",
    verbose=FALSE)

# convert to sf
uk_bound_sf <- st_as_sf(uk_bound)

## Now, add the data files to the package

library(usethis)

use_data(uk_bound_sf, overwrite = TRUE)
