# #(.Rprofile) [3/3] =============================================================================#
# #This file is Not auto-executed. It is sourced by [2/3] & runs on Restart by "^+F10" "AHK F5"
# [1] Location: Sys.getenv("HOME")
# [2] Location: "D:/Analytics/R"
# [3] Location: Working Directory
# Project specific .Rprofile under GIT management
# This file is copied by SetRProject.ps1 from D:\Analytics\PowerShell\RFiles

# #(.Rrofile) [1/3] Sys.getenv("HOME") ".../Documents" ===========================================#
# #This File is Auto-executed on Start-up & on Restart i.e. "^+F10" "AHK F5"
# #This is kept in USER HOME and changed only when USER is changed.

# #To change the working directory (To Analytics)
#setwd("D:/Analytics/R")

# #Execute the .Rprofile [2/3] (No Auto-execution)
#source(".Rprofile")
#=================================================================================================#
# #(.Rrofile) [2/3] "D:/Analytics/R" =============================================================#
# #This file is Not auto-executed. It is sourced by [1/3] & runs on Restart by "^+F10" "AHK F5"
# #Modify Library Path
# #Note that only directories that exist at the time will be included.
# #[2/3] needs modified libPaths for accessing ALL Packages during New Startup. However...
# #Any change in libPaths here [2/3] gets overwritten later if another .Rprofile [3/3] is executed
# #So, these changes are repeated also in [3/3]
#if (!identical(.libPaths()[1], "C:/Softwares/R/LibFiles")) {
#  .libPaths( c( "C:/Softwares/R/LibFiles", .libPaths()) )
#}

# #To Point to the Latest Project as working directory
#loc <- trimws(readLines("./../WorkingDirectory.txt", n = 1))
#if(file.exists(loc)) {
#    setwd(loc) 
#    rm(loc)
#    # #Execute the .Rprofile [3/3] (No Auto-execution)
#    if (file.exists(".Rprofile")) {
#        source(".Rprofile")
#    } else {
#        message("'.Rprofile' does not exist in Directory: ", getwd())
#    }
#} else {
#    message("Check 'WorkingDirectory.txt', Target Directory does not exist: ", loc)
#    rm(loc)
#}
#=================================================================================================#

# #Set a CRAN mirror. Change the Target URL to the one having 'https' to avoid warnings.
local({r <- getOption("repos")
       r["CRAN"] <- "https://cloud.r-project.org/"
       options(repos=r)})

# #Modify Library Path
# #Note that only directories that exist at the time will be included.
# #[2/3] needs modified libPaths for accessing ALL Packages during New Startup. However...
# #Any change in libPaths here [2/3] gets overwritten later if another .Rprofile [3/3] is executed
# #So, these changes are repeated also in [3/3]
if (!identical(.libPaths()[1], "C:/Softwares/R/LibFiles")) {
  .libPaths( c( "C:/Softwares/R/LibFiles", .libPaths()) )
}

# #To only download binaries and avoid 'latest code' type Errors in Windows.
options(pkgType = "binary")

# #Disable Scientific Notation because p-values, residuals etc. are irritating to convert
# #It might show many trailing zeroes but that can be handled separately.
#options(scipen = 0, digits = 7) #Default
options(scipen = 999)

# #Maximum Print Limit (Not lines, Characters. So, higher number is used.)
options(max.print=1000)

# #Set NPP as the external editor
options(editor = "C:/Program Files (x86)/Notepad++/notepad++.exe")

# #Change Prompt
options(prompt="> ")

# #Change the continuity prompt from (+), like (>), to wider (...) like Python
options(continue="... ")

# #Setup Max Width
options(width = 100)

# #Avoid GUI Dialogs in R (as implemented in RStudio)
options(menu.graphics=FALSE)

# #Form Feed Character (="\f" ="\014" ="^l") To suppress R Welcome Message (works for RStudio)
cat("\f")

# #Instruct R to, before anything else, echo a timestamp to the console and to '.Rhistory'
# #Load "utils" package for Sys.time()
library("utils")
.First <- function(){
  if(interactive()){
    message("# ### \"", getwd(), "\" ", Sys.time(), " #")
  }
}

# #tidyverse lifecycle package, to convert deprecated warnings to errors
options(lifecycle_verbosity = "error")

# #Warning: To upgrade Warning to Error for easy identification of problem chunk
# #Restore default: options(warn=0, error=NULL)
if(FALSE) options(warn = 2, error = recover)
