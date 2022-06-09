# # source(here::here("code", "A04PackagesPython.R")) ============================================#

if (!("arrow" %in% (.packages()))) {
  pkg <- character(0)
  pkg <- c(pkg, "arrow")
  lapply(pkg, FUN = function(x) {suppressMessages(library(x, character.only = TRUE))})
  # #Cleanup
  rm(pkg)
} else print("After Python import, R Packages not loaded again.")
