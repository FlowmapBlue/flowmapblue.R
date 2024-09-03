#' Create an interactive flow map
#'
#' @description
#' Creates an interactive flow map visualizing flows between various locations and outputs it as an HTML widget. This function utilizes the \href{https://www.flowmap.blue/}{`FlowmapBlue`} library to create maps with customizable options such as clustering, animation, and dark mode. The widget can be rendered in R Markdown, Shiny, or viewed in a browser. It can also be saved to `html` file with \code{\link[htmlwidgets:saveWidget]{htmlwidgets:saveWidget()}}. See examples for more details.
#'
#' @param locations A `data.frame` containing the location data. The `data.frame` should have the following columns:
#' \describe{
#'   \item{id}{A character vector representing the unique identifier for each location (e.g., "JU", "LU").}
#'   \item{name}{(Optional) A character vector representing the name of each location (e.g., "Jura", "Luzern").}
#'   \item{lat}{A numeric vector representing the latitude of each location in WGS84 (EPSG: 4326) coordinate reference system.}
#'   \item{lon}{A numeric vector representing the longitude of each location in WGS84 (EPSG: 4326) coordinate reference system.}
#' }
#'
#' @param flows A `data.frame` containing the flow data between locations. The `data.frame` should have the following columns:
#' \describe{
#'   \item{origin}{A `character` vector representing the origin location identifier (must match the `id` in `locations`).}
#'   \item{dest}{A `character` vector representing the destination location identifier (must match the `id` in `locations`).}
#'   \item{count}{An `integer` vector representing the flow count between the origin and destination locations.}
#'   \item{time}{(Optional) A vector of `POSIXct` or `Date` objects representing the date or date and time of the flow.}
#' }
#'
#' @param mapboxAccessToken A `character` string representing the Mapbox access token. This is required to render the map using Mapbox tiles. You can obtain a free token at \href{https://account.mapbox.com/}{https://account.mapbox.com/}.
#' @param clustering A `logical` value indicating whether to enable clustering of locations on the map. Defaults to `TRUE`.
#' @param animation A `logical` value indicating whether to enable animation of flows on the map. Defaults to `FALSE`.
#' @param darkMode A `logical` value indicating whether to enable dark mode for the map. Defaults to `FALSE`.
#'
#' @return An HTML widget of class `flowmapblue` and `htmlwidget` that can be rendered in R Markdown, Shiny, or viewed in a browser. It can also be saved to `html` file with \code{\link[htmlwidgets:saveWidget]{htmlwidgets:saveWidget()}}. See examples for more details.
#'
#' @examples
#' \dontrun{
#' # example 1, normal flows
#' # set your Mapbox access token
#' Sys.setenv(MAPBOX_API_TOKEN = "YOUR_MAPBOX_ACCESS_TOKEN")
#' 
#' # load locations and flows for Switzerland
#' locations <- data(ch_locations)
#' flows <- data(ch_flows)
#'
#' flowmap <- flowmapblue(
#'  locations,
#'  flows,
#'  mapboxAccessToken = Sys.getenv('MAPBOX_API_TOKEN'),
#'  clustering = TRUE,
#'  darkMode = TRUE,
#'  animation = FALSE
#' )
#' 
#' # view the map
#' flowmap
#' 
#' # or save it as an HTML file
#' htmlwidgets::saveWidget(flowmap, file = "flowmap.html")
#' 
#' # example 2, flows with date in time column
#' # set your Mapbox access token
#' Sys.setenv(MAPBOX_API_TOKEN = "YOUR_MAPBOX_ACCESS_TOKEN")
#' 
#' # load locations and flows for Switzerland
#' locations <- data(ch_locations)
#' flows <- data(ch_flows)
#' 
#' # generate fake datetime
#' flows$time <- seq(from =as.POSIXct("2020-01-01"),
#'   to = as.POSIXct("2020-01-05"), length.out = nrow(flows))
#'
#' flowmap <- flowmapblue(
#'  locations,
#'  flows,
#'  mapboxAccessToken = Sys.getenv('MAPBOX_API_TOKEN'),
#'  clustering = TRUE,
#'  darkMode = TRUE,
#'  animation = FALSE
#' )
#' 
#' # view the map
#' flowmap
#' 
#' # example 3, flows with date in time column
#' # set your Mapbox access token
#' Sys.setenv(MAPBOX_API_TOKEN = "YOUR_MAPBOX_ACCESS_TOKEN")
#' 
#' # load locations and flows for Switzerland
#' locations <- data(ch_locations)
#' flows <- data(ch_flows)
#' # generate fake dates
#' flows$time <- seq(from = as.Date("2020-01-01"),
#'   to = as.Date("2020-06-01"), length.out = nrow(flows))
#'
#' flowmap <- flowmapblue(
#'  locations,
#'  flows,
#'  mapboxAccessToken = Sys.getenv('MAPBOX_API_TOKEN'),
#'  clustering = TRUE,
#'  darkMode = TRUE,
#'  animation = FALSE
#' )
#' 
#' # view the map
#' flowmap
#' }
#'
#' @import htmlwidgets
#' @export
flowmapblue <- function(
  locations, flows,
  mapboxAccessToken = NULL,
  clustering = TRUE,
  animation = FALSE,
  darkMode = FALSE
) {
  
  # convert time columng to UNIX time in milliseconds
  if ("time" %in% colnames(flows)) {
    if (inherits(flows$time, "POSIXct")) {
      flows$time <- as.numeric(flows$time) * 1000
    }
    if (inherits(flows$time, "Date")) {
      flows$time <- as.numeric(as.POSIXct(flows$time)) * 1000
    }
  }

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
    package = 'flowmapblue',
    sizingPolicy = sizingPolicy(
      padding = 0,
      browser.padding = 0
    )
  )
}

#' Shiny bindings for flowmapblue
#'
#' Output and render functions for using flowmapblue within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'}, 
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a `flowmapblue` widget.
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @return
#' \describe{
#'   \item{\code{flowmapblueOutput}}{Returns a `shiny.tag.list` object that can be included in a Shiny UI to display the `flowmapblue` widget.}
#'   \item{\code{renderFlowmapblue}}{Returns a `shiny.render.function` that is used to generate the `flowmapblue` widget on the server side in a Shiny application.}
#' }
#'
#' @seealso \code{\link[htmlwidgets:shinyWidgetOutput]{shinyWidgetOutput}}, \code{\link[htmlwidgets:shinyRenderWidget]{shinyRenderWidget}}
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
