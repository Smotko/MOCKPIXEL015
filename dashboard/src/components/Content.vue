<template>
  <div class="container is-fluid">

    <div class="tile is-ancestor">
      <div class="tile is-vertical is-12">
        <div calss="tile">
          <h1 class="title">Car controls</h1>
        </div>
        <div class="tile">
          <CarParentalControl v-bind:enabled="false"></CarParentalControl>
          <CarLock v-bind:locked="false"></CarLock>
          <CarGeofence v-bind:enabled="false"></CarGeofence>
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
export default {
  name: 'content',
  components: {
    Card,
    CarLock,
    CarParentalControl,
    CarGeofence
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
