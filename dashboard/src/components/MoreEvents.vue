<template>
  <div>
    <a href="#" v-on:click="onShow">More</a>
    <modal title="All events"
           acceptButton="Done"
           acceptClass=""
           :shown="modalShown"
           v-on:cancel="modalShown = false"
           v-on:accept="modalShown = false">
    <div v-if="loading" class="more-spinner"><spinner></spinner></div>
    <div v-else v-for="event in events">
      <event-item :type="event.type" :time="event.time" :info="event.info"></event-item>
    </div>
    </modal>
  </div>
</template>

<script>
import Modal from '@/components/Modal'
import EventItem from '@/components/EventItem'
import Spinner from '@/components/Spinner'
export default {
  name: 'moreevents',
  components: {
    Modal,
    EventItem,
    Spinner
  },
  data () {
    const events = []
    const options = [{
      type: 'info',
      info: 'Parental scheduler engaged the immobilizer'
    }, {
      type: 'info',
      info: 'Vehicle returned to geofence zone'
    }, {
      type: 'warning',
      info: 'Mileage limit exceeded'
    }, {
      type: 'warning',
      info: 'Vehicle left geofence'
    }, {
      type: 'info',
      info: 'Parental controls activated'
    }]
    for (let i = 0; i < 100; i++) {
      let rnd = Math.floor(Math.random() * options.length)
      events.push({
        ...options[rnd],
        time: ((i) => {
          if (i < 9) {
            return Math.floor(i * 6.56) + 's'
          } else if (i < 29) {
            return Math.floor((i - 8) * 1.95) + 'min'
          } else {
            return Math.floor((1 + 0.1 * (i - 29))) + 'h'
          }
        })(i)
      })
    }
    return {
      modalShown: false,
      events: events,
      loading: true
    }
  },
  methods: {
    onShow () {
      this.modalShown = true
      setTimeout(() => {
        this.loading = false
      }, 1200)
    }
  }
}
</script>

<style>
.more-spinner {
  text-align: center;
  font-size: 3em;
}
</style>
