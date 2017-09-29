<template>
  <div class="container is-fluid">

    <div class="tile is-ancestor">
      <div class="tile is-vertical is-12">
        <div calss="tile">
          <h1 class="title">Car controls</h1>
        </div>
        <div class="tile">
          <car-tracking></car-tracking>
          <car-lock></car-lock>
          <car-geofence v-bind:initialState="false"></car-geofence>
        </div>
        <div class="tile">
          <car-immobilizer></car-immobilizer>
          <car-blinkers></car-blinkers>
        </div>
        <div class="tile">
          <h1 class="title">Car overview</h1>
        </div>
        <div class="tile">
          <card title="Engine" content="Off"></card>
          <card title="Fuel level" content="90%" status="is-primary"></card>
          <card title="Milage" content="1337" status="is-info"></card>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import Card from '@/components/Card'
import CarLock from '@/components/CarLock'
import CarParentalControl from '@/components/CarParentalControl'
import CarGeofence from '@/components/CarGeofence'
import CarBlinkers from '@/components/CarBlinkers'
import CarTracking from '@/components/CarTracking'
import CarImmobilizer from '@/components/CarImmobilizer'
import Toggler from '@/components/Toggler'
export default {
  name: 'dashboardcontent',
  components: {
    Card,
    CarBlinkers,
    CarLock,
    CarParentalControl,
    CarGeofence,
    CarTracking,
    CarImmobilizer,
    Toggler
  },
  data () {
    return {}
  }
}
</script>

<style>
.container {
  padding: 10px 0;
}
h1 {
  padding: 20px 10px;
}
</style>
