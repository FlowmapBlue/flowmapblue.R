# Install required packages if not already installed
if (!requireNamespace("hexSticker", quietly = TRUE)) install.packages("hexSticker")
if (!requireNamespace("magick", quietly = TRUE)) install.packages("magick")

library(hexSticker)
library(magick)


# Save the SVG to a temporary file
raw_svg <- "man/figures/logo_raw.svg"


# Create the hex sticker function
create_sticker <- function(file_name) {
  sticker(raw_svg,
    package = "{flowmapblue}",
    p_size = 5.5, 
    p_y = 1.5,
    p_color = "#1A70A7", 
    p_family = "sans",
    s_x = 1, 
    s_y = 0.86, 
    s_width = 0.5,
    s_height = 0.5,
    h_fill = "white", 
    h_color = "#1A70A7",
    url = "github.com/FlowmapBlue/flowmapblue.R",
    u_color = "#1A70A7",
    u_family = "sans",
    u_size = 1.3,
    filename = file_name,
    dpi = 300
  )
  
}

create_sticker("man/figures/logo.png")
create_sticker("man/figures/logo.svg")
