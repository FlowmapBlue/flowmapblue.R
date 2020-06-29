HTMLWidgets.widget({

  name: 'flowmapblue',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        flowmapBlue.init({
          locations: HTMLWidgets.dataframeToD3(x.locations),
          flows: HTMLWidgets.dataframeToD3(x.flows),
          container: el,
          mapboxAccessToken: x.mapboxAccessToken,
          clustering: x.clustering,
          animation: x.animation,
          darkMode: x.darkMode,
        });
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }

    };
  }
});
