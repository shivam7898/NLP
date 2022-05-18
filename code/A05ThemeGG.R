## ---- A05 ----
# # source(here::here("code", "A05ThemeGG.R")) ===================================================#
if (!("ggplot2" %in% (.packages()))) library("ggplot2")

## ---- A05A-ThemeGG ----
f_theme_gg <- function(base_size = 14) {
  # #Function to modify a Default GGPlot Theme 
  theme_bw(base_size = base_size) %+replace%
    theme(
      #The whole figure
      plot.title = element_text(size = rel(1), face = "bold", margin = margin(0,0,5,0), hjust = 0),
      plot.title.position = "panel", 
      #Area where the graph is located
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = "grey", size = 0.2),
      panel.border = element_rect(colour = "black", fill = NA, size = 1),
      #The axes
      axis.title = element_text(size = rel(0.85), face = "bold"),
      axis.text = element_text(size = rel(0.70), face = "bold"),
      axis.line = element_blank(),
      #The legend
      legend.title = element_text(size = rel(0.85), face = "bold"),
      legend.text = element_text(size = rel(0.70), face = "bold"),
      legend.key = element_rect(fill = "transparent", colour = NA),
      legend.key.size = unit(1.5, "lines"),
      legend.background = element_rect(fill = "transparent", colour = NA),
      #Labels in Facets
      strip.background = element_rect(fill = "#17252D", color = "#17252D"),
      strip.text = element_text(size = rel(0.85), face = "bold", 
                                color = "white", margin = margin(5,0,5,0))
    )
  # #xxCLOSE: f_theme_gg()
}

## ---- A05B-SetThemeGG ----
# #Change default GGplot theme 
theme_set(f_theme_gg()) 

## ---- A05Z ----
# #f_rmExist()