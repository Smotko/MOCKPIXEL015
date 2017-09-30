<template>
  <div class="container is-fluid">

    <div class="tile is-ancestor">
      <div v-if="!loading && car && car.connection.connected" class="tile is-vertical is-12">
        <div calss="tile">
          <h1 class="title">Parental controls</h1>
        </div>
        <div class="tile">
          <scheduler></scheduler>
          <card title="Recent events">
            <event-item type="info" time="12m" info="Parental scheduler engaged the immobilizer"></event-item>
            <event-item type="info" time="40m" info="Vehicle returned to geofence zone"></event-item>
            <event-item type="warning" time="2h" info="Mileage limit exceeded"></event-item>
            <event-item type="warning" time="2h" info="Vehicle left geofence"></event-item>
            <more-events></more-events>
          </card>
        </div>
        <div class
        <div calss="tile">
          <h1 class="title">Car controls</h1>
        </div>
        <div class="tile">
          <car-tracking></car-tracking>
          <car-lock></car-lock>
          <car-geofence></car-geofence>
        </div>
        <div class="tile">
          <car-immobilizer></car-immobilizer>
          <car-blinkers></car-blinkers>
        </div>
        <div class="tile">
          <h1 class="title">Car overview</h1>
        </div>
        <div class="tile">
          <card title="Engine" v-bind:content="car.engineOn ? 'On': 'Off'"></card>
          <card title="Fuel level" v-bind:content="car.fuelLevel + '%'" status="is-primary"></card>
          <card title="Milage" :content="car.mileage" status="is-info"></card>
        </div>
      </div>
      <div v-else-if="serverIssue" class="tile is-vertical is-12">
        <div calss="tile">
          <card title="Issue" content="Server Offline" status="is-danger"></card>
        </div>
      </div>
      <div v-else-if="car && !car.connection.connected" class="tile is-vertical is-12">
        <div calss="tile">
          <card title="Car status" :content="'Disconnected since ' + car.connection.since" status="is-danger"></card>
        </div>
      </div>
      <div v-else class="tile is-vertical is-12">
        <h1 class="loading"><spinner></spinner> Loading...</h1>
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
import EventItem from '@/components/EventItem'
import Toggler from '@/components/Toggler'
import Spinner from '@/components/Spinner'
import Scheduler from '@/components/Scheduler'
import MoreEvents from '@/components/MoreEvents'

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
    EventItem,
    MoreEvents,
    Spinner,
    Scheduler,
    Toggler
  },
  data () {
    return {
      loading: true,
      serverIssue: false,
      car: null
    }
  },
  mounted () {
    fetch('http://localhost:5000/api/get_car').then((res) => {
      return res.json()
    }).then((json) => {
      this.car = json
      this.loading = false
    }).catch(() => {
      this.serverIssue = true
    })
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
.loading {
  text-align: center;
}
</style>
