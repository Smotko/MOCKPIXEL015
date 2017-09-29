<template>

  <card title="Geofence" v-bind:content="enabled ? 'Enabled' : 'Disabled'" v-bind:status="enabled ? 'is-primary' : ''">
    <a v-if="enabled" class="button"  v-on:click="modalShown = true">Edit</a>
    <a v-if="enabled" class="button"  v-on:click="enabled = !enabled">Disable</a>
    <a v-else class="button" v-on:click="modalShown = true">Enable</a>
    <modal title="Set geofence"
           acceptButton="Save"
           acceptClass="is-primary"
           :shown="modalShown"
           v-on:cancel="modalShown = false"
           v-on:accept="modalDone">
      <div id="map-canvas"></div>
    </modal>
  </card>

</template>

<script>
import Card from '@/components/Card'
import Modal from '@/components/Modal'

export default {
  name: 'cargeofence',
  components: {
    Card,
    Modal
  },
  data () {
    return {
      modalShown: false,
      enabled: false
    }
  },
  updated () {
    window.google.maps.event.trigger(this.map, 'resize')
  },
  methods: {
    modalDone () {
      this.modalShown = false
      this.enabled = true
    }
  },
  mounted () {
    // TODO: remove the global google variable
    var google = window.google
    var myLatLng = new google.maps.LatLng(38.96502, -9.64162)
    // General Options
    var mapOptions = {
      zoom: 10,
      center: myLatLng,
      mapTypeId: google.maps.MapTypeId.RoadMap
    }
    this.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)
    // Polygon Coordinates
    var triangleCoords = [
      new google.maps.LatLng(38.75114, -9.34499),
      new google.maps.LatLng(38.67158, -9.32714),
      new google.maps.LatLng(38.72222, -9.10775),
      new google.maps.LatLng(38.80895, -9.09866)
    ]
    // Styling & Controls
    var myPolygon = new google.maps.Polygon({
      paths: triangleCoords,
      draggable: true, // turn off if it gets annoying
      editable: true,
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35
    })

    myPolygon.setMap(this.map)

    // // google.maps.event.addListener(myPolygon, "dragend", getPolygonCoords);
    // google.maps.event.addListener(myPolygon.getPath(), "insert_at", getPolygonCoords);
    // // google.maps.event.addListener(myPolygon.getPath(), "remove_at", getPolygonCoords);
    // google.maps.event.addListener(myPolygon.getPath(), "set_at", getPolygonCoords);
  }
}
</script>

<style>
#map-canvas {
  height: 400px;
}
</style>
