<template>
  <div class="container is-fluid">
    <div class="tile is-ancestor">
      <div class="tile is-vertical is-12">
        <div class="tile">
          <card title="Car status" content="All OK" status="is-primary"></card>
          <card title="Parental controls" content="Off" status="is-warning"></card>
          <card title="Geofence" content="Not defined"></card>
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
</style>
