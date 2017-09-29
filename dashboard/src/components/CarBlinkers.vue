<template>
  <toggler title="Car blinkers"
           v-bind:statusTexts="['Off', 'Blinking']"
           v-bind:statusStyles="['', 'is-warning']"
           v-bind:buttonTexts="['Blink', '']"
           v-bind:active="state"
           v-on:toggled="change">
  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
export default {
  name: 'carblinkers',
  components: {
    Toggler
  },
  methods: {
    change (status) {
      this.state = true
      setTimeout(() => {
        this.state = false
      }, 2000)
    }
  },
  props: {
    locked: {
      type: Boolean,
      default: true
    }
  },
  data () {
    return {
      state: false
    }
  }
}
</script>
