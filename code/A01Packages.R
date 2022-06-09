# # source(here::here("code", "A01Packages.R")) ==================================================#

if (!("conflicted" %in% (.packages()))) {
  if(FALSE) install.packages("conflicted", dependencies = TRUE)
  pkg <- character(0)
  pkg <- c(pkg, "conflicted", "here", "knitr", "reticulate")
  pkg <- c(pkg, "ggplot2", "tibble", "readr", "tidyr", "purrr", "dplyr", "stringr")
  pkg <- c(pkg, "igraph", "httr", "jsonlite", "viridisLite", "scales", "fontawesome")
  pkg <- c(pkg, "kableExtra", "readxl", "latex2exp", "e1071", "lubridate", "car", "zoo", "forcats")
  #pkg <- c(pkg, "data.table", "gifski", "nycflights13", "gapminder", "Lahman", "nortest")
  #pkg <- c(pkg, "mice", "VIM", "qcc", "ggpmisc", "microbenchmark", "GGally", "corrplot")
  #pkg <- c(pkg, "compiler", "psych", "fastDummies", "RColorBrewer")
  #pkg <- c(pkg, "caret", "glmnet", "mlbench", "stringi", "factoextra", "cluster")
  #pkg <- c(pkg, "arules", "arulesViz", "ggrepel", "rpart", "rpart.plot", "rattle", "janitor")
  #pkg <- c(pkg, "rfm", "carData", "Hmisc", "partykit", "treeheatr", "ggparty", "randomForest") 
  #pkg <- c(pkg, "ISLR2", "MASS", "broom", "sandwich", "stargazer", "ROSE", "pROC", "ROCR") 
  #pkg <- c(pkg, "lobstr")
  lapply(pkg, FUN = function(x) {suppressMessages(library(x, character.only = TRUE))})
  #lapply(pkg, FUN = function(x) {library(x, character.only = TRUE)})
  #
  # #Precedence
  # # dplyr::filter | stats::filter
  #invisible(suppressMessages(conflict_prefer("filter", "dplyr")))
  ## # dplyr::between | data.table::between
  #invisible(suppressMessages(conflict_prefer("between", "dplyr")))  
  ## # dplyr::summarize | Hmisc::summarize
  #invisible(suppressMessages(conflict_prefer("summarize", "dplyr")))  
  ## # dplyr::lag | stats::lag
  #invisible(suppressMessages(conflict_prefer("lag", "dplyr")))   
  ## # dplyr::select | MASS::select
  #invisible(suppressMessages(conflict_prefer("select", "dplyr"))) 
  ## # lubridate::week | data.table::week
  #invisible(suppressMessages(conflict_prefer("week", "lubridate"))) 
  ## # lubridate::year | data.table::year
  #invisible(suppressMessages(conflict_prefer("year", "lubridate")))  
  ## # lubridate::month | data.table::month
  #invisible(suppressMessages(conflict_prefer("month", "lubridate")))  
  ## # ggplot2::annotate | ?::  
  #invisible(suppressMessages(conflict_prefer("annotate", "ggplot2")))
  ## # ggplot2::margin | randomForest::margin
  #invisible(suppressMessages(conflict_prefer("margin", "ggplot2")))  
  ## # rattle::importance | randomForest::importance
  #invisible(suppressMessages(conflict_prefer("importance", "rattle")))  
  ## # rattle::weather | nycflights13::weather
  #invisible(suppressMessages(conflict_prefer("weather", "rattle")))  
  ## # stats::chisq.test | janitor::chisq.test
  #invisible(suppressMessages(conflict_prefer("chisq.test", "stats")))  
  # #Cleanup
  rm(pkg)
  # #Provide the path to the specific Python binary.
  use_python("C:\\Softwares\\Python\\Python310\\python.exe", required = TRUE)
} else print("R Packages not loaded again.")
