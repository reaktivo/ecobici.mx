
{ Map, LatLng, Marker } = google.maps

class App

  mapOptions:
    center: new LatLng(20.6531929, -103.3896683)
    zoom: 13

  constructor: ->
    console.log this
    # window.on 'deviceorientation', @direction
    $(window).load @build

  build: =>
    @map = new Map document.getElementById('map'), @mapOptions
    do @locate

  locate: =>
    if Modernizr.geolocation
      navigator.geolocation.getCurrentPosition (pos) =>
        { latitude, longitude } = pos.coords
        latlng = new LatLng(latitude, longitude)
        @me = new Marker(map: @map, position: latlng)


  direction: =>
    console.log 'compass', e.webkitCompassHeading


jQuery(document).ready ->
  window.app = new App()