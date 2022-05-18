## ---- A02 ----
# # source(here::here("code", "A02AllUDF.R")) ====================================================#

## ---- A02A-AllUDF ----
if(identical(0L, length(ls(pattern = "f_$")))) {
  source(here::here("code", "A03Tools.R"))
  source(here::here("code", "A05ThemeGG.R"))
} else print("Functions not loaded again.")

## ---- A02Z ----
# #f_rmExist()
