#' Swiss Locations Dataset
#'
#' A dataset containing geographic information about 26 locations in Switzerland. This data includes unique identifiers, names, and geographic coordinates (latitude and longitude) for each location.
#'
#' @format ## `ch_locations`
#' A data frame with 26 rows and 4 columns:
#' \describe{
#'   \item{id}{A `character` vector representing the unique identifier for each Swiss location (e.g., "JU", "LU").}
#'   \item{name}{A `character` vector representing the name of each location (e.g., "Jura", "Luzern").}
#'   \item{lat}{A `numeric` vector representing the latitude of each location in WGS84 (EPSG: 4326) coordinate reference system.}
#'   \item{lon}{A `numeric` vector representing the longitude of each location in WGS84 (EPSG: 4326) coordinate reference system.}
#' }
"ch_locations"

#' Swiss Flows Dataset
#'
#' A dataset containing flow data between various locations in Switzerland. This data represents the flow counts between origin and destination locations, identified by their unique codes.
#'
#' @format ## `ch_flows`
#' A data frame with 676 rows and 3 columns:
#' \describe{
#'   \item{origin}{A `character` vector representing the origin location identifier (must match the `id` in the `ch_locations` dataset).}
#'   \item{dest}{A `character` vector representing the destination location identifier (must match the `id` in the `ch_locations` dataset).}
#'   \item{count}{An `integer` vector representing the flow count between the origin and destination locations.}
#' }
"ch_flows"
