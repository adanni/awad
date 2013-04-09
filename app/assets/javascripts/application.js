// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs


var geocoder;
var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var address = gon.mypostcode;    
    geocoder.geocode( { 'address': address },  function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var input = results[0].geometry.location;
        var a = '"'+ input +'"';  
        var split_result = a.split(",",2);
        var get_lat = split_result[0];
        var get_lng = split_result[1];
        var lat = get_lat.match(/\d+.\d+/).toString();
        var lng = get_lng.match(/\D\d+.\d+/).toString();
        var loc = new google.maps.LatLng(lat, lng);
        var mapOptions = {
          zoom: 15,
          center: loc,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('pano'),
            mapOptions);
      
      } else {
           document.write('<div id="map_error">'+'<h1>Geocode was not successful for the following reason: + status</h1>'+status+'</div>');
      }
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
