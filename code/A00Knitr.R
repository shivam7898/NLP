# # source(here::here("code", "A00Knitr.R")) =====================================================#

if (!("q_start" %in% ls(envir = .GlobalEnv))) {
  # #Compile Start Time 
  q_start <- Sys.time()
  knitr::opts_chunk$set(echo = TRUE, include = TRUE, eval = TRUE, 
						collapse = TRUE,
						width = 100,
                        opts.label = 'twofig',
                        message = FALSE, warning = FALSE, error = FALSE, 
                        progress = FALSE, verbose = FALSE)			
  # #Store the Run Time of slow Chunks
  q_all_chunk_times <- list()  
  knitr::knit_hooks$set(chunk_run_time = local({
    now <- NULL
    function(before, options) {
      if (before) {
        # #record the current time before each chunk using "<<-"
        now <<- Sys.time()
      } else {
          # #calculate the time difference after a chunk
          res <- difftime(Sys.time(), now)
          if (res > 1) {
            # #insert in the list using "<<-"
            q_all_chunk_times[[options$label]] <<- res
          }
      }
    }
  }))
  knitr::opts_chunk$set(chunk_run_time = TRUE)

  # #Chunk Templates, use as: opts.label='twofig'
  knitr::opts_template$set(twofig = list(
					fig.show = "hold", fig.align = 'center', out.width = "49%"))

  # The Standard, Wider, and Higher Plot Sizes
  q_png_h <- 7
  q_png_w  <- 7
  q_png_w_w <- 2 * q_png_w
  q_png_w_h <- {9/16} * q_png_w_w
  q_png_h_h <- {3/4} * 2 * q_png_h
  q_png_h_w <- 2 * q_png_w
  q_dpi <- q_dpi_w <- q_dpi_h <- 300

  # #Save Definitions and Theorems for Glossary
  q_def = list()
  q_thm = list()
  q_cnj = list()
  q_exm = list()
  knitr::knit_hooks$set(engine = function(before, options) {
    # #Set the hook once to handle All /both lists
    if ( before ) {
      if ( options$engine == "theorem" ) {
	         q_thm[[options$label]] <<- options$name
	     } else if ( options$engine == "definition" ) {
          q_def[[options$label]] <<- options$name
      } else if ( options$engine == "conjecture" ) {
          q_cnj[[options$label]] <<- options$name
      } else if ( options$engine == "example" ) {
          q_exm[[options$label]] <<- options$name
      }
    }
    NULL
  })
  
  # #Chunk Colour Change for Python & R
  # #https://f0nzie.github.io/matplotlib-with-rmarkdown/
  knitr::knit_hooks$set(decorate = function(before, options) {
    if (before) {
       if (options$engine == "python") {
         label <- "<b> Python</b>"
         bc <- "#417FB1"
         sz <- "100%"
         tc <- "#FFD94C"
         icon <- fa("python", fill = tc)
       } else if (options$engine == "R") {
         label <- "<b> R</b>"
         bc <- "#4C78DB"
         sz <- "100%"
         tc <- "#ffffff"
		 icon <- fa("r-project", fill = tc)
       } #else if (options$engine == "bash") {
       #  label <- "<b>Shell</b>"
       #  bc <- "#000000"
       #  sz <- "100%"
       #  tc <- "#ffffff"
       #  icon <- "<i class=\"fas fa-terminal\"></i>"
       #}
      paste0("<div class=decocode>",
             "<div style=\"background-color:", bc, "\">",
             "<span style=\"font-size:", sz, ";color:", tc, "\">", icon,  
             label, "</span>")
    } else {
      "</div><br></div>"
    }
  })   
} else print("Knitr not loaded again.")

