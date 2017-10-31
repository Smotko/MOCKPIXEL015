<template>
  <toggler title="Tracking"
           v-bind:statusTexts="['Inactive', 'Active']"
           v-bind:statusStyles="['is-warning', 'is-primary']"
           v-bind:buttonTexts="['Activate', 'Deactivate']"
           v-bind:active="tracking"
           v-bind:loading="loading"
           v-on:toggled="onToggled">
  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
export default {
  name: 'carlock',
  components: {
    Toggler
  },
  methods: {
    onToggled () {
      this.loading = true
      this.tracking = !this.tracking
      fetch('/api/set_tracking', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({tracking: +this.tracking})
      }).then(() => {
        this.loading = false
      }).catch(() => {
        console.log('Something went wrong')
        this.tracking = !this.tracking
        this.loading = false
      })
    }
  },
  data () {
    return {
      tracking: false,
      loading: false
    }
  }
}
</script>
