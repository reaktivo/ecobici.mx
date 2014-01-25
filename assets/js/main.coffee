
{ Map, LatLng } = google.maps

class App

  mapOptions:
    center: new LatLng(20.6531929, -103.3896683)
    zoom: 8

  constructor: ->
    console.log this
    # window.on 'deviceorientation', @direction
    @locate()
    $(window).load @build

  build: =>
    @map = new Map document.getElementById('map'), @mapOptions


  locate: =>
    if Modernizr.geolocation
      navigator.geolocation.getCurrentPosition (pos) ->
        lat = pos.coords.latitude
        lng = pos.coords.longitude
        console.log lat, lng

  direction: =>
    console.log 'compass', e.webkitCompassHeading


jQuery(document).ready ->
  window.app = new App()