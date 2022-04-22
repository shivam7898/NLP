## ---- A03 ----
# # source(here::here("code", "A03Tools.R")) =====================================================#

## ---- A03A-F ----
f_ <- function() {
# #List only the relevant objects in the Global Environment
  x <- ls(.GlobalEnv)
# #Match object names starting with "f_" OR "q_" and drop them from the vector
  lgl <- grepl("^f_|^q_", x)
  x <- x[!lgl]
  paste0(x, collapse = ", ")
# #xxCLOSE: f_()
}

## ---- A03B-rmExist ----
f_rmExist <- function(...) {
# #To delete objects only if they exist i.e. "f_rmExist(z)"
  x <- vapply(as.list(match.call()[-1]), FUN = deparse, FUN.VALUE = character(1)) 
  rm(list = x[vapply(x, FUN = exists, FUN.VALUE = logical(1))], envir = parent.frame())
# #xxCLOSE: f_rmExist()
}

## ---- A03Z ----
# #f_rmExist()
