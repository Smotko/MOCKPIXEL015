<template>
  <toggler title="Tracking"
           v-bind:statusTexts="['Inactive', 'Active']"
           v-bind:statusStyles="['is-warning', 'is-primary']"
           v-bind:buttonTexts="['Activate', 'Diactivate']"
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
      // Replace setTimeout with fetch request
      setTimeout(() => {
        this.loading = false
      }, 500)
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
