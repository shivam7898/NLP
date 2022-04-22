# # source(here::here("code", "A00Knitr.R")) =====================================================#

if (!("q_start" %in% ls(envir = .GlobalEnv))) {
  # #Compile Start Time 
  q_start <- Sys.time()
  knitr::opts_chunk$set(include = TRUE, echo = TRUE, eval = TRUE, collapse = TRUE,
                        dev.args = list(png = list(type = "cairo")), dpi = 300,
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
  knitr::opts_template$set(twofig = list(fig.show = "hold", fig.align = 'center', 
                                         out.width = "49%", fig.asp = 0.8, fig.width = 7))

  # #Max Resolution plots for ggsave()
  q_width <- 14
  q_height <- {9/16} * q_width

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
} else print("Knitr not loaded again.")

