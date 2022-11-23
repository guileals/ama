// map_controller.js
import { Controller } from "@hotwired/stimulus"
import "leaflet-css"

export default class extends Controller {
  static targets = [ "placeholder" ]

  connect(){
    import("leaflet").then( L => {
      // this.map = L.map(this.placeholderTarget,{zoomDelta:0.5,zoomSnap:0.5}).setView([51.505, -0.09], 16);
      // alert(gon.lat)
      // alert(gon.long)
      this.map = L.map(this.placeholderTarget,{zoomDelta:0.5,zoomSnap:0.5}).setView([gon.lat, gon.long], 16);
      // L.marker([51.5, -0.09]).addTo(this.map);
      
      var colorRes = '';
      var colorResFill = '';
      
      if(gon.res){
        colorRes = 'green';
        colorResFill = '#0f3';
      } else {
        colorRes = 'red';
        colorResFill = '#f03';
      }
      
      var circle = L.circle([gon.lat, gon.long], {
        color: colorRes,
        fillColor: colorResFill,
        fillOpacity: 0.5,
        radius: 10
      }).addTo(this.map);

      var popup = L.popup()
      .setLatLng([gon.lat, gon.long])
      .setContent("Local do poço")
      .openOn(this.map);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(this.map);
    });
  }

  disconnect(){
    this.map.remove()
  }

}