# Flowmap.blue R widget

WORK IN PROGRESS

This is a [Flowmap.blue](http://flowmap.blue) widget for R.
It produces an interactive flow map representing numbers of movements between locations (origin-destination data).

![image](https://user-images.githubusercontent.com/351828/86061814-bb993800-ba67-11ea-9e76-90a75f813327.png)

As an alternative, you may also consider using R to populate a spreadsheet for publishing on [Flowmap.blue](http://flowmap.blue)
as described in this [excellent blog post](https://doodles.mountainmath.ca/blog/2020/01/06/flow-maps/).

### Installation
You need to install `devtools` if you don't have it yet:

    install.packages("devtools")

You can install the package from GitHub as follows:

    devtools::install_github("FlowmapBlue/flowmapblue.R")
    library(flowmapblue)
    


### Usage

    locations <- read.csv('https://gist.githubusercontent.com/ilyabo/a7b9701424257146b571149d92a14926/raw/2e9e1e9bcf64cf0090781b451037229ccb78e1b1/locations.csv')
    flows <- read.csv('https://gist.githubusercontent.com/ilyabo/a7b9701424257146b571149d92a14926/raw/2e9e1e9bcf64cf0090781b451037229ccb78e1b1/flows.csv')
    mapboxAccessToken <- 'YOUR_MAPBOX_ACCESS_TOKEN'
    flowmapblue(locations, flows, mapboxAccessToken, clustering=TRUE, darkMode=TRUE, animation=FALSE)


Here is a [nice intro blog post](https://www.paulamoraga.com/blog/2020/07/11/2020-07-11-mobility/) by Paula Moraga.
