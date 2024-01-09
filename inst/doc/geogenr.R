## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(geogenr)

dir <- system.file("extdata/acs_5yr", package = "geogenr")

ac <- acs_5yr(dir)

## -----------------------------------------------------------------------------
ac |>
  get_area_groups()
ac |>
  get_areas(group = "Legal and Administrative Areas")

ac |>
  get_area_years(area = "Alaska Native Regional Corporation")

## -----------------------------------------------------------------------------
ac <- ac |>
  select_area_files("Alaska Native Regional Corporation", 2020:2021)

files <- ac |>
  download_selected_files(unzip = FALSE)

## ----echo=FALSE---------------------------------------------------------------
dir <- tempdir()
source_dir <- system.file("extdata/acs_5yr", package = "geogenr")
files <- list.files(source_dir, "*.zip", full.names = TRUE)
file.copy(from = files, to = dir, overwrite = TRUE)
ac <- acs_5yr(dir)

## -----------------------------------------------------------------------------
files <- ac |>
  unzip_files()

## -----------------------------------------------------------------------------
ac |>
  get_available_areas()

ac |>
  get_available_area_years(area = "Alaska Native Regional Corporation")

## -----------------------------------------------------------------------------
ac |>
  get_available_area_topics("Alaska Native Regional Corporation")

## -----------------------------------------------------------------------------
act <- ac |>
  as_acs_5yr_topic("Alaska Native Regional Corporation",
                   topic = "X01 Age And Sex")

## -----------------------------------------------------------------------------
act |>
  get_report_names()

## -----------------------------------------------------------------------------
geo <- act |>
  as_acs_5yr_geo()

## -----------------------------------------------------------------------------
metadata <- geo |>
  get_metadata()

metadata

## -----------------------------------------------------------------------------
metadata <-
  dplyr::filter(
    metadata,
    item2 == "Female" &
      group == "People Who Are American Indian And Alaska Native Alone" &
      measure == "estimate"
  )

## -----------------------------------------------------------------------------
geo2 <- geo |>
  set_metadata(metadata)

geo2 |>
  get_metadata()

## -----------------------------------------------------------------------------
geo_layer <- geo2 |> 
  get_geo_layer()

geo_layer$faiana21vs20 <- 100 * (geo_layer$V1389 - geo_layer$V0671) / geo_layer$V0671
plot(sf::st_shift_longitude(geo_layer[, "faiana21vs20"]))

## -----------------------------------------------------------------------------
dir <- tempdir()
file <- geo |>
  as_GeoPackage(dir)

sf::st_layers(file)

## -----------------------------------------------------------------------------
st <- act |>
  as_star_database()

## -----------------------------------------------------------------------------
st_dm <- st |>
  rolap::as_dm_class(pk_facts = FALSE)
st_dm |> 
  dm::dm_draw(rankdir = "LR", view_type = "all")

## -----------------------------------------------------------------------------
l_db <- st |>
  rolap::as_tibble_list()

names <- sort(names(l_db))
for (name in names){
  cat(sprintf("name: %s, %d rows\n", name, nrow(l_db[[name]])))
}

