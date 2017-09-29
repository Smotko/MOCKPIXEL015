<template>
  <toggler title="Car doors"
           v-bind:statusTexts="['Unlocked', 'Locked']"
           v-bind:statusStyles="['', 'is-primary']"
           v-bind:buttonTexts="['Lock', 'Unlock']"
           v-bind:active="locked"
           v-on:toggled="locked = !locked">
  </toggler>
</template>

<script>
import Toggler from '@/components/Toggler'
export default {
  name: 'carlock',
  components: {
    Toggler
  },
  data () {
    return {
      locked: true
    }
  }
}
</script>
