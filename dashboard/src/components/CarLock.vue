<template>
  <toggler title="Car doors"
           v-bind:statusTexts="['Unlocked', 'Locked']"
           v-bind:statusStyles="['', 'is-primary']"
           v-bind:buttonTexts="['Lock', 'Unlock']"
           v-bind:active="locked"
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
      this.locked = !this.locked

      fetch('/api/set_lock', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({lock: +this.locked})
      }).then(() => {
        this.loading = false
      }).catch(() => {
        console.log('Something went wrong')
        this.locked = !this.locked
        this.loading = false
      })
    }
  },
  data () {
    return {
      locked: true,
      loading: false
    }
  }
}
</script>
