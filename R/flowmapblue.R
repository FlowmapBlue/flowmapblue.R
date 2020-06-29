#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
flowmapblue <- function(
  locations, flows,
  mapboxAccessToken = NULL,
  clustering = TRUE,
  animation = FALSE,
  darkMode = FALSE
) {

  # pass the data and settings using 'x'
  x <- list(
    locations = locations,
    flows = flows,
    mapboxAccessToken = mapboxAccessToken,
    clustering = clustering,
    animation = animation,
    darkMode = darkMode
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'flowmapblue',
    x,
    width = NULL,
    height = NULL,
    package = 'flowmapblue'
  )
}

#' Shiny bindings for flowmapblue
#'
#' Output and render functions for using flowmapblue within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a flowmapblue
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name flowmapblue-shiny
#'
#' @export
flowmapblueOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'flowmapblue', width, height, package = 'flowmapblue')
}

#' @rdname flowmapblue-shiny
#' @export
renderFlowmapblue <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, flowmapblueOutput, env, quoted = TRUE)
}
