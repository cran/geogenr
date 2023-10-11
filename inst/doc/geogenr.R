## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(geomultistar)

## -----------------------------------------------------------------------------
library(geogenr)

ua <- uscb_acs_5ye(folder = "../data/us/")

(laa <- ua |> get_legal_and_administrative_areas())

(sa <- ua |> get_statistical_areas())

## ----eval = FALSE-------------------------------------------------------------
#  sa[6]
#  #>  [1] "New England City and Town Area Division"
#  
#  (y <- ua |> get_available_years_in_the_web(geodatabase = sa[6]))
#  #>  [1] 2013 2014 2015 2016 2017 2018
#  
#  (y_res <- ua |> download_geodatabases(geodatabase = sa[6], years = 2014:2015))
#  #>  [1] 2014 2015
#  

## -----------------------------------------------------------------------------
folder <- system.file("extdata", package = "geogenr")
folder <- stringr::str_replace_all(paste(folder, "/", ""), " ", "")
ua <- uscb_acs_5ye(folder = folder)

## -----------------------------------------------------------------------------
sa[6]

(y <- ua |> get_available_years_downloaded(geodatabase = sa[6]))

## -----------------------------------------------------------------------------
ul <- uscb_layer(uscb_acs_metadata, ua = ua, geodatabase = sa[6], year = 2015)
(layers <- ul |> get_layer_names())

## -----------------------------------------------------------------------------
layers[3]

ul <- ul |> get_layer(layers[3])
(layer_groups <- ul |> get_layer_group_names())

## -----------------------------------------------------------------------------
layer_groups[2]

ul <- ul |> get_layer_group(layer_groups[2])

## -----------------------------------------------------------------------------
ul$layer_group_columns

## -----------------------------------------------------------------------------
ft <- ul |> get_flat_table(remove_geometry = FALSE)

names(ft)

nrow(ft)

## -----------------------------------------------------------------------------
gms <- ul |> get_geomultistar()

## ----results = "asis", echo = FALSE-------------------------------------------
pander::pandoc.table(head(gms$dimension$when), split.table = Inf)
pander::pandoc.table(head(gms$dimension$where), split.table = Inf)
pander::pandoc.table(head(gms$dimension$what), split.table = Inf)
pander::pandoc.table(head(gms$fact$detailed_race), split.table = Inf)

## -----------------------------------------------------------------------------
uf <- uscb_folder(ul)

## -----------------------------------------------------------------------------
cft <- uf |> get_common_flat_table()

nrow(cft)

## -----------------------------------------------------------------------------
cgms <- uf |> get_common_geomultistar()

## ----results = "asis", echo = FALSE-------------------------------------------
pander::pandoc.table(head(cgms$dimension$when), split.table = Inf)

## -----------------------------------------------------------------------------
library(geomultistar)

cgms <- cgms  |>
  define_geoattribute(
    attribute = c("name"),
    from_attribute = "geoid"
  )

## -----------------------------------------------------------------------------
library(starschemar)

gdqr <- dimensional_query(cgms) |>
  select_dimension(name = "where",
                   attributes = c("name")) |>
  select_dimension(name = "what",
                   attributes = c("short_name", "demographic_race_spec")) |>
  select_fact(name = "detailed_race",
              measures = c("estimate")) |>
  filter_dimension(name = "when", year == "2015") |>
  filter_dimension(name = "what", demographic_race_spec == "Asian alone") |>
  run_geoquery()


## ----results = "asis", echo = FALSE-------------------------------------------
pander::pandoc.table(head(gdqr, 12), split.table = Inf)

## -----------------------------------------------------------------------------
class(gdqr)

plot(gdqr[,"estimate"])

