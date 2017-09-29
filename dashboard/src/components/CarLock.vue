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
      // Replace setTimeout with fetch request
      setTimeout(() => {
        this.loading = false
      }, 500)
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
