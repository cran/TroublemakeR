# library(TroublemakeR)
# library(terra)
# library(magrittr)
# library(readr)
# Landuse <- read_table("~/Documents/AMPL/Landuse.txt",
#                       col_names = FALSE) |>
#   set_colnames(c("Cell", "Landuse", "Value")) |>
#   dplyr::group_by(Cell) |>
#   dplyr::filter(Value == max(Value)) |>
#   dplyr::ungroup() |>
#   dplyr::mutate(Code = as.numeric(as.factor(Landuse)))
#
# DF <- Landuse |>
#   dplyr::select(Code, Landuse) |>
#   dplyr::distinct() |>
#   dplyr::arrange(Code)
#
# data("Current")
#
# Template <- Current |> terra::unwrap()
# Template <- Template[[1]]
#
# Solution <- Template
#
# values(Solution) <- Landuse$Code
#
# levels(Solution) <- DF
#
# plot(Solution)
#
# LanduseQuad <- read_table("~/Documents/AMPL/LanduseQuad.txt",
#                       col_names = FALSE) |>
#   set_colnames(c("Cell", "Landuse", "Value")) |>
#   tidyr::pivot_wider(names_from = Landuse, values_from = Value)
#
# SolsQuad <- c(Template, Template, Template)
#
# values(SolsQuad[[1]])[LanduseQuad$Cell] <- LanduseQuad$Agriculture
# values(SolsQuad[[2]])[LanduseQuad$Cell] <- LanduseQuad$Forest
# values(SolsQuad[[3]])[LanduseQuad$Cell] <- LanduseQuad$Urban
#
# names(SolsQuad) <- c("Agriculture", "Forest", "Urban")
#
# library(tidyterra)
# library(ggplot2)
#
# ggplot() + geom_spatraster(data = SolsQuad) + facet_wrap(~lyr) + tidyterra::scale_fill_terrain_c() + scale_x_continuous(breaks = c(0.25, 0.75))+ scale_y_continuous(breaks = c(0.25, 0.75))
