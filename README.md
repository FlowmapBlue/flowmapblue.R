# Flowmap.blue R widget

This is an R widget for [Flowmap.blue](http://flowmap.blue).
The widget is made for rendering interactive flow maps showing numbers of movements between locations (origin-destination data).

![image](https://user-images.githubusercontent.com/351828/86061814-bb993800-ba67-11ea-9e76-90a75f813327.png)

#### Installation

You can install the package from GitHub as follows:

    devtools::install_github("FlowmapBlue/flowmapblue.R")
    library(flowmapblue)
    


#### Usage

    locations <- read.csv('https://gist.githubusercontent.com/ilyabo/a7b9701424257146b571149d92a14926/raw/2e9e1e9bcf64cf0090781b451037229ccb78e1b1/locations.csv')
    flows <- read.csv('https://gist.githubusercontent.com/ilyabo/a7b9701424257146b571149d92a14926/raw/2e9e1e9bcf64cf0090781b451037229ccb78e1b1/flows.csv')
    mapboxAccessToken = 'YOUR_MAPBOX_ACCESS_TOKEN'
    flowmapblue(locations, flows, mapboxAccessToken, clustering=TRUE, darkMode=TRUE, animation=FALSE)
