<template>
  <div class="container is-fluid">

    <div class="tile is-ancestor">
      <div class="tile is-vertical is-12">
        <div calss="tile">
          <h1 class="title">Parental controls</h1>
        </div>
        <div class="tile">
          <card title="Car status" content="All OK" status="is-primary"></card>
          <card title="Parental controls" content="Off" status="is-warning"></card>
          <card title="Geofence" content="Not defined"></card>
        </div>
        <div class="tile">
          <h1 class="title">Car overview</h1>
        </div>
        <div class="tile">
          <card title="Engine" content="Off"></card>
          <card title="Fuel level" content="90%" status="is-primary"></card>
          <card title="Milage" content="1337"></card>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import Card from '@/components/Card'
export default {
  name: 'content',
  components: {
    Card
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
